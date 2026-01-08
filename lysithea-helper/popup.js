/**
 * リシテア勤怠ヘルパー - ポップアップロジック
 * Excelファイルを読み込み、Content Scriptへデータを送信
 */

// グローバル変数
let workData = [];

// DOM要素
const fileInput = document.getElementById('fileInput');
const fileName = document.getElementById('fileName');
const previewSection = document.getElementById('previewSection');
const previewBody = document.getElementById('previewBody');
const rowCount = document.getElementById('rowCount');
const fillButton = document.getElementById('fillButton');
const statusMessage = document.getElementById('statusMessage');

// ファイル選択イベント
fileInput.addEventListener('change', handleFileSelect);

// 入力ボタンイベント
fillButton.addEventListener('click', handleFillButton);

/**
 * ファイル選択ハンドラー
 */
function handleFileSelect(event) {
  const file = event.target.files[0];
  if (!file) return;

  fileName.textContent = `📄 ${file.name}`;
  showStatus('info', 'ファイルを読み込み中...');

  const reader = new FileReader();
  reader.onload = function (e) {
    try {
      parseExcel(e.target.result);
    } catch (error) {
      showStatus('error', `読み込みエラー: ${error.message}`);
    }
  };
  reader.onerror = function () {
    showStatus('error', 'ファイルの読み込みに失敗しました');
  };
  reader.readAsArrayBuffer(file);
}

/**
 * Excelファイルをパース
 */
function parseExcel(data) {
  const workbook = XLSX.read(data, { type: 'array' });

  // 「勤怠入力」シートを優先的に探す、なければ最初のシート（マスター以外）
  let sheetName = workbook.SheetNames[0];
  for (const name of workbook.SheetNames) {
    if (name === '勤怠入力' || name.includes('入力') || name.includes('データ')) {
      sheetName = name;
      break;
    }
  }
  // マスターシートを避ける
  if (sheetName === 'マスター' && workbook.SheetNames.length > 1) {
    sheetName = workbook.SheetNames[1];
  }

  const worksheet = workbook.Sheets[sheetName];

  // JSONに変換（ヘッダー行をスキップ）
  const jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

  if (jsonData.length < 2) {
    showStatus('error', 'データが見つかりません（ヘッダー行のみ）');
    return;
  }

  // ヘッダー行をスキップしてデータを抽出
  // 列構成: A=日付, B=JOBコード, C=作業開始, D=作業終了, E=作業時間(任意), F=コメント
  workData = [];
  for (let i = 1; i < jsonData.length; i++) {
    const row = jsonData[i];
    if (!row || row.length === 0 || !row[1]) continue; // JOBコード(B列)がない行はスキップ

    workData.push({
      date: formatDate(row[0]),
      jobCode: String(row[1] || '').trim(),
      startTime: formatTime(row[2]),
      endTime: formatTime(row[3]),
      workTime: formatTime(row[4]),  // 任意項目
      comment: String(row[5] || '').trim()
    });
  }

  if (workData.length === 0) {
    showStatus('error', '有効なデータが見つかりません');
    return;
  }

  // プレビュー表示
  displayPreview();
  showStatus('success', `${workData.length}件のデータを読み込みました`);
  fillButton.disabled = false;
}

/**
 * 日付フォーマット（YYYY/MM/DD形式に変換）
 */
function formatDate(value) {
  if (value === undefined || value === null || value === '') return '';

  // Excelの日付シリアル値の場合
  if (typeof value === 'number') {
    const excelEpoch = new Date(1899, 11, 30);
    const date = new Date(excelEpoch.getTime() + value * 24 * 60 * 60 * 1000);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}/${month}/${day}`;
  }

  return String(value).trim();
}

/**
 * 時間フォーマット（4桁数字に変換）
 */
function formatTime(value) {
  if (value === undefined || value === null || value === '') return '';

  let str = String(value).trim();

  // 数値の場合（Excelで数値として読み込まれた場合）
  if (!isNaN(value) && typeof value === 'number') {
    // 小数の場合は時間に変換（0.5 = 12:00のようなケース）
    if (value < 1 && value > 0) {
      const totalMinutes = Math.round(value * 24 * 60);
      const hours = Math.floor(totalMinutes / 60);
      const minutes = totalMinutes % 60;
      return String(hours).padStart(2, '0') + String(minutes).padStart(2, '0');
    }
    str = String(Math.floor(value));
  }

  // コロンを削除
  str = str.replace(/:/g, '');

  // 4桁に正規化
  if (str.length === 3) {
    str = '0' + str;
  } else if (str.length === 1 || str.length === 2) {
    str = str.padStart(4, '0');
  }

  return str.substring(0, 4);
}

/**
 * プレビューテーブルを表示
 */
function displayPreview() {
  previewBody.innerHTML = '';

  const maxPreview = Math.min(workData.length, 10); // 最大10行表示

  for (let i = 0; i < maxPreview; i++) {
    const row = workData[i];
    const tr = document.createElement('tr');

    // JOBコードから名称部分を短縮表示
    const jobCodeDisplay = truncateJobCode(row.jobCode);

    tr.innerHTML = `
      <td>${i + 1}</td>
      <td>${escapeHtml(row.date)}</td>
      <td title="${escapeHtml(row.jobCode)}">${escapeHtml(jobCodeDisplay)}</td>
      <td>${escapeHtml(row.startTime)}</td>
      <td>${escapeHtml(row.endTime)}</td>
      <td>${escapeHtml(row.workTime)}</td>
      <td title="${escapeHtml(row.comment)}">${escapeHtml(truncate(row.comment, 15))}</td>
    `;
    previewBody.appendChild(tr);
  }

  previewSection.style.display = 'block';

  if (workData.length > maxPreview) {
    rowCount.textContent = `${workData.length}件中 ${maxPreview}件を表示`;
  } else {
    rowCount.textContent = `全${workData.length}件`;
  }
}

/**
 * JOBコードを短縮表示
 */
function truncateJobCode(jobCode) {
  if (!jobCode) return '';
  // "0000000000:名称" 形式の場合、番号と短縮した名称を表示
  const parts = jobCode.split(':');
  if (parts.length >= 2) {
    const code = parts[0];
    const name = parts.slice(1).join(':');
    return `${code}:${truncate(name, 10)}`;
  }
  return truncate(jobCode, 25);
}

/**
 * 文字列を短縮
 */
function truncate(str, maxLength) {
  if (!str) return '';
  if (str.length <= maxLength) return str;
  return str.substring(0, maxLength) + '...';
}

/**
 * HTMLエスケープ
 */
function escapeHtml(str) {
  if (!str) return '';
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}

/**
 * 入力ボタンハンドラー
 */
async function handleFillButton() {
  if (workData.length === 0) {
    showStatus('error', 'データがありません');
    return;
  }

  fillButton.disabled = true;
  showStatus('info', 'リシテアにデータを入力中...');

  try {
    // 現在のタブを取得
    const [tab] = await chrome.tabs.query({ active: true, currentWindow: true });

    if (!tab) {
      showStatus('error', 'アクティブなタブが見つかりません');
      fillButton.disabled = false;
      return;
    }

    // Content Scriptを動的に注入
    try {
      await chrome.scripting.executeScript({
        target: { tabId: tab.id },
        files: ['content.js']
      });
    } catch (injectError) {
      console.log('Script already injected or injection failed:', injectError);
      // 既に注入済みの場合はエラーになるが、続行する
    }

    // 少し待ってからメッセージを送信
    await new Promise(resolve => setTimeout(resolve, 100));

    // Content Scriptにメッセージを送信
    const response = await chrome.tabs.sendMessage(tab.id, {
      action: 'fillWorkData',
      data: workData
    });

    if (response && response.success) {
      showStatus('success', `✅ ${response.filledCount}件のデータを入力しました`);
    } else {
      showStatus('error', response?.message || '入力に失敗しました');
      fillButton.disabled = false;
    }
  } catch (error) {
    console.error('Error:', error);

    // Content Scriptが注入されていない可能性
    if (error.message.includes('Receiving end does not exist')) {
      showStatus('error', 'リシテアの勤怠入力画面を開いてください。ページを一度リロードしてお試しください。');
    } else {
      showStatus('error', `エラー: ${error.message}`);
    }
    fillButton.disabled = false;
  }
}

/**
 * ステータスメッセージを表示
 */
function showStatus(type, message) {
  statusMessage.className = `status-message ${type}`;
  statusMessage.textContent = message;
}
