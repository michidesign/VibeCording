# Spindle レイアウト

Spindle のレイアウトシステムは、一貫性のある美しいレイアウトを実現するためのガイドラインです。

## スペーシングシステム

8px ベースのスペーシングシステムを採用しています。

| トークン | 値 | 用途 |
|---------|-----|------|
| `--spacing-xs` | 4px | 最小間隔、アイコンとテキストの間 |
| `--spacing-sm` | 8px | コンパクトな間隔 |
| `--spacing-md` | 16px | 標準的な間隔 |
| `--spacing-lg` | 24px | セクション内の間隔 |
| `--spacing-xl` | 32px | セクション間の間隔 |
| `--spacing-2xl` | 48px | 大きなセクション間隔 |
| `--spacing-3xl` | 64px | ページセクション間隔 |
| `--spacing-4xl` | 96px | ヒーローセクション間隔 |

```css
:root {
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;
  --spacing-3xl: 64px;
  --spacing-4xl: 96px;
}
```

## ブレークポイント

| 名前 | 値 | 用途 |
|------|-----|------|
| `sm` | 640px | スマートフォン（横向き） |
| `md` | 768px | タブレット |
| `lg` | 1024px | 小型デスクトップ |
| `xl` | 1280px | デスクトップ |
| `2xl` | 1440px | 大型デスクトップ |

```css
/* モバイルファースト */
@media (min-width: 640px) { /* sm */ }
@media (min-width: 768px) { /* md */ }
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
@media (min-width: 1440px) { /* 2xl */ }
```

## コンテナ

```css
.container {
  width: 100%;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
  padding-left: var(--spacing-md);
  padding-right: var(--spacing-md);
}

@media (min-width: 768px) {
  .container {
    padding-left: var(--spacing-lg);
    padding-right: var(--spacing-lg);
  }
}

@media (min-width: 1024px) {
  .container {
    padding-left: var(--spacing-xl);
    padding-right: var(--spacing-xl);
  }
}
```

### コンテナサイズバリエーション

```css
.container-sm {
  max-width: 640px;
}

.container-md {
  max-width: 768px;
}

.container-lg {
  max-width: 1024px;
}

.container-xl {
  max-width: 1200px;
}

.container-full {
  max-width: none;
}
```

## グリッドシステム

### 12カラムグリッド

```css
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: var(--spacing-md);
}

@media (min-width: 768px) {
  .grid {
    gap: var(--spacing-lg);
  }
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
```

### レスポンシブグリッド

```css
/* モバイルでフルカラム、タブレット以上で分割 */
@media (min-width: 768px) {
  .md\:col-6 { grid-column: span 6; }
  .md\:col-4 { grid-column: span 4; }
  .md\:col-3 { grid-column: span 3; }
}

@media (min-width: 1024px) {
  .lg\:col-4 { grid-column: span 4; }
  .lg\:col-3 { grid-column: span 3; }
}
```

### カードグリッド

```css
.card-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--spacing-md);
}

@media (min-width: 640px) {
  .card-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .card-grid {
    grid-template-columns: repeat(3, 1fr);
    gap: var(--spacing-lg);
  }
}

@media (min-width: 1280px) {
  .card-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}
```

## Flexbox ユーティリティ

```css
/* フレックスコンテナ */
.flex { display: flex; }
.inline-flex { display: inline-flex; }

/* 方向 */
.flex-row { flex-direction: row; }
.flex-col { flex-direction: column; }

/* 折り返し */
.flex-wrap { flex-wrap: wrap; }
.flex-nowrap { flex-wrap: nowrap; }

/* 主軸の配置 */
.justify-start { justify-content: flex-start; }
.justify-end { justify-content: flex-end; }
.justify-center { justify-content: center; }
.justify-between { justify-content: space-between; }
.justify-around { justify-content: space-around; }

/* 交差軸の配置 */
.items-start { align-items: flex-start; }
.items-end { align-items: flex-end; }
.items-center { align-items: center; }
.items-stretch { align-items: stretch; }

/* ギャップ */
.gap-xs { gap: var(--spacing-xs); }
.gap-sm { gap: var(--spacing-sm); }
.gap-md { gap: var(--spacing-md); }
.gap-lg { gap: var(--spacing-lg); }
.gap-xl { gap: var(--spacing-xl); }
```

## ボーダーラディウス

| トークン | 値 | 用途 |
|---------|-----|------|
| `--radius-none` | 0 | 角丸なし |
| `--radius-sm` | 4px | 小さい要素、タグ |
| `--radius-md` | 8px | ボタン、インプット |
| `--radius-lg` | 12px | カード、モーダル |
| `--radius-xl` | 16px | 大きなカード |
| `--radius-2xl` | 24px | ヒーローセクション |
| `--radius-full` | 9999px | 円形、ピル型 |

```css
:root {
  --radius-none: 0;
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-2xl: 24px;
  --radius-full: 9999px;
}
```

## シャドウ

| トークン | 値 | 用途 |
|---------|-----|------|
| `--shadow-sm` | 0 1px 2px | 薄いシャドウ |
| `--shadow-md` | 0 2px 8px | カード |
| `--shadow-lg` | 0 4px 16px | ホバー状態 |
| `--shadow-xl` | 0 8px 32px | モーダル |

```css
:root {
  --shadow-sm: 0 1px 2px rgba(8, 18, 26, 0.06);
  --shadow-md: 0 2px 8px rgba(8, 18, 26, 0.08);
  --shadow-lg: 0 4px 16px rgba(8, 18, 26, 0.12);
  --shadow-xl: 0 8px 32px rgba(8, 18, 26, 0.16);
}
```

## ページレイアウトパターン

### 基本レイアウト

```html
<div class="page">
  <header class="header">...</header>
  <main class="main">
    <div class="container">
      <!-- コンテンツ -->
    </div>
  </main>
  <footer class="footer">...</footer>
</div>
```

```css
.page {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.main {
  flex: 1;
  padding-top: var(--spacing-xl);
  padding-bottom: var(--spacing-xl);
}

@media (min-width: 768px) {
  .main {
    padding-top: var(--spacing-2xl);
    padding-bottom: var(--spacing-2xl);
  }
}
```

### サイドバーレイアウト

```html
<div class="layout-sidebar">
  <aside class="sidebar">...</aside>
  <main class="content">...</main>
</div>
```

```css
.layout-sidebar {
  display: flex;
  flex-direction: column;
}

@media (min-width: 1024px) {
  .layout-sidebar {
    flex-direction: row;
  }
}

.sidebar {
  width: 100%;
  padding: var(--spacing-md);
  background-color: var(--color-background-secondary);
}

@media (min-width: 1024px) {
  .sidebar {
    width: 280px;
    flex-shrink: 0;
    padding: var(--spacing-lg);
  }
}

.content {
  flex: 1;
  padding: var(--spacing-md);
}

@media (min-width: 1024px) {
  .content {
    padding: var(--spacing-xl);
  }
}
```

### ヒーローセクション

```html
<section class="hero">
  <div class="container">
    <h1 class="hero-title">タイトル</h1>
    <p class="hero-subtitle">サブタイトル</p>
    <div class="hero-cta">
      <a href="#" class="btn btn-primary">ボタン</a>
    </div>
  </div>
</section>
```

```css
.hero {
  padding: var(--spacing-2xl) 0;
  text-align: center;
}

@media (min-width: 768px) {
  .hero {
    padding: var(--spacing-4xl) 0;
  }
}

.hero-title {
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: var(--spacing-md);
}

@media (min-width: 768px) {
  .hero-title {
    font-size: 2.5rem;
  }
}

@media (min-width: 1024px) {
  .hero-title {
    font-size: 3rem;
  }
}

.hero-subtitle {
  font-size: 1rem;
  color: var(--color-text-secondary);
  margin-bottom: var(--spacing-lg);
  max-width: 640px;
  margin-left: auto;
  margin-right: auto;
}

@media (min-width: 768px) {
  .hero-subtitle {
    font-size: 1.125rem;
  }
}

.hero-cta {
  display: flex;
  justify-content: center;
  gap: var(--spacing-md);
  flex-wrap: wrap;
}
```

### セクション

```html
<section class="section">
  <div class="container">
    <h2 class="section-title">セクションタイトル</h2>
    <p class="section-description">説明文</p>
    <div class="section-content">
      <!-- コンテンツ -->
    </div>
  </div>
</section>
```

```css
.section {
  padding: var(--spacing-2xl) 0;
}

@media (min-width: 768px) {
  .section {
    padding: var(--spacing-3xl) 0;
  }
}

.section-title {
  font-size: 1.5rem;
  font-weight: bold;
  text-align: center;
  margin-bottom: var(--spacing-sm);
}

@media (min-width: 768px) {
  .section-title {
    font-size: 2rem;
  }
}

.section-description {
  font-size: 1rem;
  color: var(--color-text-secondary);
  text-align: center;
  max-width: 640px;
  margin: 0 auto var(--spacing-xl);
}

.section-content {
  margin-top: var(--spacing-xl);
}
```

## Z-Index スケール

| トークン | 値 | 用途 |
|---------|-----|------|
| `--z-dropdown` | 10 | ドロップダウン |
| `--z-sticky` | 20 | スティッキー要素 |
| `--z-fixed` | 30 | 固定要素 |
| `--z-modal-backdrop` | 40 | モーダル背景 |
| `--z-modal` | 50 | モーダル |
| `--z-popover` | 60 | ポップオーバー |
| `--z-tooltip` | 70 | ツールチップ |
| `--z-toast` | 80 | トースト通知 |

```css
:root {
  --z-dropdown: 10;
  --z-sticky: 20;
  --z-fixed: 30;
  --z-modal-backdrop: 40;
  --z-modal: 50;
  --z-popover: 60;
  --z-tooltip: 70;
  --z-toast: 80;
}
```

## アクセシビリティ

### スキップリンク

```html
<a href="#main" class="skip-link">メインコンテンツへスキップ</a>
```

```css
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  padding: var(--spacing-sm) var(--spacing-md);
  background-color: var(--color-primary-70);
  color: #ffffff;
  z-index: 100;
  transition: top var(--duration-fast) var(--ease-out);
}

.skip-link:focus {
  top: 0;
}
```

### フォーカストラップ

モーダルなどでフォーカスを閉じ込める際は、JavaScript でフォーカストラップを実装してください。
