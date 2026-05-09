# デジタル庁デザインシステム レイアウト

デジタル庁デザインシステム（DADS）に基づいたレイアウトシステムの完全なリファレンス。

## スペーシングシステム

### 8px ベースのスケール

```css
:root {
  --space-0: 0;
  --space-1: 4px;    /* 0.5単位 */
  --space-2: 8px;    /* 1単位（基準） */
  --space-3: 12px;   /* 1.5単位 */
  --space-4: 16px;   /* 2単位 */
  --space-5: 24px;   /* 3単位 */
  --space-6: 32px;   /* 4単位 */
  --space-7: 40px;   /* 5単位 */
  --space-8: 48px;   /* 6単位 */
  --space-9: 64px;   /* 8単位 */
  --space-10: 80px;  /* 10単位 */
  --space-11: 96px;  /* 12単位 */
  --space-12: 128px; /* 16単位 */
}
```

| 変数 | 値 | 用途 |
|------|-----|------|
| space-1 | 4px | アイコンとテキストの間隔 |
| space-2 | 8px | 関連要素間の狭い間隔 |
| space-3 | 12px | フォーム要素間 |
| space-4 | 16px | 要素内のパディング |
| space-5 | 24px | コンポーネント間 |
| space-6 | 32px | セクション内の区切り |
| space-8 | 48px | セクション間 |
| space-10 | 80px | ページセクション間 |

## グリッドシステム

### 12カラムグリッド

```css
:root {
  --grid-columns: 12;
  --grid-gutter: 24px;
  --grid-margin: 16px;
}

.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--grid-margin);
}

.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: var(--grid-gutter);
}
```

### カラムクラス

```css
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

/* オフセット */
.col-offset-1 { grid-column-start: 2; }
.col-offset-2 { grid-column-start: 3; }
.col-offset-3 { grid-column-start: 4; }
```

### レスポンシブグリッド

```css
/* モバイル（デフォルト） */
.col-sm-6 { grid-column: span 6; }
.col-sm-12 { grid-column: span 12; }

/* タブレット */
@media (min-width: 768px) {
  .col-md-3 { grid-column: span 3; }
  .col-md-4 { grid-column: span 4; }
  .col-md-6 { grid-column: span 6; }
  .col-md-8 { grid-column: span 8; }
}

/* デスクトップ */
@media (min-width: 992px) {
  .col-lg-3 { grid-column: span 3; }
  .col-lg-4 { grid-column: span 4; }
  .col-lg-6 { grid-column: span 6; }
  .col-lg-8 { grid-column: span 8; }
}
```

## ブレークポイント

```css
:root {
  --breakpoint-sm: 576px;   /* モバイル */
  --breakpoint-md: 768px;   /* タブレット */
  --breakpoint-lg: 992px;   /* デスクトップ */
  --breakpoint-xl: 1200px;  /* 大型デスクトップ */
}
```

### メディアクエリ

```css
/* モバイル（デフォルト） */
/* 〜575px */

/* タブレット縦 */
@media (min-width: 576px) {
  .container {
    padding: 0 24px;
  }
}

/* タブレット横・小型デスクトップ */
@media (min-width: 768px) {
  :root {
    --grid-gutter: 32px;
  }
}

/* デスクトップ */
@media (min-width: 992px) {
  .container {
    padding: 0 48px;
  }
}

/* 大型デスクトップ */
@media (min-width: 1200px) {
  .container {
    max-width: 1200px;
    padding: 0 24px;
  }
}
```

## ページレイアウト

### 基本構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>...</head>
<body>
  <a href="#main-content" class="skip-link">本文へスキップ</a>

  <header class="header" role="banner">
    <div class="container">
      <div class="header-inner">...</div>
    </div>
  </header>

  <nav class="breadcrumb" aria-label="パンくずリスト">
    <div class="container">...</div>
  </nav>

  <main id="main-content" class="main" role="main">
    <div class="container">
      <div class="content-wrapper">
        <article class="content">...</article>
        <aside class="sidebar" role="complementary">...</aside>
      </div>
    </div>
  </main>

  <footer class="footer" role="contentinfo">
    <div class="container">...</div>
  </footer>
</body>
</html>
```

### 1カラムレイアウト

```html
<main class="main">
  <div class="container container-narrow">
    <article class="content">
      <!-- コンテンツ -->
    </article>
  </div>
</main>
```

```css
.container-narrow {
  max-width: 800px;
}
```

### 2カラムレイアウト（サイドバー付き）

```html
<main class="main">
  <div class="container">
    <div class="layout-sidebar">
      <article class="layout-main">
        <!-- メインコンテンツ -->
      </article>
      <aside class="layout-aside">
        <!-- サイドバー -->
      </aside>
    </div>
  </div>
</main>
```

```css
.layout-sidebar {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-6);
}

@media (min-width: 992px) {
  .layout-sidebar {
    grid-template-columns: 1fr 280px;
    gap: var(--space-8);
  }
}

/* サイドバー左 */
.layout-sidebar-left {
  grid-template-columns: 280px 1fr;
}

.layout-sidebar-left .layout-aside {
  order: -1;
}
```

### 3カラムレイアウト

```css
.layout-3col {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

@media (min-width: 768px) {
  .layout-3col {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 992px) {
  .layout-3col {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

## セクション

```css
.section {
  padding: var(--space-10) 0;
}

.section-sm {
  padding: var(--space-6) 0;
}

.section-lg {
  padding: var(--space-12) 0;
}

/* 背景色付きセクション */
.section-gray {
  background: var(--dads-bg-secondary);
}
```

## Flexbox ユーティリティ

```css
.flex { display: flex; }
.flex-col { flex-direction: column; }
.flex-wrap { flex-wrap: wrap; }

.items-start { align-items: flex-start; }
.items-center { align-items: center; }
.items-end { align-items: flex-end; }
.items-stretch { align-items: stretch; }

.justify-start { justify-content: flex-start; }
.justify-center { justify-content: center; }
.justify-end { justify-content: flex-end; }
.justify-between { justify-content: space-between; }

.gap-2 { gap: var(--space-2); }
.gap-3 { gap: var(--space-3); }
.gap-4 { gap: var(--space-4); }
.gap-5 { gap: var(--space-5); }
.gap-6 { gap: var(--space-6); }
```

## スペーシングユーティリティ

### マージン

```css
.m-0 { margin: 0; }
.m-2 { margin: var(--space-2); }
.m-4 { margin: var(--space-4); }
.m-6 { margin: var(--space-6); }

.mt-0 { margin-top: 0; }
.mt-2 { margin-top: var(--space-2); }
.mt-4 { margin-top: var(--space-4); }
.mt-6 { margin-top: var(--space-6); }
.mt-8 { margin-top: var(--space-8); }

.mb-0 { margin-bottom: 0; }
.mb-2 { margin-bottom: var(--space-2); }
.mb-4 { margin-bottom: var(--space-4); }
.mb-6 { margin-bottom: var(--space-6); }
.mb-8 { margin-bottom: var(--space-8); }

.mx-auto { margin-left: auto; margin-right: auto; }
```

### パディング

```css
.p-0 { padding: 0; }
.p-2 { padding: var(--space-2); }
.p-4 { padding: var(--space-4); }
.p-5 { padding: var(--space-5); }
.p-6 { padding: var(--space-6); }

.px-4 { padding-left: var(--space-4); padding-right: var(--space-4); }
.py-4 { padding-top: var(--space-4); padding-bottom: var(--space-4); }
.py-6 { padding-top: var(--space-6); padding-bottom: var(--space-6); }
.py-8 { padding-top: var(--space-8); padding-bottom: var(--space-8); }
```

## フォームレイアウト

### 縦並び（デフォルト）

```html
<form class="form">
  <div class="form-group">
    <label for="name">お名前</label>
    <input type="text" id="name">
  </div>
  <div class="form-group">
    <label for="email">メールアドレス</label>
    <input type="email" id="email">
  </div>
</form>
```

### 横並び

```html
<form class="form form-inline">
  <div class="form-group">
    <label for="keyword">キーワード</label>
    <input type="text" id="keyword">
  </div>
  <button type="submit" class="btn btn-primary">検索</button>
</form>
```

```css
.form-inline {
  display: flex;
  align-items: flex-end;
  gap: var(--space-4);
  flex-wrap: wrap;
}

.form-inline .form-group {
  margin-bottom: 0;
  flex: 1;
  min-width: 200px;
}
```

### 2カラムフォーム

```html
<form class="form">
  <div class="form-row">
    <div class="form-group">
      <label for="last-name">姓</label>
      <input type="text" id="last-name">
    </div>
    <div class="form-group">
      <label for="first-name">名</label>
      <input type="text" id="first-name">
    </div>
  </div>
</form>
```

```css
.form-row {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
}

@media (min-width: 576px) {
  .form-row {
    grid-template-columns: repeat(2, 1fr);
  }
}
```

## カードグリッド

```html
<div class="card-grid">
  <article class="card">...</article>
  <article class="card">...</article>
  <article class="card">...</article>
</div>
```

```css
.card-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-5);
}

@media (min-width: 576px) {
  .card-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 992px) {
  .card-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

/* 4カラム */
.card-grid-4 {
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
}
```

## 表示・非表示

```css
/* 特定のブレークポイントで非表示 */
@media (max-width: 767px) {
  .hide-mobile { display: none !important; }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hide-tablet { display: none !important; }
}

@media (min-width: 992px) {
  .hide-desktop { display: none !important; }
}

/* 特定のブレークポイント以上で表示 */
.show-md {
  display: none !important;
}

@media (min-width: 768px) {
  .show-md {
    display: block !important;
  }
}
```

## ベストプラクティス

### DO（推奨）

- 8px グリッドに従う
- モバイルファーストで設計
- 一貫したスペーシングを使用
- 論理的なコンテンツ順序を維持
- ランドマークを適切に使用

### DON'T（非推奨）

- 任意のスペーシング値
- デスクトップファーストの設計
- 固定幅のレイアウト
- 過度なネスト
- コンテンツの並べ替えで論理順序を崩す
