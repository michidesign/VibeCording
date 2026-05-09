'use strict';

let extractedText = '';
let scrollPolling = null;

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('btnScroll').addEventListener('click', startScroll);
  document.getElementById('btnAbort').addEventListener('click', abortScroll);
  document.getElementById('btnDownload').addEventListener('click', downloadTxt);
  document.getElementById('btnCopy').addEventListener('click', copyToClipboard);
  checkPageStatus();
});

// =====================================================
// ステータス確認
// =====================================================

async function checkPageStatus() {
  const tab = await getActiveTab();
  if (!tab) return;

  const isTeams = /sharepoint\.com|teams\.microsoft\.com|office\.com/i.test(tab.url || '');
  setStatus('dotPage', 'statusPage',
    isTeams ? 'Teams / SharePoint' : '対象外ページ',
    isTeams ? 'green' : 'red'
  );
  if (!isTeams) { log('⚠️ このページは対象外です'); return; }

  // スクロール可能なトランスクリプトコンテナを確認
  try {
    const info = await execInMainWorld(tab.id, () => {
      const els = Array.from(document.querySelectorAll('*')).filter(el => {
        if (el === document.body || el === document.documentElement) return false;
        const s = getComputedStyle(el);
        return (s.overflowY === 'auto' || s.overflowY === 'scroll') &&
               el.scrollHeight > el.clientHeight + 50 &&
               el.clientHeight > 50;
      });
      return els.length;
    });
    setStatus('dotContainer', 'statusContainer',
      info > 0 ? `${info}個検出` : '未検出',
      info > 0 ? 'green' : 'yellow'
    );
    if (info === 0) log('⚠️ トランスクリプトパネルが見つかりません。パネルを開いてから再度お試しください。');
  } catch (_) {
    setStatus('dotContainer', 'statusContainer', '確認不可', 'gray');
  }
}

// =====================================================
// 自動スクロール抽出
// =====================================================

async function startScroll() {
  const tab = await getActiveTab();
  setBtn('btnScroll', false, 'スクロール中...');
  document.getElementById('btnAbort').style.display = 'block';
  document.getElementById('progressWrap').style.display = 'block';
  showLog();
  log('🔄 自動スクロールを開始します...');

  // 進捗ポーリング
  scrollPolling = setInterval(async () => {
    try {
      const p = await execInMainWorld(tab.id, () => window.__teamsScrollProgress || null);
      if (p) {
        document.getElementById('progressBar').style.width = Math.round(p.pct) + '%';
        document.getElementById('countInfo').textContent = `収集済み: ${p.count}件 (${Math.round(p.pct)}%)`;
      }
    } catch (_) {}
  }, 800);

  try {
    const result = await chrome.scripting.executeScript({
      target: { tabId: tab.id },
      world: 'MAIN',
      func: async () => {
        window.__teamsScrollProgress = { pct: 0, count: 0, abort: false };

        // ── 1. スクロール可能な内側要素を特定 ──────────────────
        function findScrollable(root) {
          const children = Array.from(root.querySelectorAll('*'))
            .filter(el => {
              if (el === document.body || el === document.documentElement) return false;
              const s = getComputedStyle(el);
              return (s.overflowY === 'auto' || s.overflowY === 'scroll') &&
                     el.scrollHeight > el.clientHeight + 30 &&
                     el.clientHeight > 30;
            })
            .sort((a, b) => (b.scrollHeight - b.clientHeight) - (a.scrollHeight - a.clientHeight));
          return children[0] || null;
        }

        const PRIORITY_SELS = [
          '[data-automationid="transcriptContainer"]',
          '[class*="transcriptPane"]', '[class*="transcript-pane"]',
          '[class*="TranscriptPane"]',
          '[class*="transcript"][class*="container"]',
          '[class*="transcript"][class*="list"]',
          '[class*="transcript"][class*="panel"]',
          '[class*="transcript"][class*="scroll"]',
          '[aria-label*="Transcript"]', '[aria-label*="transcript"]',
          '[aria-label*="トランスクリプト"]',
        ];

        let container = null;
        for (const sel of PRIORITY_SELS) {
          try {
            const outer = document.querySelector(sel);
            if (outer) {
              const inner = findScrollable(outer);
              if (inner) { container = inner; break; }
              // 外側自体がスクロール可能な場合
              const s = getComputedStyle(outer);
              if ((s.overflowY === 'auto' || s.overflowY === 'scroll') &&
                  outer.scrollHeight > outer.clientHeight + 30) {
                container = outer; break;
              }
            }
          } catch (_) {}
        }

        // 優先セレクタで見つからない場合: 全体から時刻テキスト含む要素を探す
        if (!container) {
          const all = Array.from(document.querySelectorAll('*'))
            .filter(el => {
              if (el === document.body || el === document.documentElement) return false;
              const s = getComputedStyle(el);
              return (s.overflowY === 'auto' || s.overflowY === 'scroll') &&
                     el.scrollHeight > el.clientHeight + 100 &&
                     el.clientHeight > 50;
            })
            .sort((a, b) => (b.scrollHeight - b.clientHeight) - (a.scrollHeight - a.clientHeight));

          for (const el of all.slice(0, 20)) {
            if (/\d{1,2}:\d{2}/.test(el.innerText || '')) { container = el; break; }
          }
          if (!container && all.length > 0) container = all[0];
        }

        if (!container) {
          return { success: false, error: 'トランスクリプトコンテナが見つかりません。\nトランスクリプトパネルを開いてから再試行してください。' };
        }

        const containerInfo = `<${container.tagName}> "${(container.className || '').toString().slice(0,60)}" range=${container.scrollHeight - container.clientHeight}px`;

        // ── 2. アイテム収集 ────────────────────────────────────
        const collected = new Map();

        function collectItems() {
          const ITEM_SELS = [
            '[role="listitem"]', '[role="article"]', '[data-list-index]',
            '[class*="transcriptItem"]', '[class*="TranscriptItem"]',
            '[class*="transcript"][class*="item"]', '[class*="utterance"]',
          ];

          let items = [];
          for (const sel of ITEM_SELS) {
            const found = container.querySelectorAll(sel);
            if (found.length > 0) { items = Array.from(found); break; }
          }
          if (items.length === 0) {
            items = Array.from(container.children).filter(el => (el.innerText?.trim() || '').length > 5);
          }
          if (items.length === 0) {
            items = Array.from(container.querySelectorAll('div, p'))
              .filter(el => {
                const t = el.innerText?.trim() || '';
                return t.length > 5 && t.length < 500;
              });
          }

          items.forEach(el => {
            const raw = el.innerText?.trim() || '';
            if (!raw || raw.length < 3 || collected.has(raw)) return;

            const lines = raw.split('\n').map(l => l.trim()).filter(Boolean);
            let speaker = null, time = null;
            const textLines = [];

            lines.forEach((line, idx) => {
              if (!time && /^\d{1,2}(:\d{2}){1,2}$/.test(line)) {
                time = line;
              } else if (!speaker && idx < 2 && line.length < 60) {
                speaker = line;
              } else {
                textLines.push(line);
              }
            });

            const text = textLines.length > 0 ? textLines.join(' ') : lines.join(' ');
            collected.set(raw, { text, speaker, time });
          });
        }

        // ── 3. MutationObserver でDOM更新を待つ ──────────────
        let mutated = false;
        const observer = new MutationObserver(() => { mutated = true; });
        observer.observe(container, { childList: true, subtree: true });

        async function waitMutation(maxMs) {
          return new Promise(resolve => {
            const end = Date.now() + maxMs;
            const t = setInterval(() => {
              if (mutated || Date.now() >= end) {
                clearInterval(t);
                mutated = false;
                resolve();
              }
            }, 50);
          });
        }

        // ── 4. スクロール実行 ─────────────────────────────────
        container.scrollTop = 0;
        await new Promise(r => setTimeout(r, 800));
        collectItems();

        const STEP = Math.max(Math.floor(container.clientHeight * 0.75), 150);
        let iter = 0;

        while (iter < 2000) {
          if (window.__teamsScrollProgress?.abort) break;

          const maxScroll = container.scrollHeight - container.clientHeight;
          window.__teamsScrollProgress = {
            pct: maxScroll > 0 ? Math.min(99, (container.scrollTop / maxScroll) * 100) : 0,
            count: collected.size,
            abort: false,
          };

          if (container.scrollTop + container.clientHeight >= container.scrollHeight - 10) break;

          mutated = false;
          container.scrollTop += STEP;
          await waitMutation(600);
          await new Promise(r => setTimeout(r, 150));
          collectItems();
          iter++;
        }

        // 末尾を確実に収集
        container.scrollTop = container.scrollHeight;
        await new Promise(r => setTimeout(r, 800));
        collectItems();

        observer.disconnect();
        window.__teamsScrollProgress = { pct: 100, count: collected.size, abort: false };

        return { success: true, items: Array.from(collected.values()), containerInfo, iters: iter };
      }
    });

    const res = result?.[0]?.result;
    if (!res?.success) {
      log('❌ ' + (res?.error || 'スクロール抽出に失敗しました'));
      return;
    }
    log(`✅ ${res.items.length}件収集 (スクロール: ${res.iters}回)`);
    log(`   コンテナ: ${res.containerInfo}`);
    formatAndShowResult(res.items);

  } catch (err) {
    log('❌ ' + err.message);
  } finally {
    clearInterval(scrollPolling);
    scrollPolling = null;
    setBtn('btnScroll', true, 'スクロール抽出を開始');
    document.getElementById('btnAbort').style.display = 'none';
    document.getElementById('progressBar').style.width = '100%';
  }
}

async function abortScroll() {
  const tab = await getActiveTab();
  try {
    await execInMainWorld(tab.id, () => {
      if (window.__teamsScrollProgress) window.__teamsScrollProgress.abort = true;
    });
    log('⚠️ 中止しました');
  } catch (_) {}
}

// =====================================================
// 結果表示・エクスポート
// =====================================================

function formatAndShowResult(entries) {
  if (!entries || entries.length === 0) {
    log('⚠️ 抽出できるデータがありませんでした');
    return;
  }

  const lines = entries
    .map(e => {
      const parts = [];
      if (e.time)    parts.push(`[${e.time}]`);
      if (e.speaker) parts.push(`${e.speaker}:`);
      parts.push(e.text || '');
      return parts.join(' ');
    })
    .filter(l => l.trim());

  const unique = [...new Set(lines)];
  extractedText = unique.join('\n');

  document.getElementById('resultSection').style.display = 'block';
  document.getElementById('resultCount').textContent = `${unique.length}件`;
  document.getElementById('resultPreview').textContent =
    unique.slice(0, 20).join('\n') + (unique.length > 20 ? `\n...(残り ${unique.length - 20}件)` : '');
  log(`📋 ${unique.length}件を抽出しました`);
}

function downloadTxt() {
  if (!extractedText) return;
  const blob = new Blob([extractedText], { type: 'text/plain;charset=utf-8' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `transcript_${new Date().toISOString().slice(0,16).replace(/[T:]/g,'-')}.txt`;
  a.click();
  URL.revokeObjectURL(url);
  log('💾 ファイルを保存しました');
}

async function copyToClipboard() {
  if (!extractedText) return;
  try {
    await navigator.clipboard.writeText(extractedText);
    log('📋 クリップボードにコピーしました');
  } catch (err) {
    log('❌ コピー失敗: ' + err.message);
  }
}

// =====================================================
// ユーティリティ
// =====================================================

async function getActiveTab() {
  const [tab] = await chrome.tabs.query({ active: true, currentWindow: true });
  return tab;
}

async function execInMainWorld(tabId, func) {
  const r = await chrome.scripting.executeScript({ target: { tabId }, world: 'MAIN', func });
  return r?.[0]?.result;
}

function setStatus(dotId, labelId, text, color) {
  const dot = document.getElementById(dotId);
  if (dot) dot.className = 'dot dot-' + (color || 'gray');
  const label = document.getElementById(labelId);
  if (label) label.textContent = text;
}

function setBtn(id, enabled, text) {
  const btn = document.getElementById(id);
  if (!btn) return;
  btn.disabled = !enabled;
  if (text) btn.textContent = text;
}

function showLog() { document.getElementById('logSection').style.display = 'block'; }

function log(msg) {
  showLog();
  const area = document.getElementById('logArea');
  const line = document.createElement('div');
  line.textContent = msg;
  area.appendChild(line);
  area.scrollTop = area.scrollHeight;
}
