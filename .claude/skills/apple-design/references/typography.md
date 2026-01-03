# Apple タイポグラフィシステム

Apple デザインにおけるタイポグラフィの完全なリファレンス。

## フォントファミリー

### システムフォントスタック

```css
:root {
  /* 見出し用 */
  --font-display: -apple-system, BlinkMacSystemFont,
    'SF Pro Display', 'Helvetica Neue',
    'Hiragino Sans', 'Hiragino Kaku Gothic ProN',
    'Noto Sans JP', sans-serif;

  /* 本文用 */
  --font-text: -apple-system, BlinkMacSystemFont,
    'SF Pro Text', 'Helvetica Neue',
    'Hiragino Sans', 'Hiragino Kaku Gothic ProN',
    'Noto Sans JP', sans-serif;

  /* 等幅フォント */
  --font-mono: 'SF Mono', 'Menlo', 'Monaco',
    'Courier New', monospace;
}
```

### フォントスムージング

```css
body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}
```

## タイプスケール

### 見出し（Display）

| レベル | サイズ | ウェイト | 行高 | Letter Spacing |
|--------|--------|----------|------|----------------|
| Hero | 96px | 700 | 1.0 | -0.03em |
| Display 1 | 80px | 700 | 1.05 | -0.025em |
| Display 2 | 64px | 700 | 1.05 | -0.02em |
| Display 3 | 48px | 600 | 1.1 | -0.015em |

```css
.hero-title {
  font-family: var(--font-display);
  font-size: clamp(48px, 10vw, 96px);
  font-weight: 700;
  line-height: 1.0;
  letter-spacing: -0.03em;
}

.display-1 {
  font-family: var(--font-display);
  font-size: clamp(40px, 8vw, 80px);
  font-weight: 700;
  line-height: 1.05;
  letter-spacing: -0.025em;
}

.display-2 {
  font-family: var(--font-display);
  font-size: clamp(32px, 6vw, 64px);
  font-weight: 700;
  line-height: 1.05;
  letter-spacing: -0.02em;
}

.display-3 {
  font-family: var(--font-display);
  font-size: clamp(28px, 4vw, 48px);
  font-weight: 600;
  line-height: 1.1;
  letter-spacing: -0.015em;
}
```

### 見出し（Headline）

| レベル | サイズ | ウェイト | 行高 | Letter Spacing |
|--------|--------|----------|------|----------------|
| H1 | 40px | 600 | 1.1 | -0.01em |
| H2 | 32px | 600 | 1.15 | -0.01em |
| H3 | 24px | 600 | 1.2 | -0.005em |
| H4 | 21px | 600 | 1.25 | 0 |
| H5 | 19px | 600 | 1.3 | 0 |
| H6 | 17px | 600 | 1.35 | 0 |

```css
h1, .h1 {
  font-family: var(--font-display);
  font-size: 40px;
  font-weight: 600;
  line-height: 1.1;
  letter-spacing: -0.01em;
}

h2, .h2 {
  font-family: var(--font-display);
  font-size: 32px;
  font-weight: 600;
  line-height: 1.15;
  letter-spacing: -0.01em;
}

h3, .h3 {
  font-family: var(--font-display);
  font-size: 24px;
  font-weight: 600;
  line-height: 1.2;
  letter-spacing: -0.005em;
}

h4, .h4 {
  font-family: var(--font-text);
  font-size: 21px;
  font-weight: 600;
  line-height: 1.25;
}

h5, .h5 {
  font-family: var(--font-text);
  font-size: 19px;
  font-weight: 600;
  line-height: 1.3;
}

h6, .h6 {
  font-family: var(--font-text);
  font-size: 17px;
  font-weight: 600;
  line-height: 1.35;
}
```

### 本文（Body）

| レベル | サイズ | ウェイト | 行高 |
|--------|--------|----------|------|
| Body Large | 21px | 400 | 1.5 |
| Body | 17px | 400 | 1.5 |
| Body Small | 14px | 400 | 1.45 |
| Caption | 12px | 400 | 1.4 |

```css
.body-large {
  font-family: var(--font-text);
  font-size: 21px;
  font-weight: 400;
  line-height: 1.5;
}

.body, p {
  font-family: var(--font-text);
  font-size: 17px;
  font-weight: 400;
  line-height: 1.5;
}

.body-small {
  font-family: var(--font-text);
  font-size: 14px;
  font-weight: 400;
  line-height: 1.45;
}

.caption {
  font-family: var(--font-text);
  font-size: 12px;
  font-weight: 400;
  line-height: 1.4;
}
```

### ラベル・UI

| レベル | サイズ | ウェイト | 用途 |
|--------|--------|----------|------|
| Label Large | 17px | 500 | ボタン |
| Label | 14px | 500 | タブ、ナビ |
| Label Small | 12px | 500 | バッジ |
| Eyebrow | 12px | 600 | カテゴリ |

```css
.label-large {
  font-family: var(--font-text);
  font-size: 17px;
  font-weight: 500;
  letter-spacing: 0;
}

.label {
  font-family: var(--font-text);
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0;
}

.label-small {
  font-family: var(--font-text);
  font-size: 12px;
  font-weight: 500;
  letter-spacing: 0;
}

.eyebrow {
  font-family: var(--font-text);
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}
```

## レスポンシブタイポグラフィ

### ブレークポイント別スケーリング

```css
/* デスクトップ（1068px以上） */
:root {
  --scale-hero: 96px;
  --scale-display-1: 80px;
  --scale-display-2: 64px;
  --scale-display-3: 48px;
  --scale-body: 17px;
}

/* タブレット（734px〜1068px） */
@media (max-width: 1068px) {
  :root {
    --scale-hero: 72px;
    --scale-display-1: 56px;
    --scale-display-2: 48px;
    --scale-display-3: 36px;
    --scale-body: 17px;
  }
}

/* モバイル（734px以下） */
@media (max-width: 734px) {
  :root {
    --scale-hero: 48px;
    --scale-display-1: 40px;
    --scale-display-2: 32px;
    --scale-display-3: 28px;
    --scale-body: 17px;
  }
}
```

### Clamp を使った流体タイポグラフィ

```css
.fluid-hero {
  font-size: clamp(48px, 8vw + 1rem, 96px);
}

.fluid-display {
  font-size: clamp(32px, 5vw + 1rem, 64px);
}

.fluid-headline {
  font-size: clamp(24px, 3vw + 0.5rem, 40px);
}
```

## 最大幅とリーダビリティ

### 読みやすい行の長さ

```css
/* 本文テキストの最適な幅 */
.prose {
  max-width: 70ch; /* 約600px */
}

/* 見出しの最適な幅 */
.headline-container {
  max-width: 900px;
}

/* ヒーローセクションのテキスト */
.hero-text {
  max-width: 800px;
  margin: 0 auto;
}
```

## タイポグラフィのベストプラクティス

### DO（推奨）

- 見出しにはネガティブな letter-spacing を使用
- 本文は 17px 以上を維持
- 行の長さは 45〜75 文字に収める
- 行間は本文で 1.5、見出しで 1.0〜1.2
- clamp() で流体タイポグラフィを実装

### DON'T（非推奨）

- 過度に細いフォントウェイト（100-200）を使用しない
- テキストを justify（両端揃え）にしない
- 長すぎる行（80文字以上）を作らない
- 見出しを斜体にしない
- 異なるフォントファミリーを混在させすぎない

## 日本語対応

### 日本語フォントスタック

```css
:root {
  --font-japanese: 'Hiragino Sans', 'Hiragino Kaku Gothic ProN',
    'Noto Sans JP', 'Yu Gothic', 'Meiryo', sans-serif;
}

/* 日本語コンテンツ用 */
:lang(ja) {
  font-feature-settings: "palt" 1;
  line-height: 1.8;
}
```

### 日本語の行間調整

```css
/* 日本語は行間を広めに */
:lang(ja) p {
  line-height: 1.8;
}

:lang(ja) h1,
:lang(ja) h2,
:lang(ja) h3 {
  line-height: 1.3;
}
```
