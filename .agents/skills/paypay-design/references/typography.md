# PayPay タイポグラフィ

## フォントファミリー

PayPayアプリは、日本語と欧文/数字で異なるフォントを使用し、可読性と美しさを両立。

### 日本語フォント

**Hiragino Sans**を優先使用。クリーンで読みやすく、親しみやすい印象。

```css
:root {
  --font-ja: 'Hiragino Sans', 'Hiragino Kaku Gothic ProN', 'Noto Sans JP', 'Yu Gothic', sans-serif;
}
```

### 欧文・数字フォント

**Graphik**を優先使用。特に金額表示では数字の美しさが重要。

```css
:root {
  --font-en: 'Graphik', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', sans-serif;
  --font-number: 'Graphik', 'SF Pro Display', -apple-system, 'Helvetica Neue', sans-serif;
}
```

### フォントスタック全体

```css
body {
  font-family: var(--font-ja);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* 数字専用 */
.number, .amount {
  font-family: var(--font-number);
}
```

## タイプスケール

### 見出し（Headlines）

| レベル | サイズ | 太さ | 行高 | 用途 |
|--------|--------|------|------|------|
| H1 | 28px | 700 | 1.3 | ページタイトル |
| H2 | 22px | 700 | 1.35 | セクションタイトル |
| H3 | 18px | 600 | 1.4 | カードタイトル |
| H4 | 16px | 600 | 1.4 | サブセクション |

```css
.h1 {
  font-size: 28px;
  font-weight: 700;
  line-height: 1.3;
  letter-spacing: -0.5px;
}

.h2 {
  font-size: 22px;
  font-weight: 700;
  line-height: 1.35;
  letter-spacing: -0.3px;
}

.h3 {
  font-size: 18px;
  font-weight: 600;
  line-height: 1.4;
}

.h4 {
  font-size: 16px;
  font-weight: 600;
  line-height: 1.4;
}
```

### 本文（Body）

| タイプ | サイズ | 太さ | 行高 | 用途 |
|--------|--------|------|------|------|
| Body Large | 16px | 400 | 1.6 | 重要な説明文 |
| Body | 14px | 400 | 1.6 | 本文、リスト |
| Body Small | 12px | 400 | 1.5 | 補足、注釈 |
| Caption | 10px | 400 | 1.4 | キャプション、ラベル |

```css
.body-large {
  font-size: 16px;
  font-weight: 400;
  line-height: 1.6;
}

.body {
  font-size: 14px;
  font-weight: 400;
  line-height: 1.6;
}

.body-small {
  font-size: 12px;
  font-weight: 400;
  line-height: 1.5;
  color: var(--color-text-secondary);
}

.caption {
  font-size: 10px;
  font-weight: 400;
  line-height: 1.4;
  color: var(--color-text-tertiary);
}
```

## 金額表示

金額表示はPayPayアプリの最重要要素。大きく、明確に、読みやすく。

### 大金額（残高、決済金額）

```css
.amount-large {
  font-family: var(--font-number);
  font-size: 36px;
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -1px;
  color: var(--color-text-primary);
}

.amount-large .currency {
  font-size: 22px;
  font-weight: 500;
  margin-right: 2px;
}
```

### 中金額（履歴、明細）

```css
.amount-medium {
  font-family: var(--font-number);
  font-size: 20px;
  font-weight: 600;
  line-height: 1.3;
  letter-spacing: -0.5px;
}

.amount-medium .currency {
  font-size: 14px;
  font-weight: 500;
}
```

### 小金額（ポイント、サブ情報）

```css
.amount-small {
  font-family: var(--font-number);
  font-size: 14px;
  font-weight: 500;
  line-height: 1.4;
}

.amount-small .currency {
  font-size: 12px;
  font-weight: 400;
}
```

### 金額の色分け

```css
/* 入金・受け取り */
.amount--positive {
  color: var(--color-success);
}
.amount--positive::before {
  content: '+';
}

/* 出金・支払い */
.amount--negative {
  color: var(--color-error);
}
.amount--negative::before {
  content: '-';
}
```

### 金額のフォーマット

```javascript
// 3桁カンマ区切り
function formatAmount(amount) {
  return amount.toLocaleString('ja-JP');
}

// 円マーク付き
function formatYen(amount) {
  return `¥${amount.toLocaleString('ja-JP')}`;
}
```

```html
<!-- HTMLでの金額表示 -->
<span class="amount-large">
  <span class="currency">¥</span>12,345
</span>
```

## ボタンテキスト

### プライマリボタン

```css
.btn-text-primary {
  font-family: var(--font-ja);
  font-size: 16px;
  font-weight: 600;
  letter-spacing: 0.5px;
}
```

### セカンダリボタン

```css
.btn-text-secondary {
  font-family: var(--font-ja);
  font-size: 14px;
  font-weight: 500;
}
```

### アクションラベル

```css
.action-label {
  font-family: var(--font-ja);
  font-size: 12px;
  font-weight: 500;
  text-align: center;
}
```

## ナビゲーションテキスト

### ボトムナビ

```css
.nav-label {
  font-family: var(--font-ja);
  font-size: 10px;
  font-weight: 500;
  color: var(--color-text-tertiary);
}

.nav-label--active {
  color: var(--paypay-red);
  font-weight: 600;
}
```

### ヘッダータイトル

```css
.header-title {
  font-family: var(--font-ja);
  font-size: 17px;
  font-weight: 600;
  text-align: center;
}
```

## 特殊テキスト

### バッジ・タグ

```css
.badge-text {
  font-family: var(--font-ja);
  font-size: 10px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}
```

### カウンター（通知数）

```css
.counter {
  font-family: var(--font-number);
  font-size: 11px;
  font-weight: 700;
  min-width: 18px;
  text-align: center;
}
```

### パーセンテージ

```css
.percentage {
  font-family: var(--font-number);
  font-weight: 700;
}

.percentage .unit {
  font-size: 0.7em;
  font-weight: 500;
}
```

## レスポンシブタイポグラフィ

```css
/* 小さい画面 (iPhone SE等) */
@media (max-width: 374px) {
  :root {
    --scale-factor: 0.9;
  }

  .amount-large {
    font-size: calc(36px * var(--scale-factor));
  }

  .h1 {
    font-size: calc(28px * var(--scale-factor));
  }
}

/* 大きい画面 (iPad等) */
@media (min-width: 768px) {
  :root {
    --scale-factor: 1.1;
  }

  .amount-large {
    font-size: calc(36px * var(--scale-factor));
  }
}
```

## 行の切り詰め

```css
/* 1行で切り詰め */
.truncate {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* 2行で切り詰め */
.truncate-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
```
