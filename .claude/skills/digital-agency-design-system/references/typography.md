# デジタル庁デザインシステム タイポグラフィ

デジタル庁デザインシステム（DADS）に基づいたタイポグラフィシステムの完全なリファレンス。

## フォントファミリー

### 本文用フォントスタック

```css
body {
  font-family:
    'Noto Sans JP',
    -apple-system,
    BlinkMacSystemFont,
    'Hiragino Sans',
    'Hiragino Kaku Gothic ProN',
    'Yu Gothic',
    'YuGothic',
    Meiryo,
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

### 等幅フォント（コード用）

```css
code, pre, .monospace {
  font-family:
    'Noto Sans Mono',
    'SFMono-Regular',
    Consolas,
    'Liberation Mono',
    Menlo,
    monospace;
}
```

### Google Fonts のインポート

```html
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap" rel="stylesheet">
```

## フォントウェイト

```css
:root {
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-bold: 700;
}
```

| ウェイト | 値 | 用途 |
|---------|-----|------|
| Normal | 400 | 本文 |
| Medium | 500 | ナビゲーション、ラベル |
| Bold | 700 | 見出し、強調 |

## タイプスケール

### Display（ヒーロー・大見出し）

```css
.display-1 {
  font-size: 64px;
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -0.02em;
}

.display-2 {
  font-size: 48px;
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -0.01em;
}
```

### Heading（見出し）

```css
.heading-1, h1 {
  font-size: 40px;
  font-weight: 700;
  line-height: 1.4;
  letter-spacing: 0;
}

.heading-2, h2 {
  font-size: 32px;
  font-weight: 700;
  line-height: 1.4;
  letter-spacing: 0;
}

.heading-3, h3 {
  font-size: 24px;
  font-weight: 700;
  line-height: 1.4;
  letter-spacing: 0;
}

.heading-4, h4 {
  font-size: 20px;
  font-weight: 700;
  line-height: 1.4;
  letter-spacing: 0;
}

.heading-5, h5 {
  font-size: 18px;
  font-weight: 700;
  line-height: 1.4;
  letter-spacing: 0;
}

.heading-6, h6 {
  font-size: 16px;
  font-weight: 700;
  line-height: 1.4;
  letter-spacing: 0;
}
```

### Body（本文）

```css
.body-large {
  font-size: 18px;
  font-weight: 400;
  line-height: 1.75;
  letter-spacing: 0;
}

.body-default, p {
  font-size: 16px;
  font-weight: 400;
  line-height: 1.75;
  letter-spacing: 0;
}

.body-small {
  font-size: 14px;
  font-weight: 400;
  line-height: 1.5;
  letter-spacing: 0;
}

.caption {
  font-size: 12px;
  font-weight: 400;
  line-height: 1.4;
  letter-spacing: 0;
}
```

## タイプスケール一覧

| クラス | サイズ | ウェイト | 行高 | 用途 |
|--------|--------|----------|------|------|
| display-1 | 64px | 700 | 1.2 | ヒーローセクション |
| display-2 | 48px | 700 | 1.2 | サブヒーロー |
| heading-1 | 40px | 700 | 1.4 | ページタイトル |
| heading-2 | 32px | 700 | 1.4 | セクション見出し |
| heading-3 | 24px | 700 | 1.4 | サブセクション |
| heading-4 | 20px | 700 | 1.4 | 小見出し |
| heading-5 | 18px | 700 | 1.4 | ミニ見出し |
| heading-6 | 16px | 700 | 1.4 | 最小見出し |
| body-large | 18px | 400 | 1.75 | リード文 |
| body-default | 16px | 400 | 1.75 | 本文（標準） |
| body-small | 14px | 400 | 1.5 | 補足情報 |
| caption | 12px | 400 | 1.4 | キャプション、注釈 |

## レスポンシブタイポグラフィ

```css
/* モバイル（デフォルト） */
.display-1 { font-size: 36px; }
.display-2 { font-size: 28px; }
.heading-1 { font-size: 28px; }
.heading-2 { font-size: 24px; }
.heading-3 { font-size: 20px; }

/* タブレット */
@media (min-width: 768px) {
  .display-1 { font-size: 48px; }
  .display-2 { font-size: 36px; }
  .heading-1 { font-size: 32px; }
  .heading-2 { font-size: 28px; }
  .heading-3 { font-size: 24px; }
}

/* デスクトップ */
@media (min-width: 992px) {
  .display-1 { font-size: 64px; }
  .display-2 { font-size: 48px; }
  .heading-1 { font-size: 40px; }
  .heading-2 { font-size: 32px; }
  .heading-3 { font-size: 24px; }
}
```

## 行間（Line Height）

```css
:root {
  --line-height-tight: 1.2;   /* 見出し用 */
  --line-height-normal: 1.4;  /* 短い見出し */
  --line-height-relaxed: 1.75; /* 本文用 */
  --line-height-loose: 2;     /* 読みやすさ重視 */
}
```

### ガイドライン

- **見出し**: 1.2〜1.4（行が長くなりすぎない場合）
- **本文**: 1.5〜1.75（日本語は欧文より広めに）
- **長文**: 1.75〜2.0（読みやすさを優先）

## 文字間隔（Letter Spacing）

```css
:root {
  --letter-spacing-tight: -0.02em;  /* 大きい見出し */
  --letter-spacing-normal: 0;       /* 標準 */
  --letter-spacing-wide: 0.05em;    /* 英字のみの見出し */
}
```

### ガイドライン

- **日本語**: 基本的に `letter-spacing: 0`
- **大きい見出し（40px以上）**: `-0.02em` で詰める
- **英字のみ**: 必要に応じて `0.05em` で広げる

## 最大行長

読みやすさのための行の長さ制限。

```css
.prose {
  max-width: 40em; /* 約640px（16px基準） */
}

.prose-wide {
  max-width: 50em; /* 約800px */
}

.prose-narrow {
  max-width: 35em; /* 約560px */
}
```

### ガイドライン

- 日本語本文: **35〜45文字**が読みやすい
- 欧文本文: **45〜75文字**

## 見出し階層のルール

### 正しい階層

```html
<h1>ページタイトル</h1>
  <h2>セクション1</h2>
    <h3>サブセクション1-1</h3>
    <h3>サブセクション1-2</h3>
  <h2>セクション2</h2>
    <h3>サブセクション2-1</h3>
```

### 避けるべき階層

```html
<!-- ❌ h1 をスキップ -->
<h2>ページタイトル</h2>

<!-- ❌ レベルをスキップ -->
<h1>タイトル</h1>
<h4>いきなり h4</h4>

<!-- ❌ 複数の h1 -->
<h1>タイトル1</h1>
<h1>タイトル2</h1>
```

## テキストのアクセシビリティ

### 最小フォントサイズ

| 要素 | 最小サイズ | 推奨サイズ |
|------|-----------|-----------|
| 本文 | 14px | 16px |
| 補足情報 | 12px | 14px |
| 注釈・キャプション | 12px | 12px |

### テキストの拡大対応

```css
/* ユーザーがブラウザでテキストを200%まで拡大しても問題なく表示 */
html {
  font-size: 100%; /* 16px をベースに */
}

/* rem 単位を使用して拡大に対応 */
.body-default {
  font-size: 1rem; /* 16px */
}

.heading-1 {
  font-size: 2.5rem; /* 40px */
}
```

### 行間の確保

```css
/* WCAG 1.4.12: テキストの間隔 */
p {
  line-height: 1.5; /* 最低 1.5 倍 */
  letter-spacing: 0; /* 最低 0.12em まで拡張可能に */
  word-spacing: 0; /* 最低 0.16em まで拡張可能に */
}

/* 段落間のスペース */
p + p {
  margin-top: 1.5em; /* 最低 2em まで拡張可能に */
}
```

## テキストユーティリティ

```css
/* テキスト揃え */
.text-left { text-align: left; }
.text-center { text-align: center; }
.text-right { text-align: right; }

/* フォントウェイト */
.font-normal { font-weight: 400; }
.font-medium { font-weight: 500; }
.font-bold { font-weight: 700; }

/* テキスト変換 */
.uppercase { text-transform: uppercase; }
.lowercase { text-transform: lowercase; }
.capitalize { text-transform: capitalize; }

/* テキスト装飾 */
.underline { text-decoration: underline; }
.no-underline { text-decoration: none; }
.line-through { text-decoration: line-through; }

/* テキストの折り返し */
.break-words { word-wrap: break-word; }
.truncate {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

## ベストプラクティス

### DO（推奨）

- 本文は 16px 以上を使用
- 日本語の行間は 1.5〜1.75 倍
- 見出しは h1 から順番に使用
- rem 単位でテキストサイズを指定

### DON'T（非推奨）

- 12px 未満のテキスト
- 行間 1.2 未満の本文
- 見出しレベルのスキップ
- px 固定でのサイズ指定（ユーザー設定を無視）
