---
name: digital-agency-design-system
description: デジタル庁デザインシステム（DADS）に基づいたアクセシブルで統一感のあるUIを作成する。行政機関・公共性の高いWebサイト/アプリ向け。Noto Sans JPフォント、8pxグリッド、WCAG 2.2準拠のアクセシビリティ対応。政府・自治体・公共機関のWebサイトをデザインする際に使用。
---

# デジタル庁デザインシステム（DADS）

デジタル庁デザインシステムに基づいた、アクセシブルで統一感のある UI を作成するためのデザインシステムです。

## このスキルを使用するタイミング

- 政府・行政機関のWebサイトやWebアプリケーションを作成するとき
- 自治体・公共機関のサービスサイトを構築するとき
- アクセシビリティ（WCAG 2.2 / JIS X 8341-3:2016）準拠のUIが必要なとき
- 日本語コンテンツ中心の公式サイトを設計するとき
- デジタル庁デザインシステム、DADS、行政デザインシステムを使用するとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | カラーパレット、セマンティックカラー、コントラスト比 |
| [typography.md](references/typography.md) | Noto Sans JP、タイプスケール、行間、見出し階層 |
| [components.md](references/components.md) | ボタン、フォーム、カード、ナビゲーション、通知、アコーディオン |
| [accessibility.md](references/accessibility.md) | WCAG 2.2準拠、キーボード操作、スクリーンリーダー対応 |
| [layout.md](references/layout.md) | 8pxグリッド、12カラム、ブレークポイント、ページレイアウト |

## デザイン原則

### 1. アクセシビリティファースト

- WCAG 2.2 および JIS X 8341-3:2016 に準拠
- コントラスト比は最低 4.5:1（テキスト）
- キーボード操作に完全対応
- スクリーンリーダー対応

### 2. 一貫性と予測可能性

- すべてのページで統一されたナビゲーション
- 予測可能なインタラクション
- 視覚的な一貫性で認知負荷を軽減

### 3. 読みやすさと明瞭さ

- 十分なフォントサイズ（本文16px以上）
- 適切な行間（1.5倍以上）
- 明確な情報階層

### 4. インクルーシブデザイン

- 多様なユーザーへの配慮
- 高齢者・障害者にも使いやすい設計
- モバイルからデスクトップまで対応

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* カラー */
  --dads-primary-500: #0071c1;
  --dads-text-primary: #212529;
  --dads-text-link: #0071c1;
  --dads-bg-primary: #ffffff;
  --dads-bg-secondary: #f8f9fa;
  --dads-border-default: #ced4da;
  --dads-error: #dc3545;
  --dads-success: #28a745;

  /* スペーシング（8px基準） */
  --space-2: 8px;
  --space-4: 16px;
  --space-5: 24px;
  --space-6: 32px;

  /* グリッド */
  --grid-gutter: 24px;
}

body {
  font-family: 'Noto Sans JP', sans-serif;
  font-size: 16px;
  line-height: 1.75;
  color: var(--dads-text-primary);
}
```

### Google Fonts のインポート

```html
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap" rel="stylesheet">
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ページタイトル - サービス名 | デジタル庁</title>
</head>
<body>
  <!-- スキップリンク -->
  <a href="#main-content" class="skip-link">本文へスキップ</a>

  <header class="header" role="banner">...</header>

  <nav class="breadcrumb" aria-label="パンくずリスト">...</nav>

  <main id="main-content" role="main">
    <div class="container">...</div>
  </main>

  <footer class="footer" role="contentinfo">...</footer>
</body>
</html>
```

### プライマリボタン

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 12px 24px;
  min-height: 48px;  /* タッチターゲット */

  background: var(--dads-primary-500);
  color: #ffffff;
  border: 2px solid var(--dads-primary-500);
  border-radius: 4px;

  font-size: 16px;
  font-weight: 700;
  cursor: pointer;
}

.btn-primary:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
}
```

## ベストプラクティス

### DO（推奨）

- `<html lang="ja">` を必ず設定
- スキップリンクを実装
- フォーカス状態を明確に表示（`:focus-visible`）
- フォーム要素にラベルを関連付け
- エラーは色だけでなくテキスト・アイコンでも伝達
- タッチターゲットを 48px 以上確保
- 見出しは h1 から順番に使用
- リンクテキストは具体的な内容を記述

### DON'T（非推奨）

- コントラスト比 4.5:1 未満の組み合わせ
- フォーカスリングの非表示（`outline: none`）
- 「こちら」「詳細」だけのリンクテキスト
- 自動再生するメディア
- 点滅するコンテンツ
- 色のみで情報を伝えるデザイン

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- 対象ユーザー（一般市民、事業者、行政職員等）を特定
- 必要なアクセシビリティレベルを確認

### 2. リファレンス参照

必要に応じて詳細なリファレンスを参照：

- カラーの詳細 → [colors.md](references/colors.md)
- タイポグラフィの詳細 → [typography.md](references/typography.md)
- コンポーネントの詳細 → [components.md](references/components.md)
- アクセシビリティの詳細 → [accessibility.md](references/accessibility.md)
- レイアウトの詳細 → [layout.md](references/layout.md)

### 3. コード生成ルール

- CSS変数でDADSトークンを使用
- セマンティックHTMLを使用（適切なランドマーク、見出し階層）
- WAI-ARIA属性を適切に使用
- 8pxグリッドに従ったスペーシング
- モバイルファーストでレスポンシブ対応

### 4. 品質チェックリスト

- [ ] `<html lang="ja">` を設定
- [ ] スキップリンクを実装
- [ ] 見出し階層が正しい（h1から順番）
- [ ] フォームにラベルが関連付け
- [ ] コントラスト比 4.5:1 以上
- [ ] フォーカスが見える
- [ ] タッチターゲット 48px 以上
- [ ] エラーがテキストで説明

## 参考リソース

- [デジタル庁デザインシステム公式サイト](https://design.digital.go.jp/)
- [WCAG 2.2 ガイドライン](https://www.w3.org/TR/WCAG22/)
- [JIS X 8341-3:2016](https://waic.jp/docs/jis2016/understanding/)
