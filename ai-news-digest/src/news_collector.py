"""
AIニュース配信ツール - ニュース収集モジュール

RSSフィードからAI関連のニュース記事を収集する
"""

import feedparser
import requests
from datetime import datetime, timedelta
from typing import List, Dict, Any, Optional
from dataclasses import dataclass, field
from bs4 import BeautifulSoup
import json
import os
import re
from urllib.parse import urlparse
import time


@dataclass
class Article:
    """ニュース記事を表すデータクラス"""
    title: str
    url: str
    source: str
    published: datetime
    description: str = ""
    content: str = ""
    language: str = "en"
    score: float = 0.0
    summary: str = ""
    
    def to_dict(self) -> Dict[str, Any]:
        return {
            "title": self.title,
            "url": self.url,
            "source": self.source,
            "published": self.published.isoformat() if self.published else None,
            "description": self.description,
            "content": self.content,
            "language": self.language,
            "score": self.score,
            "summary": self.summary
        }


class NewsCollector:
    """RSSフィードからニュースを収集するクラス"""
    
    def __init__(self, config_path: str = None):
        """
        初期化
        
        Args:
            config_path: 設定ファイルのパス
        """
        if config_path is None:
            config_path = os.path.join(
                os.path.dirname(os.path.dirname(__file__)),
                "config",
                "settings.json"
            )
        
        with open(config_path, "r", encoding="utf-8") as f:
            self.config = json.load(f)
        
        self.sources = self.config.get("sources", [])
        self.headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
        }
    
    def fetch_rss_feed(self, url: str) -> Optional[feedparser.FeedParserDict]:
        """
        RSSフィードを取得する
        
        Args:
            url: RSSフィードのURL
            
        Returns:
            パースされたフィードデータ
        """
        try:
            response = requests.get(url, headers=self.headers, timeout=15)
            response.raise_for_status()
            feed = feedparser.parse(response.content)
            return feed
        except Exception as e:
            print(f"Error fetching RSS feed {url}: {e}")
            return None
    
    def parse_published_date(self, entry: Dict) -> Optional[datetime]:
        """
        記事の公開日時をパースする
        
        Args:
            entry: フィードのエントリー
            
        Returns:
            datetime オブジェクト
        """
        # 複数の日付フィールドを試す
        date_fields = ["published_parsed", "updated_parsed", "created_parsed"]
        
        for field in date_fields:
            if hasattr(entry, field) and getattr(entry, field):
                try:
                    time_struct = getattr(entry, field)
                    return datetime(*time_struct[:6])
                except:
                    continue
        
        # 文字列から直接パース
        date_strings = ["published", "updated", "created"]
        for field in date_strings:
            if hasattr(entry, field) and getattr(entry, field):
                try:
                    from dateutil import parser
                    return parser.parse(getattr(entry, field))
                except:
                    continue
        
        return datetime.now()
    
    def extract_content(self, entry: Dict) -> str:
        """
        記事の本文を抽出する
        
        Args:
            entry: フィードのエントリー
            
        Returns:
            抽出されたテキスト
        """
        content = ""
        
        # content フィールドをチェック
        if hasattr(entry, "content") and entry.content:
            content = entry.content[0].get("value", "")
        
        # summary フィールドをチェック
        if not content and hasattr(entry, "summary"):
            content = entry.summary
        
        # description フィールドをチェック
        if not content and hasattr(entry, "description"):
            content = entry.description
        
        # HTMLタグを除去
        if content:
            soup = BeautifulSoup(content, "html.parser")
            content = soup.get_text(separator=" ", strip=True)
        
        return content[:2000]  # 最大2000文字
    
    def fetch_full_article(self, url: str) -> str:
        """
        記事のURLから本文を取得する
        
        Args:
            url: 記事のURL
            
        Returns:
            抽出された本文
        """
        try:
            response = requests.get(url, headers=self.headers, timeout=15)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.content, "html.parser")
            
            # 主要なコンテンツ要素を探す
            content_selectors = [
                "article",
                '[class*="article"]',
                '[class*="content"]',
                '[class*="post"]',
                "main",
            ]
            
            for selector in content_selectors:
                elements = soup.select(selector)
                if elements:
                    text = elements[0].get_text(separator=" ", strip=True)
                    if len(text) > 200:
                        return text[:3000]
            
            # フォールバック: bodyからテキストを取得
            body = soup.find("body")
            if body:
                return body.get_text(separator=" ", strip=True)[:3000]
            
            return ""
        except Exception as e:
            print(f"Error fetching article {url}: {e}")
            return ""
    
    def collect_articles(self, hours_limit: int = 48) -> List[Article]:
        """
        全てのソースからニュース記事を収集する
        
        Args:
            hours_limit: 何時間以内の記事を取得するか
            
        Returns:
            記事のリスト
        """
        articles = []
        cutoff_time = datetime.now() - timedelta(hours=hours_limit)
        
        for source in self.sources:
            print(f"Fetching from {source['name']}...")
            feed = self.fetch_rss_feed(source["url"])
            
            if not feed or not hasattr(feed, "entries"):
                continue
            
            for entry in feed.entries[:20]:  # 各ソースから最大20件
                try:
                    title = getattr(entry, "title", "")
                    url = getattr(entry, "link", "")
                    
                    if not title or not url:
                        continue
                    
                    published = self.parse_published_date(entry)
                    
                    # 期限外の記事はスキップ
                    if published and published < cutoff_time:
                        continue
                    
                    # AI関連かどうかの簡易チェック
                    if not self._is_ai_related(title, source):
                        continue
                    
                    content = self.extract_content(entry)
                    
                    article = Article(
                        title=title,
                        url=url,
                        source=source["name"],
                        published=published,
                        description=content[:500],
                        content=content,
                        language=source.get("language", "en")
                    )
                    
                    articles.append(article)
                    
                except Exception as e:
                    print(f"Error processing entry: {e}")
                    continue
            
            # レート制限を避けるための待機
            time.sleep(0.5)
        
        print(f"Collected {len(articles)} articles")
        return articles
    
    def _is_ai_related(self, title: str, source: Dict) -> bool:
        """
        記事がAI関連かどうかをチェック
        
        Args:
            title: 記事のタイトル
            source: ソース情報
            
        Returns:
            AI関連かどうか
        """
        # AI専門ソースは常にTrue
        ai_sources = ["ITmedia AI+", "AI News", "OpenAI Blog", "Google AI Blog"]
        if source["name"] in ai_sources:
            return True
        
        # キーワードチェック
        ai_keywords = [
            "ai", "artificial intelligence", "machine learning", "deep learning",
            "llm", "gpt", "chatgpt", "claude", "gemini", "copilot",
            "openai", "anthropic", "deepmind", "neural", "transformer",
            "人工知能", "機械学習", "深層学習", "生成ai", "生成ＡＩ",
            "言語モデル", "チャットボット"
        ]
        
        title_lower = title.lower()
        return any(keyword in title_lower for keyword in ai_keywords)


if __name__ == "__main__":
    # テスト実行
    collector = NewsCollector()
    articles = collector.collect_articles(hours_limit=72)
    
    for article in articles[:10]:
        print(f"\n{'='*60}")
        print(f"Title: {article.title}")
        print(f"Source: {article.source}")
        print(f"URL: {article.url}")
        print(f"Published: {article.published}")
