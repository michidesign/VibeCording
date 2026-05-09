# Atlassian タイポグラフィ

Atlassian のタイポグラフィシステムは、読みやすさとスキャンのしやすさを重視して設計されています。

## フォントファミリー

### Atlassian Sans（プライマリ）

製品内のすべてのテキストに使用されるカスタムフォント。フォールバックとしてシステムフォントを使用。

```css
--font-family-sans: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
```

### Atlassian Mono（コード）

コードブロック、技術的なコンテンツに使用。

```css
--font-family-mono: 'SFMono-Medium', 'SF Mono', 'Segoe UI Mono', 'Roboto Mono', 'Ubuntu Mono', Menlo, Consolas, Courier, monospace;
```

### Charlie Sans（マーケティング）

マーケティング素材、ブランド表現に使用。

```css
--font-family-brand: 'Charlie Sans', sans-serif;
```

## フォントウェイト

4つのフォントウェイトが利用可能です。

| ウェイト | 値 | 用途 |
|---------|-----|------|
| Regular | 400 | 本文テキスト |
| Medium | 500 | コンポーネント、アイコンと併用 |
| Semibold | 600 | 見出し、強調 |
| Bold | 700 | 特に強調が必要な場合 |

```css
--font-weight-regular: 400;
--font-weight-medium: 500;
--font-weight-semibold: 600;
--font-weight-bold: 700;
```

## タイプスケール

### 見出し

| レベル | サイズ | 行間 | ウェイト | 用途 |
|--------|--------|------|---------|------|
| H900 | 35px | 40px | Medium | ページタイトル（大） |
| H800 | 29px | 32px | Medium | ページタイトル |
| H700 | 24px | 28px | Medium | セクションタイトル |
| H600 | 20px | 24px | Medium | カードタイトル |
| H500 | 16px | 20px | Semibold | サブセクション |
| H400 | 14px | 16px | Semibold | 小見出し |
| H300 | 12px | 16px | Semibold | ラベル |
| H200 | 12px | 16px | Semibold | オーバーライン |
| H100 | 11px | 16px | Bold | キャプション |

### 本文

| レベル | サイズ | 行間 | ウェイト | 用途 |
|--------|--------|------|---------|------|
| Body Large | 16px | 24px | Regular | 長文コンテンツ |
| Body | 14px | 20px | Regular | 標準本文 |
| Body Small | 12px | 16px | Regular | 補助テキスト |
| Caption | 11px | 16px | Regular | キャプション |

## CSS変数での定義

```css
:root {
  /* 見出し */
  --font-size-h900: 35px;
  --line-height-h900: 40px;
  --font-size-h800: 29px;
  --line-height-h800: 32px;
  --font-size-h700: 24px;
  --line-height-h700: 28px;
  --font-size-h600: 20px;
  --line-height-h600: 24px;
  --font-size-h500: 16px;
  --line-height-h500: 20px;
  --font-size-h400: 14px;
  --line-height-h400: 16px;
  --font-size-h300: 12px;
  --line-height-h300: 16px;

  /* 本文 */
  --font-size-body-large: 16px;
  --line-height-body-large: 24px;
  --font-size-body: 14px;
  --line-height-body: 20px;
  --font-size-body-small: 12px;
  --line-height-body-small: 16px;
  --font-size-caption: 11px;
  --line-height-caption: 16px;
}
```

## タイポグラフィクラス

### 見出しスタイル

```css
.h900 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h900);
  line-height: var(--line-height-h900);
  font-weight: var(--font-weight-medium);
  color: var(--color-text);
  letter-spacing: -0.01em;
}

.h800 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h800);
  line-height: var(--line-height-h800);
  font-weight: var(--font-weight-medium);
  color: var(--color-text);
  letter-spacing: -0.01em;
}

.h700 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h700);
  line-height: var(--line-height-h700);
  font-weight: var(--font-weight-medium);
  color: var(--color-text);
  letter-spacing: -0.008em;
}

.h600 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h600);
  line-height: var(--line-height-h600);
  font-weight: var(--font-weight-medium);
  color: var(--color-text);
}

.h500 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h500);
  line-height: var(--line-height-h500);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text);
}

.h400 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h400);
  line-height: var(--line-height-h400);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text);
}

.h300 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h300);
  line-height: var(--line-height-h300);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text);
  text-transform: uppercase;
}

.h200 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-h300);
  line-height: var(--line-height-h300);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text-subtle);
  text-transform: uppercase;
}

.h100 {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-caption);
  line-height: var(--line-height-caption);
  font-weight: var(--font-weight-bold);
  color: var(--color-text-subtlest);
  text-transform: uppercase;
}
```

### 本文スタイル

```css
.body-large {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-body-large);
  line-height: var(--line-height-body-large);
  font-weight: var(--font-weight-regular);
  color: var(--color-text);
}

.body {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-body);
  line-height: var(--line-height-body);
  font-weight: var(--font-weight-regular);
  color: var(--color-text);
}

.body-small {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-body-small);
  line-height: var(--line-height-body-small);
  font-weight: var(--font-weight-regular);
  color: var(--color-text);
}

.caption {
  font-family: var(--font-family-sans);
  font-size: var(--font-size-caption);
  line-height: var(--line-height-caption);
  font-weight: var(--font-weight-regular);
  color: var(--color-text-subtlest);
}
```

### コードスタイル

```css
.code {
  font-family: var(--font-family-mono);
  font-size: var(--font-size-body-small);
  line-height: var(--line-height-body-small);
  background-color: var(--color-background-neutral);
  padding: 2px 4px;
  border-radius: 3px;
}

.code-block {
  font-family: var(--font-family-mono);
  font-size: var(--font-size-body-small);
  line-height: 1.5;
  background-color: var(--color-background-neutral);
  padding: 12px 16px;
  border-radius: 3px;
  overflow-x: auto;
}
```

## リンクスタイル

```css
.link {
  font-family: inherit;
  font-size: inherit;
  font-weight: inherit;
  line-height: inherit;
  color: var(--color-text-brand);
  text-decoration: none;
  cursor: pointer;
}

.link:hover {
  color: var(--color-brand-boldHovered);
  text-decoration: underline;
}

.link:active {
  color: var(--color-brand-boldPressed);
}

.link:focus-visible {
  outline: 2px solid var(--color-border-focused);
  outline-offset: 2px;
  border-radius: 2px;
}
```

## レスポンシブタイポグラフィ

### ブレークポイント

```css
/* モバイル（デフォルト） */
.page-title {
  font-size: 24px;
  line-height: 28px;
}

/* タブレット */
@media (min-width: 768px) {
  .page-title {
    font-size: 29px;
    line-height: 32px;
  }
}

/* デスクトップ */
@media (min-width: 1024px) {
  .page-title {
    font-size: 35px;
    line-height: 40px;
  }
}
```

## ベストプラクティス

### DO（推奨）

- 長文テキストには最小16pxのフォントサイズを使用
- 適切な行間（line-height）を設定
- 見出しと本文で明確なコントラストをつける
- コンポーネント内のテキストにはMediumウェイトを使用

### DON'T（非推奨）

- 11px未満のフォントサイズを使用（ファインプリント以外）
- 行間を詰めすぎる
- 過度に多くのフォントウェイトを混在させる
- 全角英数字の使用

## アクセシビリティ

### 最小フォントサイズ

- 本文テキスト: 14px以上推奨
- 長文: 16px以上推奨
- キャプション/ラベル: 11px（使用は最小限に）

### コントラスト要件

- 通常テキスト（14px未満）: 4.5:1以上
- 大きいテキスト（14px太字以上、18px以上）: 3:1以上
