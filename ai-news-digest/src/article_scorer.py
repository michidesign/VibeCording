"""
AIニュース配信ツール - 記事スコアリングモジュール

収集した記事にスコアを付けて、重要度順に並べ替える
"""

import json
import os
import re
from datetime import datetime, timedelta
from typing import List, Dict, Any
from dataclasses import dataclass


class ArticleScorer:
    """記事にスコアを付けるクラス"""
    
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
        
        self.scoring_config = self.config.get("scoring", {})
        self.keywords = self.scoring_config.get("keywords", {})
        self.weights = self.scoring_config.get("weights", {})
    
    def calculate_score(self, article: Any) -> float:
        """
        記事のスコアを計算する
        
        Args:
            article: 記事オブジェクト
            
        Returns:
            スコア値
        """
        score = 0.0
        
        # テキストを結合して検索対象にする
        text = f"{article.title} {article.description} {article.content}".lower()
        
        # 高優先度キーワードのチェック
        high_priority = self.keywords.get("high_priority", [])
        for keyword in high_priority:
            if keyword.lower() in text:
                score += self.weights.get("high_priority_keyword", 10)
        
        # 中優先度キーワードのチェック
        medium_priority = self.keywords.get("medium_priority", [])
        for keyword in medium_priority:
            if keyword.lower() in text:
                score += self.weights.get("medium_priority_keyword", 5)
        
        # 企業名のチェック
        company_names = self.keywords.get("company_names", [])
        for company in company_names:
            if company.lower() in text:
                score += self.weights.get("company_name", 8)
        
        # 時間による加点
        if article.published:
            now = datetime.now()
            age = now - article.published
            
            if age <= timedelta(hours=24):
                score += self.weights.get("recency_24h", 10)
            elif age <= timedelta(hours=48):
                score += self.weights.get("recency_48h", 5)
        
        # 日本語ソースの加点
        if article.language == "ja":
            score += self.weights.get("japanese_source", 3)
        
        # 特別なパターンの検出
        score += self._check_special_patterns(text)
        
        return score
    
    def _check_special_patterns(self, text: str) -> float:
        """
        特別なパターンを検出してスコアを加算
        
        Args:
            text: 検索対象テキスト
            
        Returns:
            追加スコア
        """
        score = 0.0
        
        # 新製品・サービス発表パターン
        launch_patterns = [
            r"launch(?:es|ed)?",
            r"announc(?:es|ed)?",
            r"releas(?:es|ed)?",
            r"introduc(?:es|ed)?",
            r"unveil(?:s|ed)?",
            r"発表",
            r"リリース",
            r"公開",
            r"提供開始"
        ]
        for pattern in launch_patterns:
            if re.search(pattern, text, re.IGNORECASE):
                score += 5
                break
        
        # ブレークスルー関連パターン
        breakthrough_patterns = [
            r"breakthrough",
            r"revolutionar",
            r"groundbreaking",
            r"state[- ]of[- ]the[- ]art",
            r"first[- ]ever",
            r"世界初",
            r"革新",
            r"画期的"
        ]
        for pattern in breakthrough_patterns:
            if re.search(pattern, text, re.IGNORECASE):
                score += 8
                break
        
        # バージョンアップデートパターン
        version_patterns = [
            r"gpt-5",
            r"gpt-4\.5",
            r"claude\s*4",
            r"gemini\s*2",
            r"llama\s*4",
            r"version\s*\d+",
            r"v\d+\.\d+"
        ]
        for pattern in version_patterns:
            if re.search(pattern, text, re.IGNORECASE):
                score += 7
                break
        
        return score
    
    def score_articles(self, articles: List[Any]) -> List[Any]:
        """
        記事リストにスコアを付けてソートする
        
        Args:
            articles: 記事オブジェクトのリスト
            
        Returns:
            スコア順にソートされた記事リスト
        """
        for article in articles:
            article.score = self.calculate_score(article)
        
        # スコアの高い順にソート
        sorted_articles = sorted(articles, key=lambda x: x.score, reverse=True)
        
        return sorted_articles
    
    def select_top_articles(self, articles: List[Any], count: int = 5) -> List[Any]:
        """
        上位N件の記事を選択する（重複を避ける）
        
        Args:
            articles: スコア済み記事リスト
            count: 選択する記事数
            
        Returns:
            選択された記事リスト
        """
        scored_articles = self.score_articles(articles)
        
        selected = []
        seen_titles = set()
        seen_urls = set()
        
        for article in scored_articles:
            # 重複チェック
            title_normalized = article.title.lower().strip()
            if title_normalized in seen_titles:
                continue
            if article.url in seen_urls:
                continue
            
            # 類似タイトルのチェック
            is_duplicate = False
            for seen_title in seen_titles:
                if self._is_similar_title(title_normalized, seen_title):
                    is_duplicate = True
                    break
            
            if is_duplicate:
                continue
            
            selected.append(article)
            seen_titles.add(title_normalized)
            seen_urls.add(article.url)
            
            if len(selected) >= count:
                break
        
        return selected
    
    def _is_similar_title(self, title1: str, title2: str) -> bool:
        """
        2つのタイトルが類似しているかチェック
        
        Args:
            title1: タイトル1
            title2: タイトル2
            
        Returns:
            類似しているかどうか
        """
        # 単語の集合で比較
        words1 = set(re.findall(r'\w+', title1.lower()))
        words2 = set(re.findall(r'\w+', title2.lower()))
        
        if not words1 or not words2:
            return False
        
        # Jaccard類似度
        intersection = len(words1 & words2)
        union = len(words1 | words2)
        
        similarity = intersection / union if union > 0 else 0
        
        return similarity > 0.6


if __name__ == "__main__":
    # テスト
    from news_collector import NewsCollector, Article
    
    collector = NewsCollector()
    articles = collector.collect_articles(hours_limit=72)
    
    scorer = ArticleScorer()
    top_articles = scorer.select_top_articles(articles, count=5)
    
    print("\n" + "="*60)
    print("TOP 5 AI NEWS")
    print("="*60)
    
    for i, article in enumerate(top_articles, 1):
        print(f"\n{i}. [{article.source}] {article.title}")
        print(f"   Score: {article.score:.1f}")
        print(f"   URL: {article.url}")
