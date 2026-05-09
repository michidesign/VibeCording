# Spindle タイポグラフィ

Spindle のタイポグラフィシステムは、読みやすさと Ameba らしさを両立させるために設計されています。

## フォントファミリー

### 日本語フォント

```css
:root {
  --font-family-base: 'Meiryo', 'Yu Gothic Medium', 'Yu Gothic', system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
}
```

### 英語フォント

```css
:root {
  --font-family-en: system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
}
```

### ブランドフォント（Ameba Sans）

Ameba のコーポレートタイプフェイスとして「Ameba Sans」が定義されています。これは主にロゴやブランド要素に使用されます。

## タイプスケール

### 見出し（Headline）

| スタイル | フォント | サイズ | 行間 | 用途 |
|---------|---------|-------|------|------|
| Headline 1 | bold | 2.5rem (40px) | 1.3 | ページタイトル、ヒーロー |
| Headline 2 | bold | 2rem (32px) | 1.3 | セクション見出し |
| Headline 3 | bold | 1.5rem (24px) | 1.3 | サブセクション |
| Headline 4 | bold | 1.25rem (20px) | 1.3 | カードタイトル |
| Headline 5 | bold | 1.125rem (18px) | 1.3 | 小見出し |
| Headline 6 | bold | 1rem (16px) | 1.3 | キャプション見出し |

```css
.headline-1 {
  font-weight: bold;
  font-size: 2.5rem;
  line-height: 1.3;
  letter-spacing: -0.02em;
}

.headline-2 {
  font-weight: bold;
  font-size: 2rem;
  line-height: 1.3;
  letter-spacing: -0.01em;
}

.headline-3 {
  font-weight: bold;
  font-size: 1.5rem;
  line-height: 1.3;
}

.headline-4 {
  font-weight: bold;
  font-size: 1.25rem;
  line-height: 1.3;
}

.headline-5 {
  font-weight: bold;
  font-size: 1.125rem;
  line-height: 1.3;
}

.headline-6 {
  font-weight: bold;
  font-size: 1rem;
  line-height: 1.3;
}
```

### 本文（Body）

| スタイル | フォント | サイズ | 行間 | 用途 |
|---------|---------|-------|------|------|
| Body 1 | regular | 1rem (16px) | 2 | メイン本文 |
| Body 2 | regular | 0.9375rem (15px) | 1.8 | 本文（コンパクト） |
| Body 3 | regular | 0.875rem (14px) | 1.6 | 補足テキスト |
| Body 4 | regular | 0.8125rem (13px) | 1.6 | 小さい補足 |

```css
.body-1 {
  font-weight: normal;
  font-size: 1rem;
  line-height: 2;
  letter-spacing: 0.1em;
}

.body-2 {
  font-weight: normal;
  font-size: 0.9375rem;
  line-height: 1.8;
  letter-spacing: 0.08em;
}

.body-3 {
  font-weight: normal;
  font-size: 0.875rem;
  line-height: 1.6;
  letter-spacing: 0.06em;
}

.body-4 {
  font-weight: normal;
  font-size: 0.8125rem;
  line-height: 1.6;
  letter-spacing: 0.04em;
}
```

### UI テキスト

| スタイル | フォント | サイズ | 行間 | 用途 |
|---------|---------|-------|------|------|
| Button Large | bold | 1rem (16px) | 1.3 | 大きなボタン |
| Button Medium | bold | 0.875rem (14px) | 1.3 | 標準ボタン |
| Button Small | bold | 0.75rem (12px) | 1.3 | 小さなボタン |
| Caption 1 | regular | 0.875rem (14px) | 1.4 | キャプション |
| Caption 2 | regular | 0.75rem (12px) | 1.4 | 小さなキャプション |
| Overline | bold | 0.75rem (12px) | 1.3 | ラベル、タグ |

```css
.button-large {
  font-weight: bold;
  font-size: 1rem;
  line-height: 1.3;
}

.button-medium {
  font-weight: bold;
  font-size: 0.875rem;
  line-height: 1.3;
}

.button-small {
  font-weight: bold;
  font-size: 0.75rem;
  line-height: 1.3;
}

.caption-1 {
  font-weight: normal;
  font-size: 0.875rem;
  line-height: 1.4;
}

.caption-2 {
  font-weight: normal;
  font-size: 0.75rem;
  line-height: 1.4;
}

.overline {
  font-weight: bold;
  font-size: 0.75rem;
  line-height: 1.3;
  letter-spacing: 0.3em;
  text-transform: uppercase;
}
```

## レスポンシブタイポグラフィ

### ブレークポイント対応

```css
/* モバイル（デフォルト） */
:root {
  --font-size-h1: 1.75rem;
  --font-size-h2: 1.5rem;
  --font-size-h3: 1.25rem;
  --font-size-body: 1rem;
}

/* タブレット以上 */
@media (min-width: 768px) {
  :root {
    --font-size-h1: 2rem;
    --font-size-h2: 1.75rem;
    --font-size-h3: 1.375rem;
    --font-size-body: 1rem;
  }
}

/* デスクトップ */
@media (min-width: 1024px) {
  :root {
    --font-size-h1: 2.5rem;
    --font-size-h2: 2rem;
    --font-size-h3: 1.5rem;
    --font-size-body: 1rem;
  }
}
```

### Fluid タイポグラフィ

```css
.headline-fluid {
  font-size: clamp(1.75rem, 4vw + 1rem, 2.5rem);
  line-height: 1.3;
}
```

## 行間（Line Height）

| 用途 | 行間 | 説明 |
|------|------|------|
| 見出し | 1.3 | コンパクトで力強い印象 |
| UI テキスト | 1.3-1.4 | 読みやすさとコンパクトさのバランス |
| 本文（短い） | 1.6 | 一般的な本文テキスト |
| 本文（長い） | 1.8-2 | 長文の可読性を確保 |

## 字間（Letter Spacing）

| 用途 | 字間 | 説明 |
|------|------|------|
| 見出し | -0.02em〜0 | 詰め気味でタイトに |
| 本文 | 0.04em〜0.1em | 日本語の可読性を確保 |
| 英大文字 | 0.3em | トラッキングを広めに |

## 使用例

### 記事ページ

```css
.article {
  font-family: var(--font-family-base);
  font-size: 1rem;
  line-height: 2;
  letter-spacing: 0.1em;
  color: var(--color-text-primary);
}

.article h1 {
  font-size: 2rem;
  line-height: 1.3;
  letter-spacing: -0.01em;
  margin-bottom: 1.5rem;
}

.article h2 {
  font-size: 1.5rem;
  line-height: 1.3;
  margin-top: 3rem;
  margin-bottom: 1rem;
}

.article p {
  margin-bottom: 1.5rem;
}
```

### カードコンポーネント

```css
.card-title {
  font-weight: bold;
  font-size: 1.125rem;
  line-height: 1.3;
  color: var(--color-text-primary);
}

.card-description {
  font-size: 0.875rem;
  line-height: 1.6;
  color: var(--color-text-secondary);
}

.card-meta {
  font-size: 0.75rem;
  line-height: 1.4;
  color: var(--color-text-tertiary);
}
```

## アクセシビリティ

### 最小フォントサイズ

- 本文: 16px以上を推奨（ズーム対応のため）
- 補助テキスト: 12px以上

### 相対単位の使用

```css
/* 推奨: rem を使用 */
.text {
  font-size: 1rem;
}

/* 非推奨: px 固定値 */
.text {
  font-size: 16px;
}
```

### フォーカス時の視認性

```css
a:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}
```
