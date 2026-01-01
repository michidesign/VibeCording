# AI News Digest 🤖

毎朝6時に最新のAI関連ニュースを自動収集・要約・配信するツール

## ✨ 特徴

- **自動収集**: 日本語・英語サイトからRSSフィードを収集
- **スマート選定**: 重要度スコアリングで注目記事を厳選
- **日本語要約**: Gemini APIで英語記事も日本語に翻訳・要約
- **手動取得**: ボタンクリックでリアルタイムにニュースを取得
- **アーカイブ**: 過去のニュースをいつでも確認可能
- **スマホ対応**: モダンでレスポンシブなデザイン
- **完全無料**: GitHub Actions + GitHub Pagesで無料運用

## 📰 対応ニュースソース

### 日本語
- ITmedia AI+
- ITmedia NEWS
- GIGAZINE
- Impress Watch
- ASCII.jp
- CNET Japan

### 英語
- TechCrunch AI
- VentureBeat AI
- The Verge AI
- MIT Technology Review
- Wired AI
- Ars Technica
- Google AI Blog

## 📱 ページ構成

| ページ | 説明 |
|--------|------|
| `index.html` | 最新のニュース（毎朝自動更新） |
| `live.html` | 手動でリアルタイム取得 |
| `archive.html` | 過去ニュースの一覧 |
| `settings.html` | 配信設定・ソース管理 |

## 🚀 セットアップ

### 1. リポジトリをフォーク

このリポジトリをあなたのGitHubアカウントにフォークしてください。

### 2. Gemini APIキーを取得

1. [Google AI Studio](https://makersuite.google.com/app/apikey)にアクセス
2. 「Create API key」をクリック
3. 生成されたAPIキーをコピー

### 3. GitHub Secretsに登録

1. リポジトリの「Settings」→「Secrets and variables」→「Actions」
2. 「New repository secret」をクリック
3. Name: `GEMINI_API_KEY`
4. Secret: コピーしたAPIキーを貼り付け
5. 「Add secret」をクリック

### 4. GitHub Pagesを有効化

1. リポジトリの「Settings」→「Pages」
2. Source: 「Deploy from a branch」を選択
3. Branch: 「main」「/docs」を選択
4. 「Save」をクリック

### 5. 動作確認

1. 「Actions」タブから「Daily AI News Digest」ワークフローを選択
2. 「Run workflow」→「Run workflow」をクリック
3. 完了後、GitHub PagesのURLでニュースを確認

## ⚙️ 設定

### 設定画面（GUI）

`docs/settings.html`を開いて、以下を設定できます：

- 📅 配信時刻の変更
- 📰 出力記事数の変更
- ✅ ニュースソースの有効/無効切り替え
- ➕ カスタムRSSフィードの追加

### 設定ファイル

`config/settings.json`で詳細な設定が可能です。

## 🏗️ プロジェクト構成

```
ai-news-digest/
├── src/
│   ├── main.py              # メインスクリプト
│   ├── news_collector.py    # ニュース収集
│   ├── article_scorer.py    # スコアリング
│   ├── summarizer.py        # 要約生成（日英対応）
│   └── html_generator.py    # HTML生成
├── config/
│   └── settings.json        # 設定ファイル
├── docs/
│   ├── index.html           # 最新ニュースページ
│   ├── live.html            # 手動取得ページ
│   ├── archive.html         # アーカイブ一覧
│   ├── archive/             # 日付別アーカイブ
│   └── settings.html        # 設定画面
├── .github/
│   └── workflows/
│       └── daily_news.yml   # 自動実行設定
└── requirements.txt
```

## 🛠️ ローカル実行

```bash
# 依存パッケージをインストール
pip install -r requirements.txt

# 環境変数を設定
export GEMINI_API_KEY="your-api-key"

# 実行（ニュース収集〜HTML生成〜アーカイブ保存）
cd src
python main.py

# テストモード（記事収集のみ）
python main.py --test

# APIなしで実行（要約品質は低下）
python main.py --no-api
```

## 📄 ライセンス

MIT License

## 🙏 謝辞

- ニュースソース各社のRSSフィード
- Google Gemini API
- GitHub Actions & Pages
