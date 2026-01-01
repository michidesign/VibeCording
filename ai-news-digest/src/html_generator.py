"""
AIニュース配信ツール - HTML生成モジュール

スマホ対応のモダンなニュースページを生成する
"""

import os
import json
from datetime import datetime
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
        now = datetime.now()
        
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
            --bg-primary: #0a0a0f;
            --bg-secondary: #12121a;
            --bg-card: #1a1a24;
            --bg-card-hover: #222230;
            --text-primary: #f0f0f5;
            --text-secondary: #a0a0b0;
            --text-muted: #606070;
            --accent-primary: #6366f1;
            --accent-secondary: #8b5cf6;
            --accent-gradient: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #a855f7 100%);
            --border-color: rgba(255, 255, 255, 0.08);
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.3);
            --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.4);
            --shadow-lg: 0 8px 32px rgba(0, 0, 0, 0.5);
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --font-sans: 'Inter', 'Noto Sans JP', -apple-system, BlinkMacSystemFont, sans-serif;
        }}

        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}

        html {{
            scroll-behavior: smooth;
        }}

        body {{
            font-family: var(--font-sans);
            background: var(--bg-primary);
            color: var(--text-primary);
            line-height: 1.7;
            min-height: 100vh;
        }}

        /* ヘッダー */
        .header {{
            background: var(--bg-secondary);
            border-bottom: 1px solid var(--border-color);
            padding: 1.5rem 1rem;
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(12px);
        }}

        .header-content {{
            max-width: 800px;
            margin: 0 auto;
        }}

        .logo {{
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.5rem;
        }}

        .logo-icon {{
            width: 40px;
            height: 40px;
            background: var(--accent-gradient);
            border-radius: var(--radius-sm);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }}

        .logo-text {{
            font-size: 1.5rem;
            font-weight: 700;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }}

        .header-meta {{
            display: flex;
            align-items: center;
            gap: 1rem;
            color: var(--text-secondary);
            font-size: 0.875rem;
        }}

        .update-time {{
            display: flex;
            align-items: center;
            gap: 0.375rem;
        }}

        /* メインコンテンツ */
        .main {{
            max-width: 800px;
            margin: 0 auto;
            padding: 1.5rem 1rem 3rem;
        }}

        .section-title {{
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }}

        /* ニュースカード */
        .news-card {{
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
            animation: fadeInUp 0.5s ease forwards;
            animation-delay: calc(var(--card-index) * 0.1s);
            opacity: 0;
        }}

        .news-card:hover {{
            background: var(--bg-card-hover);
            border-color: var(--accent-primary);
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }}

        @keyframes fadeInUp {{
            from {{
                opacity: 0;
                transform: translateY(20px);
            }}
            to {{
                opacity: 1;
                transform: translateY(0);
            }}
        }}

        .card-header {{
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }}

        .card-number {{
            width: 32px;
            height: 32px;
            background: var(--accent-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 0.875rem;
            flex-shrink: 0;
            color: white;
        }}

        .card-meta {{
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }}

        .source-badge,
        .lang-badge {{
            font-size: 0.75rem;
            padding: 0.25rem 0.625rem;
            background: rgba(99, 102, 241, 0.15);
            border: 1px solid rgba(99, 102, 241, 0.3);
            border-radius: 100px;
            color: var(--text-secondary);
        }}

        .card-title {{
            font-size: 1.125rem;
            font-weight: 600;
            line-height: 1.5;
            margin-bottom: 0.875rem;
        }}

        .card-title a {{
            color: var(--text-primary);
            text-decoration: none;
            transition: color 0.2s ease;
        }}

        .card-title a:hover {{
            color: var(--accent-primary);
        }}

        .card-summary {{
            color: var(--text-secondary);
            font-size: 0.9375rem;
            line-height: 1.8;
            margin-bottom: 1rem;
        }}

        .card-footer {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 0.75rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
        }}

        .card-date {{
            color: var(--text-muted);
            font-size: 0.8125rem;
        }}

        .read-more {{
            color: var(--accent-primary);
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }}

        .read-more:hover {{
            color: var(--accent-secondary);
            gap: 0.5rem;
        }}

        /* フッター */
        .footer {{
            background: var(--bg-secondary);
            border-top: 1px solid var(--border-color);
            padding: 2rem 1rem;
            text-align: center;
        }}

        .footer-content {{
            max-width: 800px;
            margin: 0 auto;
            color: var(--text-muted);
            font-size: 0.8125rem;
        }}

        .footer-links {{
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin-top: 1rem;
        }}

        .footer-links a {{
            color: var(--text-secondary);
            text-decoration: none;
            transition: color 0.2s ease;
        }}

        .footer-links a:hover {{
            color: var(--accent-primary);
        }}

        /* レスポンシブ */
        @media (max-width: 480px) {{
            .logo-text {{
                font-size: 1.25rem;
            }}
            
            .news-card {{
                padding: 1.25rem;
            }}
            
            .card-title {{
                font-size: 1rem;
            }}
            
            .card-summary {{
                font-size: 0.875rem;
            }}
        }}

        /* アクセシビリティ */
        @media (prefers-reduced-motion: reduce) {{
            * {{
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
            }}
        }}

        /* ダークモード最適化 (既にダークがデフォルト) */
        @media (prefers-color-scheme: light) {{
            :root {{
                --bg-primary: #f5f5f7;
                --bg-secondary: #ffffff;
                --bg-card: #ffffff;
                --bg-card-hover: #f0f0f5;
                --text-primary: #1a1a2e;
                --text-secondary: #4a4a5e;
                --text-muted: #8a8a9e;
                --border-color: rgba(0, 0, 0, 0.08);
                --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.08);
                --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.1);
                --shadow-lg: 0 8px 32px rgba(0, 0, 0, 0.12);
            }}
        }}
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <div class="logo-icon">🤖</div>
                <span class="logo-text">AI News Digest</span>
            </div>
            <div class="header-meta">
                <span class="update-time">
                    📅 {date_str} {time_str}
                </span>
                <a href="archive.html" style="color: var(--text-secondary); text-decoration: none; font-size: 0.875rem;">📂 アーカイブ</a>
                <a href="live.html" style="color: var(--accent-primary); text-decoration: none; font-size: 0.875rem;">🔄 今すぐ取得</a>
                <a href="settings.html" style="color: var(--text-secondary); text-decoration: none; font-size: 0.875rem;">⚙️ 設定</a>
            </div>
        </div>
    </header>

    <main class="main">
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
            archive_items = '<p style="color: var(--text-muted); text-align: center; padding: 2rem;">まだアーカイブはありません</p>'
        
        html = f'''<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI News Digest - アーカイブ</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+JP:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {{
            --bg-primary: #0a0a0f;
            --bg-secondary: #12121a;
            --bg-card: #1a1a24;
            --bg-card-hover: #222230;
            --text-primary: #f0f0f5;
            --text-secondary: #a0a0b0;
            --text-muted: #606070;
            --accent-primary: #6366f1;
            --accent-secondary: #8b5cf6;
            --accent-gradient: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #a855f7 100%);
            --border-color: rgba(255, 255, 255, 0.08);
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --font-sans: 'Inter', 'Noto Sans JP', -apple-system, sans-serif;
        }}
        * {{ margin: 0; padding: 0; box-sizing: border-box; }}
        body {{
            font-family: var(--font-sans);
            background: var(--bg-primary);
            color: var(--text-primary);
            line-height: 1.7;
            min-height: 100vh;
        }}
        .header {{
            background: var(--bg-secondary);
            border-bottom: 1px solid var(--border-color);
            padding: 1.5rem 1rem;
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
            gap: 0.75rem;
        }}
        .logo-icon {{
            width: 40px;
            height: 40px;
            background: var(--accent-gradient);
            border-radius: var(--radius-sm);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }}
        .logo-text {{
            font-size: 1.5rem;
            font-weight: 700;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }}
        .back-link {{
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.875rem;
        }}
        .back-link:hover {{
            color: var(--accent-primary);
        }}
        .main {{
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }}
        .section-title {{
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }}
        .archive-list {{
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }}
        .archive-item {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 1.25rem;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            text-decoration: none;
            color: var(--text-primary);
            transition: all 0.2s;
        }}
        .archive-item:hover {{
            background: var(--bg-card-hover);
            border-color: var(--accent-primary);
            transform: translateX(4px);
        }}
        .archive-date {{
            font-weight: 500;
        }}
        .archive-arrow {{
            color: var(--accent-primary);
        }}
        @media (prefers-color-scheme: light) {{
            :root {{
                --bg-primary: #f5f5f7;
                --bg-secondary: #ffffff;
                --bg-card: #ffffff;
                --bg-card-hover: #f0f0f5;
                --text-primary: #1a1a2e;
                --text-secondary: #4a4a5e;
                --text-muted: #8a8a9e;
                --border-color: rgba(0, 0, 0, 0.08);
            }}
        }}
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <div class="logo-icon">📂</div>
                <span class="logo-text">アーカイブ</span>
            </div>
            <a href="index.html" class="back-link">← 最新ニュースへ戻る</a>
        </div>
    </header>
    <main class="main">
        <h1 class="section-title">📚 過去のAIニュース</h1>
        <div class="archive-list">
            {archive_items}
        </div>
    </main>
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
