---
name: salesforce-design
description: Salesforce風のLightning Design System (SLDS 2) に基づいたプロフェッショナルなUIを作成する。アクセントブルー(#3A49DA)をプライマリカラーに、Inter/Salesforce Sansフォント、モダンなコンポーネントスタイルを活用。CRM、ダッシュボード、管理画面、ビジネスアプリをSalesforce風にデザインする際に使用。
---

# Salesforce Lightning Design System

Salesforce Lightning Design System 2 (SLDS 2) に基づいた、エンタープライズグレードのプロフェッショナルな UI を作成するためのデザインシステムです。

## このスキルを使用するタイミング

- Salesforce風のWebアプリやダッシュボードを作成するとき
- CRM、管理画面、ビジネスアプリのUIが必要なとき
- エンタープライズ向けのプロフェッショナルなデザインを実装するとき
- データテーブル、フォーム、カードを多用するUIを設計するとき
- アクセシビリティを重視したUIが必要なとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | カラーパレット、ブランドカラー、ステータスカラー |
| [typography.md](references/typography.md) | Inter/Salesforce Sans、タイプスケール |
| [components.md](references/components.md) | ボタン、カード、フォーム、テーブル、モーダル |
| [layout.md](references/layout.md) | グリッドシステム、スペーシング、レスポンシブ |

## デザイン原則

### 1. Clarity（明快さ）

- 明確で理解しやすいUI
- 一貫したビジュアル言語
- 直感的なナビゲーション

### 2. Efficiency（効率性）

- ワークフローを最適化
- 少ないクリックで目標達成
- 再利用可能なコンポーネント

### 3. Consistency（一貫性）

- 統一されたパターン
- 予測可能なインタラクション
- プラットフォーム全体での統一感

### 4. Accessibility（アクセシビリティ）

- WCAG 2.1 AA準拠
- キーボードナビゲーション対応
- スクリーンリーダー対応

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* Primary Colors */
  --slds-color-brand: #3A49DA;
  --slds-color-brand-dark: #03234D;
  --slds-color-brand-light: #E0E5F8;

  /* Neutral Colors */
  --slds-color-text-default: #001642;
  --slds-color-text-secondary: #5C5C5C;
  --slds-color-background: #FFFFFF;
  --slds-color-background-alt: #F3F3F3;

  /* Border Colors */
  --slds-color-border: #C3C3C3;
  --slds-color-border-light: #E5E5E5;

  /* Typography */
  --slds-font-family: 'Inter', 'Salesforce Sans', -apple-system, BlinkMacSystemFont, sans-serif;
  --slds-font-family-heading: 'AvantGardeForSalesforce', 'Inter', sans-serif;

  /* Spacing */
  --slds-spacing-xx-small: 0.25rem;  /* 4px */
  --slds-spacing-x-small: 0.5rem;    /* 8px */
  --slds-spacing-small: 0.75rem;     /* 12px */
  --slds-spacing-medium: 1rem;       /* 16px */
  --slds-spacing-large: 1.5rem;      /* 24px */
  --slds-spacing-x-large: 2rem;      /* 32px */

  /* Border Radius */
  --slds-border-radius-small: 0.25rem;
  --slds-border-radius-medium: 0.5rem;
  --slds-border-radius-large: 0.75rem;

  /* Shadow */
  --slds-shadow-card: 0 2px 4px rgba(0, 0, 0, 0.1);
  --slds-shadow-dropdown: 0 4px 12px rgba(0, 0, 0, 0.15);
}
```

### Google Fonts のインポート

```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Salesforce Style App</title>
</head>
<body>
  <!-- Global Header -->
  <header class="slds-global-header">
    <div class="slds-global-header__logo">
      <img src="logo.svg" alt="Logo">
    </div>
    <nav class="slds-global-header__nav">
      <!-- Navigation Items -->
    </nav>
    <div class="slds-global-header__actions">
      <!-- Action Buttons -->
    </div>
  </header>

  <!-- Main Content -->
  <main class="slds-page">
    <div class="slds-page__header">
      <h1 class="slds-page__title">Page Title</h1>
    </div>
    <div class="slds-page__body">
      <!-- Page Content -->
      <div class="slds-card">
        <div class="slds-card__header">
          <h2 class="slds-card__title">Card Title</h2>
        </div>
        <div class="slds-card__body">
          Content
        </div>
      </div>
    </div>
  </main>
</body>
</html>
```

### Button（ボタン）

```css
.slds-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  height: 2.5rem;
  padding: 0 1rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  font-weight: 600;
  line-height: 1;

  border: none;
  border-radius: var(--slds-border-radius-small);
  cursor: pointer;
  transition: all 0.15s ease;
}

.slds-button--brand {
  background-color: var(--slds-color-brand);
  color: #FFFFFF;
}

.slds-button--brand:hover {
  background-color: #2E3DB8;
}

.slds-button--outline {
  background-color: transparent;
  color: var(--slds-color-brand);
  border: 1px solid var(--slds-color-brand);
}

.slds-button--outline:hover {
  background-color: var(--slds-color-brand-light);
}

.slds-button--neutral {
  background-color: #FFFFFF;
  color: var(--slds-color-text-default);
  border: 1px solid var(--slds-color-border);
}

.slds-button--neutral:hover {
  background-color: var(--slds-color-background-alt);
}
```

### Card（カード）

```css
.slds-card {
  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border-light);
  border-radius: var(--slds-border-radius-medium);
  box-shadow: var(--slds-shadow-card);
}

.slds-card__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--slds-spacing-medium);
  border-bottom: 1px solid var(--slds-color-border-light);
}

.slds-card__title {
  font-family: var(--slds-font-family);
  font-size: 1rem;
  font-weight: 600;
  color: var(--slds-color-text-default);
  margin: 0;
}

.slds-card__body {
  padding: var(--slds-spacing-medium);
}

.slds-card__footer {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: var(--slds-spacing-x-small);
  padding: var(--slds-spacing-medium);
  border-top: 1px solid var(--slds-color-border-light);
}
```

## ベストプラクティス

### DO（推奨）

- CSS変数でデザイントークンを管理
- 4px/8pxの基準グリッドに従う
- セマンティックなカラー名を使用
- 十分なコントラスト比を確保（4.5:1以上）
- フォーカス状態を明示的に表示

### DON'T（非推奨）

- ハードコードされたカラー値
- 基準グリッド外のスペーシング
- 不十分なコントラスト
- フォーカスインジケーターの削除
- 過度なアニメーション

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- 必要なコンポーネント（ボタン、カード、テーブル等）を特定
- ダークテーマ対応の有無を確認

### 2. リファレンス参照

必要に応じて詳細なリファレンスを参照：

- カラーの詳細 → [colors.md](references/colors.md)
- タイポグラフィの詳細 → [typography.md](references/typography.md)
- コンポーネントの詳細 → [components.md](references/components.md)
- レイアウトの詳細 → [layout.md](references/layout.md)

### 3. コード生成ルール

- CSS変数でSLDSトークンを使用
- 4px/8pxグリッドに従ったスペーシング
- セマンティックカラー（brand, text, background）を使用
- アクセシビリティを考慮（ARIA属性、コントラスト）
- レスポンシブブレークポイントを考慮

### 4. 品質チェックリスト

- [ ] CSS変数でデザイントークンを管理しているか
- [ ] カラーのコントラストは十分か
- [ ] スペーシングは基準グリッドに従っているか
- [ ] フォーカス状態が明示されているか
- [ ] レスポンシブに対応しているか
- [ ] ARIA属性が適切に設定されているか
