"""
AIニュース配信ツール - HTML生成モジュール

スマホ対応のモダンなニュースページを生成する
"""

import os
import json
from datetime import datetime, timezone, timedelta

# 日本標準時 (JST = UTC+9)
JST = timezone(timedelta(hours=9))
from typing import List, Any
from string import Template


class HTMLGenerator:
    """HTMLページを生成するクラス"""
    
    def __init__(self, template_path: str = None):
        """
        初期化
        
        Args:
            template_path: HTMLテンプレートのパス
        """
        if template_path is None:
            template_path = os.path.join(
                os.path.dirname(os.path.dirname(__file__)),
                "templates",
                "index.html"
            )
        
        self.template_path = template_path
    
    def generate_article_card(self, article: Any, index: int) -> str:
        """
        記事カードのHTMLを生成する
        
        Args:
            article: 記事オブジェクト
            index: 記事の番号
            
        Returns:
            HTML文字列
        """
        # 日付フォーマット
        if article.published:
            date_str = article.published.strftime("%Y年%m月%d日 %H:%M")
        else:
            date_str = "日時不明"
        
        # 日本語タイトルを取得（なければ元のタイトル）
        display_title = getattr(article, 'title_ja', article.title) or article.title
        
        # ソースのアイコンを決定
        source_icons = {
            "OpenAI Blog": "🤖",
            "Google AI Blog": "🔵",
            "TechCrunch AI": "💚",
            "VentureBeat AI": "🟣",
            "The Verge AI": "🔺",
            "MIT Technology Review": "📚",
            "Wired AI": "📱",
            "ITmedia AI+": "🇯🇵",
            "ITmedia NEWS": "🇯🇵",
            "GIGAZINE": "📰",
            "Ars Technica": "🔬",
            "日経クロステック": "🇯🇵",
            "CNET Japan": "🇯🇵",
            "ZDNet Japan": "🇯🇵",
            "ASCII.jp": "🇯🇵",
            "Impress Watch": "🇯🇵",
        }
        icon = source_icons.get(article.source, "📄")
        
        # 言語バッジ（英語記事は「翻訳」表示）
        if article.language == "ja":
            lang_badge = "🇯🇵 日本語"
        else:
            lang_badge = "🌐 原文:英語"
        
        return f'''
        <article class="news-card" style="--card-index: {index}">
            <div class="card-header">
                <span class="card-number">{index + 1}</span>
                <div class="card-meta">
                    <span class="source-badge">{icon} {article.source}</span>
                    <span class="lang-badge">{lang_badge}</span>
                </div>
            </div>
            <h2 class="card-title">
                <a href="{article.url}" target="_blank" rel="noopener noreferrer">
                    {display_title}
                </a>
            </h2>
            <p class="card-summary">{article.summary}</p>
            <div class="card-footer">
                <time class="card-date">{date_str}</time>
                <a href="{article.url}" target="_blank" rel="noopener noreferrer" class="read-more">
                    元記事を読む →
                </a>
            </div>
        </article>
        '''
    
    def generate_html(self, articles: List[Any], output_path: str = None, is_archive: bool = False, archive_date: str = None) -> str:
        """
        完全なHTMLページを生成する
        
        Args:
            articles: 記事オブジェクトのリスト
            output_path: 出力ファイルパス
            is_archive: アーカイブページかどうか
            archive_date: アーカイブの日付（YYYY-MM-DD形式）
            
        Returns:
            HTML文字列
        """
        now = datetime.now(JST)
        
        if is_archive and archive_date:
            # アーカイブページの場合
            date_str = archive_date.replace("-", "年", 1).replace("-", "月") + "日"
            time_str = ""
            page_title = f"AI News Digest - {date_str}"
            section_title = f"📂 {date_str}のAIニュース"
        else:
            date_str = now.strftime("%Y年%m月%d日")
            time_str = now.strftime("%H:%M")
            page_title = f"AI News Digest - {date_str}"
            section_title = "🔥 今日の注目AIニュース"
        
        # 記事カードを生成
        article_cards = "\n".join(
            self.generate_article_card(article, i) 
            for i, article in enumerate(articles)
        )
        
        html = f'''<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="今日の注目AIニュース5選 - {date_str}更新">
    <title>{page_title}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+JP:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {{
            /* DADS カラーパレット */
            --dads-primary-500: #0071c1;
            --dads-primary-600: #005bb4;
            --dads-primary-700: #004c96;
            --dads-primary-50: #e8f3fc;
            
            --dads-text-primary: #212529;
            --dads-text-secondary: #495057;
            --dads-text-muted: #6c757d;
            --dads-text-link: #0071c1;
            
            --dads-bg-primary: #ffffff;
            --dads-bg-secondary: #f8f9fa;
            --dads-border-light: #dee2e6;
            --dads-border-default: #ced4da;
            
            /* スペーシング（8px基準） */
            --space-2: 8px;
            --space-3: 12px;
            --space-4: 16px;
            --space-5: 24px;
            --space-6: 32px;
            --space-8: 48px;
            
            /* 互換性のための変数 */
            --bg-primary: var(--dads-bg-primary);
            --bg-secondary: var(--dads-bg-secondary);
            --bg-card: var(--dads-bg-primary);
            --bg-card-hover: var(--dads-bg-secondary);
            --text-primary: var(--dads-text-primary);
            --text-secondary: var(--dads-text-secondary);
            --text-muted: var(--dads-text-muted);
            --accent-primary: var(--dads-primary-500);
            --border-color: var(--dads-border-light);
        }}

        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}

        html {{
            scroll-behavior: smooth;
            font-size: 100%;
        }}

        body {{
            font-family: 'Noto Sans JP', -apple-system, BlinkMacSystemFont, 'Hiragino Sans', sans-serif;
            background: var(--dads-bg-secondary);
            color: var(--dads-text-primary);
            line-height: 1.75;
            min-height: 100vh;
            font-size: 16px;
        }}

        /* スキップリンク（アクセシビリティ） */
        .skip-link {{
            position: absolute;
            top: -100px;
            left: 0;
            background: var(--dads-primary-500);
            color: #ffffff;
            padding: var(--space-3) var(--space-4);
            z-index: 1000;
            text-decoration: none;
            font-weight: 700;
        }}

        .skip-link:focus {{
            top: 0;
        }}

        /* ヘッダー */
        .header {{
            background: var(--dads-bg-primary);
            border-bottom: 1px solid var(--dads-border-light);
            padding: var(--space-4) var(--space-4);
            position: sticky;
            top: 0;
            z-index: 100;
        }}

        .header-content {{
            max-width: 800px;
            margin: 0 auto;
        }}

        .logo {{
            display: flex;
            align-items: center;
            gap: var(--space-3);
            margin-bottom: var(--space-2);
        }}

        .logo-icon {{
            width: 40px;
            height: 40px;
            background: var(--dads-primary-500);
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }}

        .logo-text {{
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dads-primary-500);
        }}

        .header-meta {{
            display: flex;
            align-items: center;
            gap: var(--space-4);
            color: var(--dads-text-secondary);
            font-size: 0.875rem;
            flex-wrap: wrap;
        }}

        .header-meta a {{
            color: var(--dads-text-link);
            text-decoration: underline;
            font-weight: 500;
        }}

        .header-meta a:hover {{
            color: var(--dads-primary-700);
        }}

        .header-meta a:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}

        .update-time {{
            display: flex;
            align-items: center;
            gap: 6px;
        }}

        /* メインコンテンツ */
        .main {{
            max-width: 800px;
            margin: 0 auto;
            padding: var(--space-5) var(--space-4) var(--space-8);
        }}

        .section-title {{
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--dads-text-primary);
            margin-bottom: var(--space-5);
            display: flex;
            align-items: center;
            gap: var(--space-2);
        }}

        /* ニュースカード */
        .news-card {{
            background: var(--dads-bg-primary);
            border: 1px solid var(--dads-border-light);
            border-radius: 8px;
            padding: var(--space-5);
            margin-bottom: var(--space-4);
            transition: box-shadow 0.2s ease;
        }}

        .news-card:hover {{
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }}

        .card-header {{
            display: flex;
            align-items: center;
            gap: var(--space-3);
            margin-bottom: var(--space-4);
        }}

        .card-number {{
            width: 32px;
            height: 32px;
            background: var(--dads-primary-500);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 0.875rem;
            flex-shrink: 0;
            color: #ffffff;
        }}

        .card-meta {{
            display: flex;
            flex-wrap: wrap;
            gap: var(--space-2);
        }}

        .source-badge,
        .lang-badge {{
            font-size: 0.75rem;
            padding: 4px 12px;
            background: var(--dads-primary-50);
            border: 1px solid var(--dads-border-default);
            border-radius: 4px;
            color: var(--dads-text-secondary);
        }}

        .card-title {{
            font-size: 1.125rem;
            font-weight: 700;
            line-height: 1.5;
            margin-bottom: var(--space-3);
        }}

        .card-title a {{
            color: var(--dads-text-primary);
            text-decoration: underline;
            transition: color 0.2s ease;
        }}

        .card-title a:hover {{
            color: var(--dads-primary-500);
        }}

        .card-title a:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}

        .card-summary {{
            color: var(--dads-text-secondary);
            font-size: 1rem;
            line-height: 1.75;
            margin-bottom: var(--space-4);
        }}

        .card-footer {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: var(--space-3);
            padding-top: var(--space-4);
            border-top: 1px solid var(--dads-border-light);
        }}

        .card-date {{
            color: var(--dads-text-muted);
            font-size: 0.875rem;
        }}

        .read-more {{
            color: var(--dads-text-link);
            text-decoration: underline;
            font-size: 0.875rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: var(--space-2) 0;
            min-height: 48px;
        }}

        .read-more:hover {{
            color: var(--dads-primary-700);
        }}

        .read-more:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}

        /* フッター */
        .footer {{
            background: var(--dads-bg-primary);
            border-top: 1px solid var(--dads-border-light);
            padding: var(--space-6) var(--space-4);
            text-align: center;
        }}

        .footer-content {{
            max-width: 800px;
            margin: 0 auto;
            color: var(--dads-text-muted);
            font-size: 0.875rem;
        }}

        .footer-links {{
            display: flex;
            justify-content: center;
            gap: var(--space-5);
            margin-top: var(--space-4);
        }}

        .footer-links a {{
            color: var(--dads-text-link);
            text-decoration: underline;
        }}

        .footer-links a:hover {{
            color: var(--dads-primary-700);
        }}

        .footer-links a:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}

        /* レスポンシブ */
        @media (max-width: 576px) {{
            .logo-text {{
                font-size: 1.25rem;
            }}
            
            .news-card {{
                padding: var(--space-4);
            }}
            
            .card-title {{
                font-size: 1rem;
            }}
            
            .header-meta {{
                gap: var(--space-3);
            }}
        }}

        /* アクセシビリティ */
        @media (prefers-reduced-motion: reduce) {{
            * {{
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
            }}
        }}

        /* ダークモード */
        [data-theme="dark"] {{
            --dads-text-primary: #f1f3f5;
            --dads-text-secondary: #ced4da;
            --dads-text-muted: #adb5bd;
            --dads-text-link: #6aade7;
            --dads-bg-primary: #212529;
            --dads-bg-secondary: #343a40;
            --dads-border-light: #495057;
            --dads-border-default: #6c757d;
            --dads-primary-50: rgba(0, 113, 193, 0.15);
        }}

        /* テーマ切り替えボタン */
        .theme-toggle {{
            background: var(--dads-bg-secondary);
            border: 1px solid var(--dads-border-default);
            border-radius: 4px;
            padding: var(--space-2) var(--space-3);
            cursor: pointer;
            display: flex;
            align-items: center;
            font-size: 1rem;
            color: var(--dads-text-secondary);
            transition: all 0.2s ease;
            min-height: 48px;
        }}

        .theme-toggle:hover {{
            background: var(--dads-primary-50);
            border-color: var(--dads-primary-500);
        }}

        .theme-toggle:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}
    </style>
</head>
<body>
    <a href="#main-content" class="skip-link">本文へスキップ</a>

    <header class="header" role="banner">
        <div class="header-content">
            <div class="logo">
                <div class="logo-icon">🤖</div>
                <span class="logo-text">AI News Digest</span>
            </div>
            <div class="header-meta">
                <span class="update-time">
                    📅 {date_str} {time_str}
                </span>
                <a href="archive.html">📂 アーカイブ</a>
                <a href="live.html">🔄 今すぐ取得</a>
                <a href="settings.html">⚙️ 設定</a>
                <button class="theme-toggle" onclick="toggleTheme()" title="テーマ切り替え" aria-label="テーマ切り替え">
                    <span id="theme-icon">☀️</span>
                </button>
            </div>
        </div>
    </header>

    <main id="main-content" class="main" role="main">
        <h1 class="section-title">
            {section_title}
        </h1>
        
        {article_cards}
    </main>

    <footer class="footer">
        <div class="footer-content">
            <p>AI News Digest</p>
            <p style="margin-top: 0.5rem;">主要なAI関連ニュースソースから厳選してお届けします</p>
            <div class="footer-links">
                <a href="#" onclick="window.scrollTo({{top: 0, behavior: 'smooth'}}); return false;">
                    ↑ トップへ戻る
                </a>
            </div>
        </div>
    </footer>

    <script>
        // テーマ切り替え機能
        function setTheme(theme) {{
            document.documentElement.setAttribute('data-theme', theme);
            localStorage.setItem('theme', theme);
            updateThemeButton(theme);
        }}

        function updateThemeButton(theme) {{
            const icon = document.getElementById('theme-icon');
            if (theme === 'light') {{
                icon.textContent = '☀️';
            }} else {{
                icon.textContent = '🌙';
            }}
        }}

        function toggleTheme() {{
            const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
            const newTheme = currentTheme === 'light' ? 'dark' : 'light';
            setTheme(newTheme);
        }}

        // ページ読み込み時にテーマを適用
        (function() {{
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme) {{
                setTheme(savedTheme);
            }} else {{
                // ライトモードをデフォルトに（DADS準拠）
                setTheme('light');
            }}
        }})();
    </script>
</body>
</html>'''
        
        if output_path:
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            with open(output_path, "w", encoding="utf-8") as f:
                f.write(html)
            print(f"HTML saved to: {output_path}")
        
        return html
    
    def generate_archive_index(self, archive_dates: List[str], output_path: str) -> str:
        """
        アーカイブ一覧ページを生成する
        
        Args:
            archive_dates: アーカイブの日付リスト（YYYY-MM-DD形式、新しい順）
            output_path: 出力ファイルパス
            
        Returns:
            HTML文字列
        """
        # 日付リストをHTMLに変換
        if archive_dates:
            archive_items = "\n".join([
                f'''<a href="archive/{date}.html" class="archive-item">
                    <span class="archive-date">📰 {date.replace("-", "年", 1).replace("-", "月") + "日"}</span>
                    <span class="archive-arrow">→</span>
                </a>'''
                for date in archive_dates
            ])
        else:
            archive_items = '<p style="color: var(--dads-text-muted); text-align: center; padding: var(--space-6);">まだアーカイブはありません</p>'
        
        html = f'''<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI News Digest - アーカイブ</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {{
            /* DADS カラーパレット */
            --dads-primary-500: #0071c1;
            --dads-primary-700: #004c96;
            --dads-primary-50: #e8f3fc;
            
            --dads-text-primary: #212529;
            --dads-text-secondary: #495057;
            --dads-text-muted: #6c757d;
            --dads-text-link: #0071c1;
            
            --dads-bg-primary: #ffffff;
            --dads-bg-secondary: #f8f9fa;
            --dads-border-light: #dee2e6;
            --dads-border-default: #ced4da;
            
            --space-2: 8px;
            --space-3: 12px;
            --space-4: 16px;
            --space-5: 24px;
            --space-6: 32px;
        }}
        * {{ margin: 0; padding: 0; box-sizing: border-box; }}
        html {{ font-size: 100%; }}
        body {{
            font-family: 'Noto Sans JP', -apple-system, BlinkMacSystemFont, 'Hiragino Sans', sans-serif;
            background: var(--dads-bg-secondary);
            color: var(--dads-text-primary);
            line-height: 1.75;
            min-height: 100vh;
            font-size: 16px;
        }}
        .skip-link {{
            position: absolute;
            top: -100px;
            left: 0;
            background: var(--dads-primary-500);
            color: #ffffff;
            padding: var(--space-3) var(--space-4);
            z-index: 1000;
            text-decoration: none;
            font-weight: 700;
        }}
        .skip-link:focus {{ top: 0; }}
        .header {{
            background: var(--dads-bg-primary);
            border-bottom: 1px solid var(--dads-border-light);
            padding: var(--space-4);
        }}
        .header-content {{
            max-width: 800px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }}
        .logo {{
            display: flex;
            align-items: center;
            gap: var(--space-3);
        }}
        .logo-icon {{
            width: 40px;
            height: 40px;
            background: var(--dads-primary-500);
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }}
        .logo-text {{
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dads-primary-500);
        }}
        .back-link {{
            color: var(--dads-text-link);
            text-decoration: underline;
            font-size: 0.875rem;
            font-weight: 500;
        }}
        .back-link:hover {{
            color: var(--dads-primary-700);
        }}
        .back-link:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}
        .main {{
            max-width: 800px;
            margin: 0 auto;
            padding: var(--space-6) var(--space-4);
        }}
        .section-title {{
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: var(--space-5);
        }}
        .archive-list {{
            display: flex;
            flex-direction: column;
            gap: var(--space-2);
        }}
        .archive-item {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--space-4) var(--space-5);
            background: var(--dads-bg-primary);
            border: 1px solid var(--dads-border-light);
            border-radius: 8px;
            text-decoration: none;
            color: var(--dads-text-primary);
            transition: box-shadow 0.2s;
            min-height: 48px;
        }}
        .archive-item:hover {{
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }}
        .archive-item:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}
        .archive-date {{
            font-weight: 500;
        }}
        .archive-arrow {{
            color: var(--dads-primary-500);
        }}
        /* ダークモード */
        [data-theme="dark"] {{
            --dads-text-primary: #f1f3f5;
            --dads-text-secondary: #ced4da;
            --dads-text-muted: #adb5bd;
            --dads-text-link: #6aade7;
            --dads-bg-primary: #212529;
            --dads-bg-secondary: #343a40;
            --dads-border-light: #495057;
            --dads-border-default: #6c757d;
            --dads-primary-50: rgba(0, 113, 193, 0.15);
        }}
        .theme-toggle {{
            background: var(--dads-bg-secondary);
            border: 1px solid var(--dads-border-default);
            border-radius: 4px;
            padding: var(--space-2) var(--space-3);
            cursor: pointer;
            display: flex;
            align-items: center;
            font-size: 1rem;
            color: var(--dads-text-secondary);
            min-height: 48px;
        }}
        .theme-toggle:hover {{
            background: var(--dads-primary-50);
            border-color: var(--dads-primary-500);
        }}
        .theme-toggle:focus-visible {{
            outline: 3px solid var(--dads-primary-500);
            outline-offset: 2px;
        }}
        @media (max-width: 576px) {{
            .logo-text {{ font-size: 1.25rem; }}
            .header-content {{ flex-direction: column; gap: var(--space-3); }}
        }}
    </style>
</head>
<body>
    <a href="#main-content" class="skip-link">本文へスキップ</a>
    <header class="header" role="banner">
        <div class="header-content">
            <div class="logo">
                <div class="logo-icon">📂</div>
                <span class="logo-text">アーカイブ</span>
            </div>
            <div style="display: flex; align-items: center; gap: var(--space-4);">
                <a href="index.html" class="back-link">← 最新ニュースへ戻る</a>
                <button class="theme-toggle" onclick="toggleTheme()" title="テーマ切り替え" aria-label="テーマ切り替え">
                    <span id="theme-icon">☀️</span>
                </button>
            </div>
        </div>
    </header>
    <main id="main-content" class="main" role="main">
        <h1 class="section-title">📚 過去のAIニュース</h1>
        <div class="archive-list">
            {archive_items}
        </div>
    </main>
    <script>
        function setTheme(theme) {{
            document.documentElement.setAttribute('data-theme', theme);
            localStorage.setItem('theme', theme);
            updateThemeButton(theme);
        }}
        function updateThemeButton(theme) {{
            const icon = document.getElementById('theme-icon');
            icon.textContent = theme === 'dark' ? '🌙' : '☀️';
        }}
        function toggleTheme() {{
            const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
            setTheme(currentTheme === 'light' ? 'dark' : 'light');
        }}
        (function() {{
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme) {{
                setTheme(savedTheme);
            }} else {{
                setTheme('light');
            }}
        }})();
    </script>
</body>
</html>'''
        
        with open(output_path, "w", encoding="utf-8") as f:
            f.write(html)
        
        return html


if __name__ == "__main__":
    # テスト用のダミーデータ
    from dataclasses import dataclass
    from datetime import datetime
    
    @dataclass
    class DummyArticle:
        title: str
        url: str
        source: str
        published: datetime
        summary: str
        language: str = "en"
    
    articles = [
        DummyArticle(
            title="OpenAI Announces GPT-5 with Revolutionary Capabilities",
            url="https://example.com/1",
            source="TechCrunch AI",
            published=datetime.now(),
            summary="OpenAIが次世代の大規模言語モデルGPT-5を発表しました。今回のアップデートでは、推論能力が大幅に向上し、より複雑なタスクを処理できるようになっています。また、マルチモーダル機能が強化され、画像や動画の理解力も向上しています。",
        ),
        DummyArticle(
            title="Google DeepMind Achieves AGI Milestone",
            url="https://example.com/2",
            source="Google AI Blog",
            published=datetime.now(),
            summary="Google DeepMindが汎用人工知能（AGI）に向けた重要なマイルストーンを達成しました。新しいアーキテクチャにより、未知のタスクへの適応能力が飛躍的に向上しています。",
        ),
    ]
    
    generator = HTMLGenerator()
    html = generator.generate_html(
        articles,
        output_path="./docs/index.html"
    )
