# CLAUDE.md - リシテア勤怠ヘルパー

## プロジェクト概要

リシテア（勤怠管理システム）の入力画面に、Excelファイルから稼働データを自動入力するブラウザ拡張機能。完全ローカル動作で外部通信なし。

## 技術スタック

- **種別**: ブラウザ拡張機能（Chrome / Edge対応）
- **Manifest**: V3
- **UI**: HTML / CSS / JavaScript（Vanilla）
- **Excelパーサー**: SheetJS（xlsx.min.js）
- **デザインシステム**: デジタル庁デザインシステム（DADS）

## ディレクトリ構成

```
lysithea-helper/
├── manifest.json             # 拡張機能設定（Manifest V3）
├── popup.html                # ポップアップUI
├── popup.css                 # スタイル（DADS準拠）
├── popup.js                  # ポップアップロジック
├── content.js                # リシテア操作スクリプト
├── lib/
│   └── xlsx.min.js           # SheetJS Excelパーサー
├── icons/                    # 拡張機能アイコン
├── 勤怠入力テンプレート.xlsx   # ユーザー向けテンプレート
├── EXCEL_TEMPLATE_README.md  # テンプレート使用方法
├── README.md                 # プロジェクト説明
└── CLAUDE.md                 # AI向け開発ガイド
```

## 主要ファイル

| ファイル | 役割 |
|----------|------|
| `popup.js` | Excelファイル読み込み、プレビュー表示、content.jsへのメッセージ送信 |
| `content.js` | リシテア画面のDOM操作、フォーム自動入力 |
| `popup.css` | DADS準拠のスタイル定義 |

## デザインシステム

デジタル庁デザインシステム（DADS）に準拠。

### CSS変数

```css
--dads-primary-500: #0071c1;    /* プライマリカラー */
--dads-text-primary: #212529;   /* テキスト（主） */
--dads-text-secondary: #495057; /* テキスト（副） */
--dads-bg-primary: #ffffff;     /* 背景（主） */
--dads-bg-secondary: #f8f9fa;   /* 背景（副） */
```

### タイポグラフィ

- **フォント**: Noto Sans JP（Google Fonts）
- **本文サイズ**: 16px
- **行間**: 1.75

### アクセシビリティ要件

- コントラスト比 4.5:1 以上
- タッチターゲット 48px 以上
- `:focus-visible` でフォーカス表示
- 8pxグリッドベースのスペーシング

## 開発時の注意事項

### セキュリティ

- 外部通信は一切行わない
- ユーザーデータはローカルでのみ処理
- Content Security Policyに準拠

### ブラウザ拡張機能

- Manifest V3形式を使用
- `activeTab`権限でリシテアページにのみアクセス
- バックグラウンドサービスワーカーは使用しない

### UI変更時

- DADS準拠のカラー・スペーシングを維持
- アクセシビリティ要件を満たすこと
- `popup.css`のCSS変数を使用すること

## テスト方法

1. `edge://extensions/` または `chrome://extensions/` を開く
2. 開発者モードをON
3. 「展開して読み込み」でフォルダを選択
4. リシテア画面で動作確認
