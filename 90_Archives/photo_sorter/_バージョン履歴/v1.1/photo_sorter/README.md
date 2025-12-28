# PhotoSorter AI

Gemini APIを使用した写真自動選別GUIアプリケーション

## 概要

家族写真を自動的に「Best」「Good」「Skip」に分類するAIアシスタントです。
Google Geminiの視覚認識能力を活用し、子どもの写真のベストショットを自動選別します。

## 機能

- 📷 **AI写真分類**: Gemini APIが写真の品質・表情を分析
- ⏳ **待機状態の可視化**: カウントダウン表示でフリーズと誤認されない
- 🔄 **429エラー対応**: 自動リトライ（指数バックオフ）
- 📁 **EXIF維持**: 撮影日時などのメタデータを保持
- ⏸️ **一時停止/再開**: 処理の中断・再開が可能

## インストール

```bash
# Homebrew Pythonをインストール（初回のみ）
brew install python@3.12 python-tk@3.12

# フォルダに移動
cd photo_sorter

# 仮想環境を作成（初回のみ）
/opt/homebrew/bin/python3.12 -m venv venv

# 依存パッケージインストール（初回のみ）
source venv/bin/activate
pip install Pillow piexif
```

## 使い方

### 1. アプリ起動

```bash
cd photo_sorter
source venv/bin/activate && python photo_sorter_final.py
```

### 2. 設定

1. **APIキー**: [Google AI Studio](https://aistudio.google.com/app/apikey)でAPIキーを取得し入力
2. **「✓ 検証」ボタン**: APIキーをテスト
3. **入力フォルダ**: 分類したい写真があるフォルダを選択
4. **出力フォルダ**: 分類結果を保存するフォルダを選択
5. **処理間隔**: API制限に合わせて調整（デフォルト10秒）

### 3. 実行

「▶ 開始」ボタンをクリックすると処理が始まります。

## 出力フォルダ構成

```
出力フォルダ/
├── Best/    # 85-100点: 奇跡の1枚
├── Good/    # 60-84点: アルバム候補  
└── Skip/    # 0-59点: ピンボケ・目つぶり等
```

## 注意事項

- **無料枠の制限**: 処理間隔を短くしすぎると429エラーが増えます
- **対応形式**: JPG, JPEG, PNG, WebP, HEIC, HEIF
- **処理時間**: 1枚あたり約10-15秒（待機含む）

## トラブルシューティング

| 症状 | 対処法 |
|------|--------|
| 「429エラー」が頻発 | 処理間隔を20秒以上に設定 |
| APIキー検証失敗 | Google AI Studioで再発行 |
| 画像が認識されない | 対応形式か確認 |

## ライセンス

MIT License
