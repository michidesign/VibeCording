# Apple レイアウト・グリッドシステム

Apple デザインにおけるレイアウトとグリッドの完全なリファレンス。

## ブレークポイント

### Apple 公式準拠

```css
:root {
  /* ブレークポイント */
  --breakpoint-sm: 374px;   /* 小型モバイル */
  --breakpoint-md: 734px;   /* タブレット */
  --breakpoint-lg: 1068px;  /* デスクトップ */
  --breakpoint-xl: 1440px;  /* 大型デスクトップ */
}

/* モバイルファースト */
/* デフォルト: 0px〜 */

@media (min-width: 735px) {
  /* タブレット: 735px〜 */
}

@media (min-width: 1069px) {
  /* デスクトップ: 1069px〜 */
}

@media (min-width: 1441px) {
  /* 大型デスクトップ: 1441px〜 */
}
```

### モバイルファーストの書き方

```css
.container {
  /* モバイル: デフォルト */
  padding: 0 20px;
}

@media (min-width: 735px) {
  .container {
    /* タブレット */
    padding: 0 40px;
  }
}

@media (min-width: 1069px) {
  .container {
    /* デスクトップ */
    padding: 0 80px;
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

## コンテナ

### 基本コンテナ

```css
.container {
  width: 100%;
  max-width: 980px;
  margin: 0 auto;
  padding: 0 22px;
}

.container-narrow {
  max-width: 692px;
}

.container-wide {
  max-width: 1200px;
}

.container-full {
  max-width: none;
}
```

### セクション

```css
.section {
  padding: 80px 0;
}

.section-lg {
  padding: 120px 0;
}

.section-hero {
  min-height: 100vh;
  padding-top: 120px;
}

@media (max-width: 734px) {
  .section {
    padding: 60px 0;
  }

  .section-lg {
    padding: 80px 0;
  }
}
```

## グリッドシステム

### 12カラムグリッド

```css
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 24px;
}

/* カラムスパン */
.col-1 { grid-column: span 1; }
.col-2 { grid-column: span 2; }
.col-3 { grid-column: span 3; }
.col-4 { grid-column: span 4; }
.col-5 { grid-column: span 5; }
.col-6 { grid-column: span 6; }
.col-7 { grid-column: span 7; }
.col-8 { grid-column: span 8; }
.col-9 { grid-column: span 9; }
.col-10 { grid-column: span 10; }
.col-11 { grid-column: span 11; }
.col-12 { grid-column: span 12; }

/* レスポンシブ */
@media (max-width: 1068px) {
  .col-md-6 { grid-column: span 6; }
  .col-md-12 { grid-column: span 12; }
}

@media (max-width: 734px) {
  .grid {
    gap: 16px;
  }

  .col-sm-12 { grid-column: span 12; }
}
```

### Auto-fit グリッド

```css
/* 製品カード用 */
.grid-products {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
}

/* フィーチャーカード用 */
.grid-features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
}

/* ギャラリー用 */
.grid-gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}
```

### 固定カラムグリッド

```css
/* 2カラム */
.grid-2 {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 24px;
}

/* 3カラム */
.grid-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

/* 4カラム */
.grid-4 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 24px;
}

/* レスポンシブ対応 */
@media (max-width: 1068px) {
  .grid-4 {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 734px) {
  .grid-2,
  .grid-3,
  .grid-4 {
    grid-template-columns: 1fr;
  }
}
```

## Flexbox レイアウト

### Flex ユーティリティ

```css
.flex {
  display: flex;
}

.flex-col {
  flex-direction: column;
}

.flex-wrap {
  flex-wrap: wrap;
}

/* 配置 */
.items-start { align-items: flex-start; }
.items-center { align-items: center; }
.items-end { align-items: flex-end; }
.items-stretch { align-items: stretch; }

.justify-start { justify-content: flex-start; }
.justify-center { justify-content: center; }
.justify-end { justify-content: flex-end; }
.justify-between { justify-content: space-between; }
.justify-around { justify-content: space-around; }

/* Gap */
.gap-8 { gap: 8px; }
.gap-16 { gap: 16px; }
.gap-24 { gap: 24px; }
.gap-32 { gap: 32px; }
.gap-48 { gap: 48px; }
```

### 一般的な Flex パターン

```css
/* 中央揃え */
.flex-center {
  display: flex;
  align-items: center;
  justify-content: center;
}

/* 両端揃え */
.flex-between {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* スタック（縦積み） */
.flex-stack {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
```

## ページレイアウト

### ヒーローセクション

```html
<section class="hero">
  <div class="hero-content">
    <h1 class="hero-title">製品名</h1>
    <p class="hero-subtitle">キャッチコピー</p>
    <div class="hero-cta">
      <a href="#" class="btn-primary">詳しく見る</a>
      <a href="#" class="link-arrow">購入する</a>
    </div>
  </div>
  <div class="hero-image">
    <img src="hero.jpg" alt="">
  </div>
</section>
```

```css
.hero {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: 120px 24px 80px;
  overflow: hidden;
}

.hero-content {
  max-width: 800px;
  margin-bottom: 60px;
}

.hero-title {
  font-size: clamp(48px, 10vw, 96px);
  font-weight: 700;
  line-height: 1.0;
  letter-spacing: -0.03em;
  margin: 0 0 16px;
}

.hero-subtitle {
  font-size: clamp(19px, 3vw, 28px);
  color: var(--color-label-secondary);
  margin: 0 0 32px;
}

.hero-cta {
  display: flex;
  gap: 24px;
  justify-content: center;
  flex-wrap: wrap;
}

.hero-image {
  max-width: 1000px;
  width: 100%;
}

.hero-image img {
  width: 100%;
  height: auto;
}
```

### 分割レイアウト

```html
<section class="split">
  <div class="split-content">
    <h2>機能タイトル</h2>
    <p>説明文がここに入ります。</p>
    <a href="#" class="link-arrow">詳しく見る</a>
  </div>
  <div class="split-media">
    <img src="feature.jpg" alt="">
  </div>
</section>
```

```css
.split {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
  align-items: center;
  padding: 80px 0;
}

.split-content {
  padding: 40px;
}

.split-content h2 {
  font-size: 48px;
  font-weight: 600;
  margin: 0 0 16px;
}

.split-content p {
  font-size: 21px;
  color: var(--color-label-secondary);
  margin: 0 0 24px;
}

.split-media img {
  width: 100%;
  height: auto;
  border-radius: 18px;
}

/* 逆順 */
.split-reverse .split-content {
  order: 2;
}

.split-reverse .split-media {
  order: 1;
}

@media (max-width: 1068px) {
  .split {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .split-reverse .split-content,
  .split-reverse .split-media {
    order: unset;
  }
}
```

### スティッキーレイアウト

```html
<section class="sticky-section">
  <div class="sticky-content">
    <h2>固定コンテンツ</h2>
    <p>スクロールしても固定されます。</p>
  </div>
  <div class="sticky-scroll">
    <div class="scroll-item">アイテム 1</div>
    <div class="scroll-item">アイテム 2</div>
    <div class="scroll-item">アイテム 3</div>
  </div>
</section>
```

```css
.sticky-section {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
}

.sticky-content {
  position: sticky;
  top: 120px;
  height: fit-content;
}

.sticky-scroll {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.scroll-item {
  padding: 40px;
  background: var(--color-background-secondary);
  border-radius: 18px;
}
```

## スペーシングシステム

### スペーシングスケール

```css
:root {
  --space-4: 4px;
  --space-8: 8px;
  --space-12: 12px;
  --space-16: 16px;
  --space-20: 20px;
  --space-24: 24px;
  --space-32: 32px;
  --space-40: 40px;
  --space-48: 48px;
  --space-64: 64px;
  --space-80: 80px;
  --space-120: 120px;
}
```

### マージンユーティリティ

```css
.m-0 { margin: 0; }
.m-4 { margin: 4px; }
.m-8 { margin: 8px; }
.m-16 { margin: 16px; }
.m-24 { margin: 24px; }
.m-32 { margin: 32px; }

.mt-0 { margin-top: 0; }
.mt-8 { margin-top: 8px; }
.mt-16 { margin-top: 16px; }
.mt-24 { margin-top: 24px; }
.mt-32 { margin-top: 32px; }
.mt-48 { margin-top: 48px; }

.mb-0 { margin-bottom: 0; }
.mb-8 { margin-bottom: 8px; }
.mb-16 { margin-bottom: 16px; }
.mb-24 { margin-bottom: 24px; }
.mb-32 { margin-bottom: 32px; }
.mb-48 { margin-bottom: 48px; }

.mx-auto { margin-left: auto; margin-right: auto; }
```

### パディングユーティリティ

```css
.p-0 { padding: 0; }
.p-8 { padding: 8px; }
.p-16 { padding: 16px; }
.p-24 { padding: 24px; }
.p-32 { padding: 32px; }

.px-16 { padding-left: 16px; padding-right: 16px; }
.px-24 { padding-left: 24px; padding-right: 24px; }

.py-16 { padding-top: 16px; padding-bottom: 16px; }
.py-24 { padding-top: 24px; padding-bottom: 24px; }
.py-48 { padding-top: 48px; padding-bottom: 48px; }
.py-80 { padding-top: 80px; padding-bottom: 80px; }
```

## アスペクト比

```css
.aspect-square { aspect-ratio: 1 / 1; }
.aspect-video { aspect-ratio: 16 / 9; }
.aspect-photo { aspect-ratio: 4 / 3; }
.aspect-portrait { aspect-ratio: 3 / 4; }
.aspect-wide { aspect-ratio: 21 / 9; }
```

## Z-Index スケール

```css
:root {
  --z-base: 0;
  --z-dropdown: 100;
  --z-sticky: 200;
  --z-fixed: 300;
  --z-modal-backdrop: 400;
  --z-modal: 500;
  --z-popover: 600;
  --z-tooltip: 700;
  --z-toast: 800;
  --z-max: 9999;
}
```

## ベストプラクティス

### DO（推奨）

- モバイルファーストで設計する
- Apple 公式のブレークポイントを使用する
- 十分な余白を確保する
- グリッドで一貫したレイアウトを作る
- max-width でコンテンツ幅を制限する

### DON'T（非推奨）

- 任意のブレークポイントを乱用しない
- 要素を画面端まで広げすぎない
- マージンの値をバラバラにしない
- position: absolute を多用しない
- 複雑すぎるネストを作らない
