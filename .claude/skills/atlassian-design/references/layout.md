# Atlassian レイアウト

Atlassian Design System のレイアウト・スペーシングガイドラインです。

## スペーシングシステム

8pxベースのスペーシングシステムを使用しています。

| トークン | 値 | 用途 |
|---------|-----|------|
| Space 0 | 0px | なし |
| Space 025 | 2px | 極小マージン |
| Space 050 | 4px | 小さなギャップ |
| Space 100 | 8px | 基本単位 |
| Space 150 | 12px | 小〜中ギャップ |
| Space 200 | 16px | 標準パディング |
| Space 300 | 24px | セクション間 |
| Space 400 | 32px | 大きなセクション間 |
| Space 500 | 40px | ページセクション |
| Space 600 | 48px | 大きな余白 |
| Space 800 | 64px | ヒーローセクション |
| Space 1000 | 80px | 特大余白 |

```css
:root {
  --space-0: 0px;
  --space-025: 2px;
  --space-050: 4px;
  --space-100: 8px;
  --space-150: 12px;
  --space-200: 16px;
  --space-300: 24px;
  --space-400: 32px;
  --space-500: 40px;
  --space-600: 48px;
  --space-800: 64px;
  --space-1000: 80px;
}
```

## ブレークポイント

| 名前 | 値 | 用途 |
|------|-----|------|
| xs | < 576px | モバイル（小） |
| sm | >= 576px | モバイル（大） |
| md | >= 768px | タブレット |
| lg | >= 992px | デスクトップ（小） |
| xl | >= 1200px | デスクトップ（大） |
| xxl | >= 1400px | ワイドスクリーン |

```css
/* モバイルファースト */
@media (min-width: 576px) { /* sm */ }
@media (min-width: 768px) { /* md */ }
@media (min-width: 992px) { /* lg */ }
@media (min-width: 1200px) { /* xl */ }
@media (min-width: 1400px) { /* xxl */ }
```

## ページレイアウト

### 基本構造

```html
<div class="app-layout">
  <!-- トップナビゲーション -->
  <header class="top-nav">...</header>

  <div class="app-body">
    <!-- サイドナビゲーション -->
    <aside class="side-nav">...</aside>

    <!-- メインコンテンツ -->
    <main class="main-content">
      <div class="page-header">...</div>
      <div class="page-content">...</div>
    </main>
  </div>
</div>
```

### CSS

```css
.app-layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.top-nav {
  height: 56px;
  flex-shrink: 0;
}

.app-body {
  display: flex;
  flex: 1;
  overflow: hidden;
}

.side-nav {
  width: 240px;
  flex-shrink: 0;
  overflow-y: auto;
}

.main-content {
  flex: 1;
  overflow-y: auto;
  padding: var(--space-400);
}

/* レスポンシブ */
@media (max-width: 991px) {
  .side-nav {
    position: fixed;
    left: 0;
    top: 56px;
    bottom: 0;
    z-index: 100;
    transform: translateX(-100%);
    transition: transform 200ms ease;
  }

  .side-nav.open {
    transform: translateX(0);
  }

  .main-content {
    padding: var(--space-200);
  }
}
```

## コンテナ

### 標準コンテナ

```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--space-200);
}

.container-sm { max-width: 640px; }
.container-md { max-width: 768px; }
.container-lg { max-width: 1024px; }
.container-xl { max-width: 1200px; }
.container-fluid { max-width: none; }
```

### ページヘッダー

```css
.page-header {
  margin-bottom: var(--space-400);
}

.page-title {
  font-size: 24px;
  font-weight: 500;
  color: var(--color-text);
  margin: 0 0 var(--space-100) 0;
}

.page-description {
  font-size: 14px;
  color: var(--color-text-subtle);
  margin: 0;
}
```

## グリッドシステム

### Flexbox Grid

```css
.grid {
  display: flex;
  flex-wrap: wrap;
  margin: calc(var(--space-200) * -0.5);
}

.grid-item {
  padding: calc(var(--space-200) * 0.5);
}

/* カラム幅 */
.col-1 { width: 8.333%; }
.col-2 { width: 16.666%; }
.col-3 { width: 25%; }
.col-4 { width: 33.333%; }
.col-5 { width: 41.666%; }
.col-6 { width: 50%; }
.col-7 { width: 58.333%; }
.col-8 { width: 66.666%; }
.col-9 { width: 75%; }
.col-10 { width: 83.333%; }
.col-11 { width: 91.666%; }
.col-12 { width: 100%; }

/* レスポンシブ */
@media (min-width: 768px) {
  .col-md-3 { width: 25%; }
  .col-md-4 { width: 33.333%; }
  .col-md-6 { width: 50%; }
}

@media (min-width: 992px) {
  .col-lg-3 { width: 25%; }
  .col-lg-4 { width: 33.333%; }
  .col-lg-6 { width: 50%; }
}
```

### CSS Grid

```css
.grid-auto {
  display: grid;
  gap: var(--space-200);
}

/* 固定カラム */
.grid-cols-2 { grid-template-columns: repeat(2, 1fr); }
.grid-cols-3 { grid-template-columns: repeat(3, 1fr); }
.grid-cols-4 { grid-template-columns: repeat(4, 1fr); }

/* 自動フィット */
.grid-auto-fit {
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
}

/* 自動フィル */
.grid-auto-fill {
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
}
```

## Stack（縦方向配置）

```css
.stack {
  display: flex;
  flex-direction: column;
}

.stack-xs { gap: var(--space-050); }
.stack-sm { gap: var(--space-100); }
.stack-md { gap: var(--space-200); }
.stack-lg { gap: var(--space-300); }
.stack-xl { gap: var(--space-400); }
```

## Inline（横方向配置）

```css
.inline {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
}

.inline-xs { gap: var(--space-050); }
.inline-sm { gap: var(--space-100); }
.inline-md { gap: var(--space-200); }
.inline-lg { gap: var(--space-300); }

/* 配置 */
.inline-start { justify-content: flex-start; }
.inline-center { justify-content: center; }
.inline-end { justify-content: flex-end; }
.inline-between { justify-content: space-between; }
```

## カードレイアウト

### カードグリッド

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: var(--space-200);
}

@media (max-width: 767px) {
  .card-grid {
    grid-template-columns: 1fr;
  }
}
```

### カンバンボード

```css
.board {
  display: flex;
  gap: var(--space-200);
  overflow-x: auto;
  padding-bottom: var(--space-200);
}

.board-column {
  flex: 0 0 280px;
  min-height: 200px;
  background-color: var(--color-background-neutral);
  border-radius: 3px;
  padding: var(--space-100);
}

.board-column-header {
  padding: var(--space-100);
  font-size: 12px;
  font-weight: 600;
  color: var(--color-text-subtle);
  text-transform: uppercase;
}

.board-cards {
  display: flex;
  flex-direction: column;
  gap: var(--space-100);
}
```

## テーブルレイアウト

```css
.table-container {
  overflow-x: auto;
}

.table {
  width: 100%;
  border-collapse: collapse;
}

.table th,
.table td {
  padding: var(--space-100) var(--space-150);
  text-align: left;
  border-bottom: 1px solid var(--color-border);
}

.table th {
  font-size: 12px;
  font-weight: 600;
  color: var(--color-text-subtle);
  background-color: var(--color-background-neutral-subtle);
}

.table td {
  font-size: 14px;
  color: var(--color-text);
}

.table tbody tr:hover {
  background-color: var(--color-background-neutral-subtle);
}
```

## フォームレイアウト

### 縦並びフォーム

```css
.form-vertical {
  display: flex;
  flex-direction: column;
  gap: var(--space-200);
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: var(--space-050);
}
```

### 横並びフォーム

```css
.form-horizontal {
  display: grid;
  grid-template-columns: 120px 1fr;
  gap: var(--space-200) var(--space-200);
  align-items: start;
}

.form-horizontal .form-label {
  padding-top: var(--space-100);
  text-align: right;
}

@media (max-width: 767px) {
  .form-horizontal {
    grid-template-columns: 1fr;
  }

  .form-horizontal .form-label {
    text-align: left;
    padding-top: 0;
  }
}
```

### インラインフォーム

```css
.form-inline {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-100);
  align-items: flex-end;
}

.form-inline .form-group {
  flex: 1;
  min-width: 200px;
}
```

## ナビゲーションレイアウト

### サイドナビ

```css
.side-nav {
  display: flex;
  flex-direction: column;
  width: 240px;
  padding: var(--space-150) 0;
  background-color: var(--color-background-neutral-subtle);
  border-right: 1px solid var(--color-border);
}

.side-nav-section {
  padding: var(--space-100) 0;
}

.side-nav-title {
  padding: var(--space-050) var(--space-200);
  font-size: 11px;
  font-weight: 700;
  color: var(--color-text-subtlest);
  text-transform: uppercase;
  letter-spacing: 0.04em;
}

.side-nav-items {
  display: flex;
  flex-direction: column;
  gap: var(--space-025);
}
```

### 折りたたみサイドナビ

```css
.side-nav-collapsible {
  width: 240px;
  transition: width 200ms ease;
}

.side-nav-collapsible.collapsed {
  width: 56px;
}

.side-nav-collapsible.collapsed .nav-item-text {
  opacity: 0;
  width: 0;
  overflow: hidden;
}
```

## モーダルレイアウト

```css
.modal-sizes {
  /* サイズバリエーション */
}

.modal-small { max-width: 400px; }
.modal-medium { max-width: 600px; }
.modal-large { max-width: 800px; }
.modal-xlarge { max-width: 1000px; }
.modal-fullscreen {
  max-width: calc(100vw - 48px);
  max-height: calc(100vh - 48px);
}

/* フルスクリーンモバイル */
@media (max-width: 767px) {
  .modal {
    max-width: 100%;
    max-height: 100%;
    margin: 0;
    border-radius: 0;
  }
}
```

## ユーティリティクラス

### マージン

```css
.m-0 { margin: 0; }
.m-1 { margin: var(--space-100); }
.m-2 { margin: var(--space-200); }
.m-3 { margin: var(--space-300); }
.m-4 { margin: var(--space-400); }

.mt-0 { margin-top: 0; }
.mt-1 { margin-top: var(--space-100); }
.mt-2 { margin-top: var(--space-200); }
.mt-3 { margin-top: var(--space-300); }
.mt-4 { margin-top: var(--space-400); }

.mb-0 { margin-bottom: 0; }
.mb-1 { margin-bottom: var(--space-100); }
.mb-2 { margin-bottom: var(--space-200); }
.mb-3 { margin-bottom: var(--space-300); }
.mb-4 { margin-bottom: var(--space-400); }

.ml-0 { margin-left: 0; }
.ml-1 { margin-left: var(--space-100); }
.ml-auto { margin-left: auto; }

.mr-0 { margin-right: 0; }
.mr-1 { margin-right: var(--space-100); }
.mr-auto { margin-right: auto; }
```

### パディング

```css
.p-0 { padding: 0; }
.p-1 { padding: var(--space-100); }
.p-2 { padding: var(--space-200); }
.p-3 { padding: var(--space-300); }
.p-4 { padding: var(--space-400); }

.pt-0 { padding-top: 0; }
.pt-1 { padding-top: var(--space-100); }
.pt-2 { padding-top: var(--space-200); }

.pb-0 { padding-bottom: 0; }
.pb-1 { padding-bottom: var(--space-100); }
.pb-2 { padding-bottom: var(--space-200); }

.px-0 { padding-left: 0; padding-right: 0; }
.px-1 { padding-left: var(--space-100); padding-right: var(--space-100); }
.px-2 { padding-left: var(--space-200); padding-right: var(--space-200); }

.py-0 { padding-top: 0; padding-bottom: 0; }
.py-1 { padding-top: var(--space-100); padding-bottom: var(--space-100); }
.py-2 { padding-top: var(--space-200); padding-bottom: var(--space-200); }
```

### 表示

```css
.d-none { display: none; }
.d-block { display: block; }
.d-flex { display: flex; }
.d-inline { display: inline; }
.d-inline-block { display: inline-block; }
.d-inline-flex { display: inline-flex; }
.d-grid { display: grid; }

/* レスポンシブ表示 */
@media (max-width: 767px) {
  .d-md-none { display: none; }
}
@media (min-width: 768px) {
  .d-md-block { display: block; }
  .d-md-flex { display: flex; }
}
```

### Flexユーティリティ

```css
.flex-row { flex-direction: row; }
.flex-column { flex-direction: column; }
.flex-wrap { flex-wrap: wrap; }
.flex-nowrap { flex-wrap: nowrap; }

.justify-start { justify-content: flex-start; }
.justify-center { justify-content: center; }
.justify-end { justify-content: flex-end; }
.justify-between { justify-content: space-between; }

.align-start { align-items: flex-start; }
.align-center { align-items: center; }
.align-end { align-items: flex-end; }
.align-stretch { align-items: stretch; }

.flex-1 { flex: 1; }
.flex-auto { flex: auto; }
.flex-none { flex: none; }
.flex-grow { flex-grow: 1; }
.flex-shrink-0 { flex-shrink: 0; }
```

### 幅・高さ

```css
.w-full { width: 100%; }
.w-auto { width: auto; }
.max-w-full { max-width: 100%; }

.h-full { height: 100%; }
.h-screen { height: 100vh; }
.min-h-screen { min-height: 100vh; }
```

## ベストプラクティス

### DO（推奨）

- 8pxベースのスペーシングを使用
- CSS変数でトークンを参照
- モバイルファーストで設計
- フレキシブルなグリッドを使用
- セマンティックなクラス名

### DON'T（非推奨）

- 任意のピクセル値（7px, 13pxなど）
- 固定幅レイアウト
- 深いネスト構造
- インラインスタイル
- !important の多用
