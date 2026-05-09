# Salesforce Lightning Design System タイポグラフィ

Lightning Design System 2 (SLDS 2) に基づいたタイポグラフィシステムの完全なリファレンス。

## フォントファミリー

### 基本フォント

```css
:root {
  /* Body Text */
  --slds-font-family: 'Inter', 'Salesforce Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;

  /* Headings / Display */
  --slds-font-family-heading: 'AvantGardeForSalesforce', 'Inter', var(--slds-font-family);

  /* Monospace (Code) */
  --slds-font-family-mono: 'SF Mono', 'Monaco', 'Inconsolata', 'Fira Code', monospace;
}
```

### Google Fonts の読み込み

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

## フォントウェイト

```css
:root {
  --slds-font-weight-regular: 400;
  --slds-font-weight-medium: 500;
  --slds-font-weight-semibold: 600;
  --slds-font-weight-bold: 700;
}
```

## タイプスケール

### Display（大見出し）

```css
:root {
  /* Display Large */
  --slds-font-size-display-large: 2.5rem;    /* 40px */
  --slds-line-height-display-large: 1.2;
  --slds-font-weight-display-large: 700;

  /* Display Medium */
  --slds-font-size-display-medium: 2rem;      /* 32px */
  --slds-line-height-display-medium: 1.25;
  --slds-font-weight-display-medium: 700;

  /* Display Small */
  --slds-font-size-display-small: 1.75rem;    /* 28px */
  --slds-line-height-display-small: 1.28;
  --slds-font-weight-display-small: 600;
}

.slds-text-display-large {
  font-family: var(--slds-font-family-heading);
  font-size: var(--slds-font-size-display-large);
  line-height: var(--slds-line-height-display-large);
  font-weight: var(--slds-font-weight-display-large);
  letter-spacing: -0.02em;
}

.slds-text-display-medium {
  font-family: var(--slds-font-family-heading);
  font-size: var(--slds-font-size-display-medium);
  line-height: var(--slds-line-height-display-medium);
  font-weight: var(--slds-font-weight-display-medium);
  letter-spacing: -0.01em;
}

.slds-text-display-small {
  font-family: var(--slds-font-family-heading);
  font-size: var(--slds-font-size-display-small);
  line-height: var(--slds-line-height-display-small);
  font-weight: var(--slds-font-weight-display-small);
}
```

### Heading（見出し）

```css
:root {
  /* Heading Large */
  --slds-font-size-heading-large: 1.5rem;     /* 24px */
  --slds-line-height-heading-large: 1.33;
  --slds-font-weight-heading-large: 600;

  /* Heading Medium */
  --slds-font-size-heading-medium: 1.25rem;   /* 20px */
  --slds-line-height-heading-medium: 1.4;
  --slds-font-weight-heading-medium: 600;

  /* Heading Small */
  --slds-font-size-heading-small: 1.125rem;   /* 18px */
  --slds-line-height-heading-small: 1.44;
  --slds-font-weight-heading-small: 600;

  /* Heading X-Small */
  --slds-font-size-heading-x-small: 1rem;     /* 16px */
  --slds-line-height-heading-x-small: 1.5;
  --slds-font-weight-heading-x-small: 600;
}

.slds-text-heading-large {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-heading-large);
  line-height: var(--slds-line-height-heading-large);
  font-weight: var(--slds-font-weight-heading-large);
  color: var(--slds-color-text-default);
}

.slds-text-heading-medium {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-heading-medium);
  line-height: var(--slds-line-height-heading-medium);
  font-weight: var(--slds-font-weight-heading-medium);
  color: var(--slds-color-text-default);
}

.slds-text-heading-small {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-heading-small);
  line-height: var(--slds-line-height-heading-small);
  font-weight: var(--slds-font-weight-heading-small);
  color: var(--slds-color-text-default);
}
```

### Body（本文）

```css
:root {
  /* Body Large */
  --slds-font-size-body-large: 1rem;          /* 16px */
  --slds-line-height-body-large: 1.5;
  --slds-font-weight-body-large: 400;

  /* Body Medium */
  --slds-font-size-body-medium: 0.875rem;     /* 14px */
  --slds-line-height-body-medium: 1.43;
  --slds-font-weight-body-medium: 400;

  /* Body Small */
  --slds-font-size-body-small: 0.8125rem;     /* 13px */
  --slds-line-height-body-small: 1.38;
  --slds-font-weight-body-small: 400;
}

.slds-text-body-large {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-large);
  line-height: var(--slds-line-height-body-large);
  font-weight: var(--slds-font-weight-body-large);
  color: var(--slds-color-text-default);
}

.slds-text-body-medium {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-medium);
  line-height: var(--slds-line-height-body-medium);
  font-weight: var(--slds-font-weight-body-medium);
  color: var(--slds-color-text-default);
}

.slds-text-body-small {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-small);
  line-height: var(--slds-line-height-body-small);
  font-weight: var(--slds-font-weight-body-small);
  color: var(--slds-color-text-secondary);
}
```

### Label（ラベル）

```css
:root {
  /* Label Large */
  --slds-font-size-label-large: 0.875rem;     /* 14px */
  --slds-line-height-label-large: 1.43;
  --slds-font-weight-label-large: 600;

  /* Label Medium */
  --slds-font-size-label-medium: 0.8125rem;   /* 13px */
  --slds-line-height-label-medium: 1.38;
  --slds-font-weight-label-medium: 500;

  /* Label Small */
  --slds-font-size-label-small: 0.75rem;      /* 12px */
  --slds-line-height-label-small: 1.33;
  --slds-font-weight-label-small: 500;
}

.slds-text-label {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-label-medium);
  line-height: var(--slds-line-height-label-medium);
  font-weight: var(--slds-font-weight-label-medium);
  color: var(--slds-color-text-secondary);
  text-transform: none;
}

.slds-text-label-caps {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-label-small);
  line-height: var(--slds-line-height-label-small);
  font-weight: var(--slds-font-weight-label-large);
  letter-spacing: 0.05em;
  text-transform: uppercase;
  color: var(--slds-color-text-secondary);
}
```

## タイプスケールの一覧

| クラス | サイズ | 行間 | ウェイト | 用途 |
|--------|--------|------|----------|------|
| display-large | 40px | 1.2 | Bold | ヒーローセクション |
| display-medium | 32px | 1.25 | Bold | ページタイトル |
| display-small | 28px | 1.28 | Semibold | セクションタイトル |
| heading-large | 24px | 1.33 | Semibold | カードタイトル |
| heading-medium | 20px | 1.4 | Semibold | サブセクション |
| heading-small | 18px | 1.44 | Semibold | 小見出し |
| heading-x-small | 16px | 1.5 | Semibold | リスト見出し |
| body-large | 16px | 1.5 | Regular | 主要本文 |
| body-medium | 14px | 1.43 | Regular | 標準本文 |
| body-small | 13px | 1.38 | Regular | 補助テキスト |
| label-large | 14px | 1.43 | Semibold | フォームラベル |
| label-medium | 13px | 1.38 | Medium | ボタンテキスト |
| label-small | 12px | 1.33 | Medium | キャプション |

## コンポーネント別タイポグラフィ

### Page Header

```css
.slds-page__title {
  font-family: var(--slds-font-family-heading);
  font-size: var(--slds-font-size-display-small);
  line-height: var(--slds-line-height-display-small);
  font-weight: var(--slds-font-weight-display-small);
  color: var(--slds-color-text-default);
  margin: 0;
}

.slds-page__subtitle {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-medium);
  line-height: var(--slds-line-height-body-medium);
  color: var(--slds-color-text-secondary);
  margin-top: 0.25rem;
}
```

### Card

```css
.slds-card__title {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-heading-x-small);
  line-height: var(--slds-line-height-heading-x-small);
  font-weight: var(--slds-font-weight-heading-x-small);
  color: var(--slds-color-text-default);
  margin: 0;
}

.slds-card__body {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-medium);
  line-height: var(--slds-line-height-body-medium);
  color: var(--slds-color-text-default);
}
```

### Data Table

```css
.slds-table__header-cell {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-label-small);
  font-weight: var(--slds-font-weight-label-large);
  letter-spacing: 0.02em;
  text-transform: uppercase;
  color: var(--slds-color-text-secondary);
}

.slds-table__cell {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-medium);
  line-height: var(--slds-line-height-body-medium);
  color: var(--slds-color-text-default);
}
```

### Button

```css
.slds-button {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-label-medium);
  font-weight: var(--slds-font-weight-label-large);
  line-height: 1;
  letter-spacing: 0.01em;
}
```

### Form Elements

```css
.slds-form-element__label {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-label-medium);
  font-weight: var(--slds-font-weight-label-medium);
  color: var(--slds-color-text-secondary);
  margin-bottom: 0.25rem;
}

.slds-input {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-medium);
  line-height: var(--slds-line-height-body-medium);
  color: var(--slds-color-text-default);
}

.slds-input::placeholder {
  color: var(--slds-color-text-placeholder);
}

.slds-form-element__help {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-body-small);
  line-height: var(--slds-line-height-body-small);
  color: var(--slds-color-text-secondary);
  margin-top: 0.25rem;
}
```

### Navigation

```css
.slds-nav__item {
  font-family: var(--slds-font-family);
  font-size: var(--slds-font-size-label-medium);
  font-weight: var(--slds-font-weight-label-medium);
  color: var(--slds-color-text-inverse);
}

.slds-nav__item.is-active {
  font-weight: var(--slds-font-weight-label-large);
}
```

## テキストユーティリティ

### 文字揃え

```css
.slds-text-align-left { text-align: left; }
.slds-text-align-center { text-align: center; }
.slds-text-align-right { text-align: right; }
```

### テキストの切り詰め

```css
.slds-truncate {
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.slds-line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
```

### テキストカラー

```css
.slds-text-color-default { color: var(--slds-color-text-default); }
.slds-text-color-secondary { color: var(--slds-color-text-secondary); }
.slds-text-color-link { color: var(--slds-color-text-link); }
.slds-text-color-error { color: var(--slds-color-error); }
.slds-text-color-success { color: var(--slds-color-success); }
```

## レスポンシブタイポグラフィ

```css
/* デフォルト（モバイル） */
:root {
  --slds-font-size-display-large: 1.75rem;
  --slds-font-size-display-medium: 1.5rem;
  --slds-font-size-display-small: 1.25rem;
}

/* タブレット以上 */
@media (min-width: 768px) {
  :root {
    --slds-font-size-display-large: 2rem;
    --slds-font-size-display-medium: 1.75rem;
    --slds-font-size-display-small: 1.5rem;
  }
}

/* デスクトップ */
@media (min-width: 1024px) {
  :root {
    --slds-font-size-display-large: 2.5rem;
    --slds-font-size-display-medium: 2rem;
    --slds-font-size-display-small: 1.75rem;
  }
}
```

## ベストプラクティス

### DO（推奨）

- CSS変数でタイポグラフィを一元管理
- 適切な見出し階層を維持（h1 → h2 → h3）
- 十分な行間を確保（1.4〜1.6）
- フォントサイズは16px以上を基本に
- システムフォントをフォールバックに含める

### DON'T（非推奨）

- ハードコードされたフォントサイズ
- 過度に小さいフォントサイズ（12px未満）
- 行間が狭すぎるテキスト（1.2未満）
- 見出し階層のスキップ
- 過度に多くのフォントウェイトの使用
