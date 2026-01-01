"""
AIニュース配信ツール - 要約生成モジュール

Gemini API（無料枠）を使用して記事を日本語で要約する
新しいgoogle-genaiパッケージを使用
"""

import os
import time
from typing import List, Any, Optional

# 新しいパッケージをインポート
try:
    from google import genai
    from google.genai import types
    USE_NEW_API = True
except ImportError:
    # フォールバック: 古いパッケージを使用
    import google.generativeai as genai_old
    USE_NEW_API = False


class Summarizer:
    """Gemini APIを使用して記事を要約するクラス"""
    
    def __init__(self, api_key: str = None):
        """
        初期化
        
        Args:
            api_key: Gemini APIキー（環境変数から取得可能）
        """
        self.api_key = api_key or os.environ.get("GEMINI_API_KEY")
        
        if not self.api_key:
            raise ValueError(
                "Gemini API key is required. "
                "Set GEMINI_API_KEY environment variable or pass api_key parameter."
            )
        
        if USE_NEW_API:
            self.client = genai.Client(api_key=self.api_key)
            self.model_name = "gemini-2.0-flash"
        else:
            genai_old.configure(api_key=self.api_key)
            self.model = genai_old.GenerativeModel("gemini-1.5-flash")
        
        # レート制限対策（無料枠: 15 RPM）
        self.request_interval = 5  # 秒
        self.last_request_time = 0
    
    def _wait_for_rate_limit(self):
        """レート制限を回避するための待機"""
        elapsed = time.time() - self.last_request_time
        if elapsed < self.request_interval:
            time.sleep(self.request_interval - elapsed)
        self.last_request_time = time.time()
    
    def summarize_article(self, article: Any) -> str:
        """
        単一の記事を要約する（英語記事は日本語に翻訳・要約）
        
        Args:
            article: 記事オブジェクト
            
        Returns:
            日本語の要約
        """
        self._wait_for_rate_limit()
        
        # 英語記事の場合は翻訳も行う
        is_english = article.language == "en"
        
        if is_english:
            prompt = f"""以下の英語のAI関連ニュース記事を、日本語で分かりやすく要約してください。

## 要約のルール:
1. 3〜5文で簡潔にまとめる
2. 技術的なポイントを分かりやすく説明する
3. 読者がこの記事を読むべき理由が分かるようにする
4. 専門用語は日本語で説明を加える
5. 箇条書きは使わず、自然な日本語の文章で書く
6. 英語の固有名詞（製品名、会社名など）はそのままカタカナまたは英語で表記

## 記事情報:
タイトル（英語）: {article.title}
ソース: {article.source}

本文（英語）:
{article.content[:2500]}

## 日本語要約:"""
        else:
            prompt = f"""以下のAI関連ニュース記事を日本語で要約してください。

## 要約のルール:
1. 3〜5文で簡潔にまとめる
2. 技術的なポイントを分かりやすく説明する
3. 読者がこの記事を読むべき理由が分かるようにする
4. 専門用語は必要に応じて簡単な説明を加える
5. 箇条書きは使わず、自然な文章で書く

## 記事情報:
タイトル: {article.title}
ソース: {article.source}

本文:
{article.content[:2500]}

## 日本語要約:"""

        try:
            if USE_NEW_API:
                response = self.client.models.generate_content(
                    model=self.model_name,
                    contents=prompt,
                    config=types.GenerateContentConfig(
                        max_output_tokens=500,
                        temperature=0.3,
                    )
                )
                summary = response.text.strip()
            else:
                response = self.model.generate_content(
                    prompt,
                    generation_config=genai_old.GenerationConfig(
                        max_output_tokens=500,
                        temperature=0.3,
                    )
                )
                summary = response.text.strip()
            
            # 「## 日本語要約:」などのプレフィックスを除去
            if summary.startswith("##"):
                lines = summary.split("\n")
                summary = "\n".join(lines[1:]).strip()
            
            return summary
            
        except Exception as e:
            print(f"Error summarizing article: {e}")
            # フォールバック: 記事のdescriptionを使用
            return article.description[:300] if article.description else ""
    
    def translate_title(self, article: Any) -> str:
        """
        英語タイトルを日本語に翻訳する
        
        Args:
            article: 記事オブジェクト
            
        Returns:
            日本語タイトル
        """
        if article.language != "en":
            return article.title
        
        self._wait_for_rate_limit()
        
        prompt = f"""以下の英語のニュース記事タイトルを、自然な日本語に翻訳してください。

## ルール:
- 簡潔で分かりやすい日本語にする
- 固有名詞（OpenAI, Google, Claudeなど）はそのまま英語またはカタカナで表記
- 翻訳結果のみを出力（説明は不要）

## 英語タイトル:
{article.title}

## 日本語タイトル:"""

        try:
            if USE_NEW_API:
                response = self.client.models.generate_content(
                    model=self.model_name,
                    contents=prompt,
                    config=types.GenerateContentConfig(
                        max_output_tokens=100,
                        temperature=0.2,
                    )
                )
                title = response.text.strip()
            else:
                response = self.model.generate_content(
                    prompt,
                    generation_config=genai_old.GenerationConfig(
                        max_output_tokens=100,
                        temperature=0.2,
                    )
                )
                title = response.text.strip()
            
            # プレフィックスを除去
            if title.startswith("##"):
                lines = title.split("\n")
                title = "\n".join(lines[1:]).strip()
            
            return title
            
        except Exception as e:
            print(f"Error translating title: {e}")
            return article.title
    
    def summarize_articles(self, articles: List[Any]) -> List[Any]:
        """
        複数の記事を要約する（英語記事はタイトル翻訳も行う）
        
        Args:
            articles: 記事オブジェクトのリスト
            
        Returns:
            要約が追加された記事リスト
        """
        print(f"Summarizing {len(articles)} articles...")
        
        for i, article in enumerate(articles):
            print(f"  [{i+1}/{len(articles)}] {article.title[:50]}...")
            
            # 英語記事の場合はタイトルを翻訳
            if article.language == "en":
                translated_title = self.translate_title(article)
                article.title_ja = translated_title
                print(f"    → 日本語タイトル: {translated_title[:40]}...")
            else:
                article.title_ja = article.title
            
            # 要約を生成
            summary = self.summarize_article(article)
            article.summary = summary
            
            print(f"    ✓ Summary generated ({len(summary)} chars)")
        
        return articles


class FallbackSummarizer:
    """API不要のフォールバック要約クラス"""
    
    def summarize_article(self, article: Any) -> str:
        """
        記事のdescriptionを使用した簡易要約
        
        Args:
            article: 記事オブジェクト
            
        Returns:
            要約テキスト
        """
        if article.description:
            return article.description[:400]
        elif article.content:
            return article.content[:400]
        else:
            return "要約を生成できませんでした。"
    
    def summarize_articles(self, articles: List[Any]) -> List[Any]:
        """複数記事の簡易要約（title_jaも設定）"""
        for article in articles:
            article.summary = self.summarize_article(article)
            # title_jaがない場合は元のタイトルを設定
            article.title_ja = article.title
        return articles


def get_summarizer(use_api: bool = True) -> Any:
    """
    要約クラスのファクトリ関数
    
    Args:
        use_api: APIを使用するかどうか
        
    Returns:
        Summarizer または FallbackSummarizer
    """
    if use_api:
        try:
            return Summarizer()
        except ValueError:
            print("Gemini API key not found. Using fallback summarizer.")
            return FallbackSummarizer()
    else:
        return FallbackSummarizer()


if __name__ == "__main__":
    # テスト
    from news_collector import NewsCollector, Article
    from article_scorer import ArticleScorer
    
    collector = NewsCollector()
    articles = collector.collect_articles(hours_limit=72)
    
    scorer = ArticleScorer()
    top_articles = scorer.select_top_articles(articles, count=3)
    
    summarizer = get_summarizer(use_api=True)
    summarized = summarizer.summarize_articles(top_articles)
    
    for article in summarized:
        print(f"\n{'='*60}")
        print(f"Title: {article.title}")
        print(f"Summary: {article.summary}")
