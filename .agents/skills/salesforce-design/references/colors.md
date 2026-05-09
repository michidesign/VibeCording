# Salesforce Lightning Design System カラーシステム

Lightning Design System 2 (SLDS 2) に基づいたカラーシステムの完全なリファレンス。

## ブランドカラー

### プライマリ

```css
:root {
  /* Brand Primary */
  --slds-color-brand: #3A49DA;
  --slds-color-brand-hover: #2E3DB8;
  --slds-color-brand-active: #252F96;
  --slds-color-brand-light: #E0E5F8;
  --slds-color-brand-dark: #03234D;

  /* On Brand (テキスト) */
  --slds-color-on-brand: #FFFFFF;
  --slds-color-on-brand-light: #001642;
}
```

### Salesforce Blue パレット

```css
:root {
  /* Blue Scale */
  --slds-color-blue-50: #E0E5F8;
  --slds-color-blue-100: #C2CBF1;
  --slds-color-blue-200: #A3B1EA;
  --slds-color-blue-300: #8597E3;
  --slds-color-blue-400: #667DDC;
  --slds-color-blue-500: #3A49DA;
  --slds-color-blue-600: #2E3DB8;
  --slds-color-blue-700: #252F96;
  --slds-color-blue-800: #1C2374;
  --slds-color-blue-900: #03234D;
}
```

## ニュートラルカラー

### グレースケール

```css
:root {
  /* Gray Scale */
  --slds-color-gray-50: #FAFAFA;
  --slds-color-gray-100: #F3F3F3;
  --slds-color-gray-200: #E5E5E5;
  --slds-color-gray-300: #C3C3C3;
  --slds-color-gray-400: #9E9E9E;
  --slds-color-gray-500: #706E6B;
  --slds-color-gray-600: #5C5C5C;
  --slds-color-gray-700: #444444;
  --slds-color-gray-800: #2E2E2E;
  --slds-color-gray-900: #181818;
}
```

## テキストカラー

```css
:root {
  /* Text Colors */
  --slds-color-text-default: #001642;
  --slds-color-text-secondary: #5C5C5C;
  --slds-color-text-placeholder: #706E6B;
  --slds-color-text-disabled: #9E9E9E;
  --slds-color-text-inverse: #FFFFFF;
  --slds-color-text-link: #3A49DA;
  --slds-color-text-link-hover: #2E3DB8;
}
```

## 背景カラー

```css
:root {
  /* Background Colors */
  --slds-color-background: #FFFFFF;
  --slds-color-background-alt: #F3F3F3;
  --slds-color-background-hover: #F3F3F3;
  --slds-color-background-active: #E0E5F8;
  --slds-color-background-selected: #E0E5F8;
  --slds-color-background-row-hover: #F3F3F3;
  --slds-color-background-row-selected: #E0E5F8;
}
```

## ボーダーカラー

```css
:root {
  /* Border Colors */
  --slds-color-border: #C3C3C3;
  --slds-color-border-light: #E5E5E5;
  --slds-color-border-dark: #706E6B;
  --slds-color-border-focus: #3A49DA;
  --slds-color-border-error: #BA0517;
}
```

## ステータスカラー

### Success（成功）

```css
:root {
  /* Success */
  --slds-color-success: #2E844A;
  --slds-color-success-light: #DEF9F3;
  --slds-color-success-dark: #194E31;
  --slds-color-on-success: #FFFFFF;
}
```

### Warning（警告）

```css
:root {
  /* Warning */
  --slds-color-warning: #DD7A01;
  --slds-color-warning-light: #FEF4E6;
  --slds-color-warning-dark: #8C4B02;
  --slds-color-on-warning: #FFFFFF;
}
```

### Error（エラー）

```css
:root {
  /* Error */
  --slds-color-error: #BA0517;
  --slds-color-error-light: #FEF0F3;
  --slds-color-error-dark: #8E030F;
  --slds-color-on-error: #FFFFFF;
}
```

### Info（情報）

```css
:root {
  /* Info */
  --slds-color-info: #066AFE;
  --slds-color-info-light: #E5F1FE;
  --slds-color-info-dark: #0B4FBF;
  --slds-color-on-info: #FFFFFF;
}
```

## ダークテーマ

```css
@media (prefers-color-scheme: dark) {
  :root {
    /* Brand */
    --slds-color-brand: #6B7FFF;
    --slds-color-brand-hover: #8A9AFF;
    --slds-color-brand-light: #1E2A5E;
    --slds-color-on-brand: #FFFFFF;
    --slds-color-on-brand-light: #E0E5F8;

    /* Text */
    --slds-color-text-default: #FFFFFF;
    --slds-color-text-secondary: #B0B0B0;
    --slds-color-text-placeholder: #8A8A8A;
    --slds-color-text-link: #8A9AFF;

    /* Background */
    --slds-color-background: #181818;
    --slds-color-background-alt: #2E2E2E;
    --slds-color-background-hover: #3A3A3A;
    --slds-color-background-active: #1E2A5E;

    /* Border */
    --slds-color-border: #444444;
    --slds-color-border-light: #3A3A3A;
    --slds-color-border-focus: #6B7FFF;

    /* Status Light Backgrounds */
    --slds-color-success-light: #1A3D2A;
    --slds-color-warning-light: #3D2F1A;
    --slds-color-error-light: #3D1A1A;
    --slds-color-info-light: #1A2A3D;
  }
}
```

## コンポーネント別カラー適用

### Global Header

```css
.slds-global-header {
  background-color: var(--slds-color-brand-dark);
  color: var(--slds-color-text-inverse);
}

.slds-global-header__nav-item:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

.slds-global-header__nav-item.is-active {
  border-bottom: 2px solid var(--slds-color-brand);
}
```

### Cards

```css
.slds-card {
  background-color: var(--slds-color-background);
  border: 1px solid var(--slds-color-border-light);
}

.slds-card__header {
  border-bottom: 1px solid var(--slds-color-border-light);
}
```

### Buttons

```css
.slds-button--brand {
  background-color: var(--slds-color-brand);
  color: var(--slds-color-on-brand);
}

.slds-button--brand:hover {
  background-color: var(--slds-color-brand-hover);
}

.slds-button--destructive {
  background-color: var(--slds-color-error);
  color: var(--slds-color-on-error);
}
```

### Form Elements

```css
.slds-input {
  border: 1px solid var(--slds-color-border);
  background-color: var(--slds-color-background);
  color: var(--slds-color-text-default);
}

.slds-input:focus {
  border-color: var(--slds-color-border-focus);
  box-shadow: 0 0 0 1px var(--slds-color-border-focus);
}

.slds-input--error {
  border-color: var(--slds-color-error);
}
```

### Data Tables

```css
.slds-table__row:hover {
  background-color: var(--slds-color-background-row-hover);
}

.slds-table__row.is-selected {
  background-color: var(--slds-color-background-row-selected);
}

.slds-table__header {
  background-color: var(--slds-color-background-alt);
  border-bottom: 2px solid var(--slds-color-border);
}
```

## アクセシビリティ

### コントラスト比

| 組み合わせ | コントラスト比 | WCAG レベル |
|-----------|---------------|-------------|
| text-default / background | 14.1:1 | AAA |
| text-secondary / background | 7.2:1 | AAA |
| brand / background | 5.5:1 | AA |
| on-brand / brand | 8.7:1 | AAA |
| error / background | 9.8:1 | AAA |

### カラーのみに依存しない

```css
/* エラー状態の例 */
.slds-input--error {
  border-color: var(--slds-color-error);
  border-width: 2px; /* 視覚的区別を追加 */
}

.slds-input--error + .slds-form-element__help {
  color: var(--slds-color-error);
}

/* アイコンでも状態を伝える */
.slds-input--error::before {
  content: '';
  background-image: url('error-icon.svg');
}
```

## ベストプラクティス

### DO（推奨）

- CSS変数でカラーを一元管理
- セマンティックなカラー名を使用（brand, error, successなど）
- コントラスト比を確認（4.5:1以上）
- ダークテーマを考慮したカラー設計
- フォーカス状態を明確に表示

### DON'T（非推奨）

- ハードコードされた色値
- 不十分なコントラスト
- カラーのみで状態を伝える
- テーマ切り替えを考慮しない色使い
- 過度に鮮やかな色の多用
