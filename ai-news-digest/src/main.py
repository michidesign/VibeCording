"""
AIニュース配信ツール - メインスクリプト

全モジュールを統合してニュースダイジェストを生成する
"""

import os
import sys
import json
import argparse
from datetime import datetime
from pathlib import Path

# srcディレクトリをパスに追加
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from news_collector import NewsCollector
from article_scorer import ArticleScorer
from summarizer import get_summarizer
from html_generator import HTMLGenerator


def load_config(config_path: str = None) -> dict:
    """設定ファイルを読み込む"""
    if config_path is None:
        config_path = os.path.join(
            os.path.dirname(os.path.dirname(__file__)),
            "config",
            "settings.json"
        )
    
    with open(config_path, "r", encoding="utf-8") as f:
        return json.load(f)


def generate_news_digest(
    output_path: str = None,
    use_api: bool = True,
    hours_limit: int = 48,
    article_count: int = 5,
    verbose: bool = True
) -> str:
    """
    AIニュースダイジェストを生成する
    
    Args:
        output_path: 出力HTMLファイルのパス
        use_api: Gemini APIを使用するかどうか
        hours_limit: 何時間以内の記事を取得するか
        article_count: 出力する記事数
        verbose: 詳細なログを出力するか
        
    Returns:
        生成されたHTMLファイルのパス
    """
    if verbose:
        print("="*60)
        print("AI News Digest Generator")
        print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print("="*60)
    
    # 出力パスのデフォルト設定
    docs_dir = os.path.join(os.path.dirname(os.path.dirname(__file__)), "docs")
    if output_path is None:
        output_path = os.path.join(docs_dir, "index.html")
    
    # Step 1: ニュースを収集
    if verbose:
        print("\n[1/5] Collecting news articles...")
    collector = NewsCollector()
    articles = collector.collect_articles(hours_limit=hours_limit)
    if verbose:
        print(f"      Found {len(articles)} articles")
    
    if len(articles) == 0:
        print("No articles found. Exiting.")
        return None
    
    # Step 2: 記事をスコアリング・選定
    if verbose:
        print("\n[2/5] Scoring and selecting top articles...")
    scorer = ArticleScorer()
    top_articles = scorer.select_top_articles(articles, count=article_count)
    if verbose:
        print(f"      Selected top {len(top_articles)} articles:")
        for i, article in enumerate(top_articles, 1):
            print(f"        {i}. [{article.score:.1f}] {article.title[:50]}...")
    
    # Step 3: 記事を要約
    if verbose:
        print("\n[3/5] Generating summaries...")
    summarizer = get_summarizer(use_api=use_api)
    summarized_articles = summarizer.summarize_articles(top_articles)
    
    # Step 4: HTMLを生成（メインページ）
    if verbose:
        print("\n[4/5] Generating HTML page...")
    generator = HTMLGenerator()
    html = generator.generate_html(summarized_articles, output_path=output_path)
    
    # Step 5: アーカイブを保存
    if verbose:
        print("\n[5/5] Saving to archive...")
    today = datetime.now().strftime("%Y-%m-%d")
    archive_dir = os.path.join(docs_dir, "archive")
    os.makedirs(archive_dir, exist_ok=True)
    archive_path = os.path.join(archive_dir, f"{today}.html")
    generator.generate_html(summarized_articles, output_path=archive_path, is_archive=True, archive_date=today)
    if verbose:
        print(f"      Archive saved: {archive_path}")
    
    # アーカイブ一覧を更新
    update_archive_index(docs_dir, verbose)
    
    if verbose:
        print("\n" + "="*60)
        print("✅ News digest generated successfully!")
        print(f"   Output: {output_path}")
        print(f"   Archive: {archive_path}")
        print("="*60)
    
    return output_path


def update_archive_index(docs_dir: str, verbose: bool = True):
    """アーカイブ一覧ページを更新する"""
    archive_dir = os.path.join(docs_dir, "archive")
    archive_index_path = os.path.join(docs_dir, "archive.html")
    
    # アーカイブファイルの一覧を取得
    archive_files = []
    if os.path.exists(archive_dir):
        for f in os.listdir(archive_dir):
            if f.endswith(".html") and f != "index.html":
                date_str = f.replace(".html", "")
                archive_files.append(date_str)
    
    archive_files.sort(reverse=True)  # 新しい順
    
    # アーカイブ一覧HTMLを生成
    generator = HTMLGenerator()
    generator.generate_archive_index(archive_files, archive_index_path)
    
    if verbose:
        print(f"      Archive index updated: {archive_index_path}")


def main():
    """メイン関数"""
    parser = argparse.ArgumentParser(
        description="AI News Digest Generator - 最新AIニュースを収集・要約・配信"
    )
    
    parser.add_argument(
        "-o", "--output",
        type=str,
        default=None,
        help="出力HTMLファイルのパス"
    )
    
    parser.add_argument(
        "--no-api",
        action="store_true",
        help="Gemini APIを使用せずに実行（要約の品質が低下）"
    )
    
    parser.add_argument(
        "--hours",
        type=int,
        default=48,
        help="何時間以内の記事を取得するか（デフォルト: 48）"
    )
    
    parser.add_argument(
        "--count",
        type=int,
        default=5,
        help="出力する記事数（デフォルト: 5）"
    )
    
    parser.add_argument(
        "-q", "--quiet",
        action="store_true",
        help="詳細なログを出力しない"
    )
    
    parser.add_argument(
        "--test",
        action="store_true",
        help="テストモード（記事収集のみ）"
    )
    
    args = parser.parse_args()
    
    if args.test:
        # テストモード
        print("Running in test mode...")
        collector = NewsCollector()
        articles = collector.collect_articles(hours_limit=72)
        
        scorer = ArticleScorer()
        top_articles = scorer.select_top_articles(articles, count=5)
        
        print(f"\nTop {len(top_articles)} articles:")
        for i, article in enumerate(top_articles, 1):
            print(f"\n{i}. [{article.source}] {article.title}")
            print(f"   Score: {article.score:.1f}")
            print(f"   URL: {article.url}")
        
        return
    
    # ニュースダイジェストを生成
    generate_news_digest(
        output_path=args.output,
        use_api=not args.no_api,
        hours_limit=args.hours,
        article_count=args.count,
        verbose=not args.quiet
    )


if __name__ == "__main__":
    main()
