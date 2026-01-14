# Salesforce Lightning Design System レイアウト

Lightning Design System 2 (SLDS 2) に基づいたレイアウトシステムの完全なリファレンス。

## スペーシングシステム

### 基本スペーシング

SLDS は 4px を基準単位として使用します。

```css
:root {
  /* Spacing Scale */
  --slds-spacing-none: 0;
  --slds-spacing-xxx-small: 0.125rem;  /* 2px */
  --slds-spacing-xx-small: 0.25rem;    /* 4px */
  --slds-spacing-x-small: 0.5rem;      /* 8px */
  --slds-spacing-small: 0.75rem;       /* 12px */
  --slds-spacing-medium: 1rem;         /* 16px */
  --slds-spacing-large: 1.5rem;        /* 24px */
  --slds-spacing-x-large: 2rem;        /* 32px */
  --slds-spacing-xx-large: 3rem;       /* 48px */
  --slds-spacing-xxx-large: 4rem;      /* 64px */
}
```

### スペーシング一覧

| トークン | 値 | ピクセル | 用途 |
|----------|-----|---------|------|
| xxx-small | 0.125rem | 2px | 極小の余白 |
| xx-small | 0.25rem | 4px | アイコンと文字の間 |
| x-small | 0.5rem | 8px | 要素間の最小間隔 |
| small | 0.75rem | 12px | リスト項目間 |
| medium | 1rem | 16px | カード内パディング |
| large | 1.5rem | 24px | セクション間 |
| x-large | 2rem | 32px | 大きなセクション間 |
| xx-large | 3rem | 48px | ページセクション間 |
| xxx-large | 4rem | 64px | ヒーローセクション |

## グリッドシステム

### 12カラムグリッド

```css
.slds-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: var(--slds-spacing-medium);
}

/* カラムスパン */
.slds-col-1 { grid-column: span 1; }
.slds-col-2 { grid-column: span 2; }
.slds-col-3 { grid-column: span 3; }
.slds-col-4 { grid-column: span 4; }
.slds-col-5 { grid-column: span 5; }
.slds-col-6 { grid-column: span 6; }
.slds-col-7 { grid-column: span 7; }
.slds-col-8 { grid-column: span 8; }
.slds-col-9 { grid-column: span 9; }
.slds-col-10 { grid-column: span 10; }
.slds-col-11 { grid-column: span 11; }
.slds-col-12 { grid-column: span 12; }
```

### 使用例

```html
<div class="slds-grid">
  <div class="slds-col-8">
    <!-- メインコンテンツ -->
  </div>
  <div class="slds-col-4">
    <!-- サイドバー -->
  </div>
</div>
```

### Flexbox レイアウト

```css
.slds-flex {
  display: flex;
}

/* 方向 */
.slds-flex--row { flex-direction: row; }
.slds-flex--column { flex-direction: column; }

/* 配置 */
.slds-flex--justify-start { justify-content: flex-start; }
.slds-flex--justify-center { justify-content: center; }
.slds-flex--justify-end { justify-content: flex-end; }
.slds-flex--justify-between { justify-content: space-between; }
.slds-flex--justify-around { justify-content: space-around; }

.slds-flex--align-start { align-items: flex-start; }
.slds-flex--align-center { align-items: center; }
.slds-flex--align-end { align-items: flex-end; }
.slds-flex--align-stretch { align-items: stretch; }

/* Gap */
.slds-flex--gap-xx-small { gap: var(--slds-spacing-xx-small); }
.slds-flex--gap-x-small { gap: var(--slds-spacing-x-small); }
.slds-flex--gap-small { gap: var(--slds-spacing-small); }
.slds-flex--gap-medium { gap: var(--slds-spacing-medium); }
.slds-flex--gap-large { gap: var(--slds-spacing-large); }

/* Flex アイテム */
.slds-flex-grow { flex-grow: 1; }
.slds-flex-shrink-0 { flex-shrink: 0; }
.slds-flex-auto { flex: 1 1 auto; }
```

## レスポンシブブレークポイント

```css
:root {
  /* Breakpoints */
  --slds-breakpoint-small: 480px;
  --slds-breakpoint-medium: 768px;
  --slds-breakpoint-large: 1024px;
  --slds-breakpoint-x-large: 1280px;
  --slds-breakpoint-xx-large: 1440px;
}

/* Small (Mobile) */
@media (min-width: 480px) {
  .slds-show-small { display: block; }
  .slds-hide-small { display: none; }
}

/* Medium (Tablet) */
@media (min-width: 768px) {
  .slds-col-medium-1 { grid-column: span 1; }
  .slds-col-medium-2 { grid-column: span 2; }
  .slds-col-medium-3 { grid-column: span 3; }
  .slds-col-medium-4 { grid-column: span 4; }
  .slds-col-medium-6 { grid-column: span 6; }
  .slds-col-medium-8 { grid-column: span 8; }
  .slds-col-medium-12 { grid-column: span 12; }
}

/* Large (Desktop) */
@media (min-width: 1024px) {
  .slds-col-large-1 { grid-column: span 1; }
  .slds-col-large-2 { grid-column: span 2; }
  .slds-col-large-3 { grid-column: span 3; }
  .slds-col-large-4 { grid-column: span 4; }
  .slds-col-large-6 { grid-column: span 6; }
  .slds-col-large-8 { grid-column: span 8; }
  .slds-col-large-12 { grid-column: span 12; }
}

/* X-Large */
@media (min-width: 1280px) {
  .slds-col-xlarge-1 { grid-column: span 1; }
  .slds-col-xlarge-2 { grid-column: span 2; }
  .slds-col-xlarge-3 { grid-column: span 3; }
  .slds-col-xlarge-4 { grid-column: span 4; }
  .slds-col-xlarge-6 { grid-column: span 6; }
  .slds-col-xlarge-8 { grid-column: span 8; }
  .slds-col-xlarge-12 { grid-column: span 12; }
}
```

## ページレイアウト

### App Frame（アプリケーションフレーム）

```html
<div class="slds-app-frame">
  <header class="slds-global-header">
    <!-- Global Header -->
  </header>

  <div class="slds-app-body">
    <aside class="slds-sidebar">
      <!-- Side Navigation -->
    </aside>

    <main class="slds-main-content">
      <div class="slds-page">
        <!-- Page Content -->
      </div>
    </main>
  </div>
</div>
```

```css
.slds-app-frame {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.slds-app-body {
  display: flex;
  flex: 1;
}

.slds-sidebar {
  width: 240px;
  flex-shrink: 0;
  background-color: var(--slds-color-background-alt);
  border-right: 1px solid var(--slds-color-border-light);
  overflow-y: auto;
}

.slds-main-content {
  flex: 1;
  overflow-y: auto;
  background-color: var(--slds-color-background);
}

/* レスポンシブ：サイドバーを非表示 */
@media (max-width: 1023px) {
  .slds-sidebar {
    position: fixed;
    left: 0;
    top: 3.5rem; /* ヘッダー高さ */
    bottom: 0;
    z-index: 8000;
    transform: translateX(-100%);
    transition: transform 0.3s ease;
  }

  .slds-sidebar.is-open {
    transform: translateX(0);
  }
}
```

### Page Header

```html
<div class="slds-page-header">
  <div class="slds-page-header__row">
    <div class="slds-page-header__col-title">
      <div class="slds-page-header__icon">
        <svg><!-- icon --></svg>
      </div>
      <div class="slds-page-header__name">
        <h1 class="slds-page-header__title">Page Title</h1>
        <p class="slds-page-header__meta">12 items • Updated 2 hours ago</p>
      </div>
    </div>
    <div class="slds-page-header__col-actions">
      <div class="slds-button-group">
        <button class="slds-button slds-button--neutral">Edit</button>
        <button class="slds-button slds-button--brand">New</button>
      </div>
    </div>
  </div>
</div>
```

```css
.slds-page-header {
  padding: var(--slds-spacing-medium) var(--slds-spacing-large);
  background-color: #FFFFFF;
  border-bottom: 1px solid var(--slds-color-border-light);
}

.slds-page-header__row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: var(--slds-spacing-medium);
}

.slds-page-header__col-title {
  display: flex;
  align-items: center;
  gap: var(--slds-spacing-medium);
}

.slds-page-header__icon {
  width: 2.5rem;
  height: 2.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--slds-color-brand-light);
  border-radius: 0.5rem;
  color: var(--slds-color-brand);
}

.slds-page-header__icon svg {
  width: 1.5rem;
  height: 1.5rem;
}

.slds-page-header__title {
  font-family: var(--slds-font-family);
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--slds-color-text-default);
  margin: 0;
}

.slds-page-header__meta {
  font-size: 0.8125rem;
  color: var(--slds-color-text-secondary);
  margin: 0.25rem 0 0;
}

.slds-page-header__col-actions {
  display: flex;
  gap: var(--slds-spacing-x-small);
}

/* レスポンシブ */
@media (max-width: 767px) {
  .slds-page-header__row {
    flex-direction: column;
    align-items: flex-start;
  }

  .slds-page-header__col-actions {
    width: 100%;
  }

  .slds-page-header__col-actions .slds-button {
    flex: 1;
  }
}
```

### Split View（分割ビュー）

```html
<div class="slds-split-view">
  <aside class="slds-split-view__list">
    <!-- リスト -->
    <ul class="slds-list">
      <li class="slds-list__item is-selected">Item 1</li>
      <li class="slds-list__item">Item 2</li>
      <li class="slds-list__item">Item 3</li>
    </ul>
  </aside>
  <main class="slds-split-view__detail">
    <!-- 詳細 -->
  </main>
</div>
```

```css
.slds-split-view {
  display: flex;
  height: 100%;
}

.slds-split-view__list {
  width: 320px;
  flex-shrink: 0;
  border-right: 1px solid var(--slds-color-border-light);
  overflow-y: auto;
}

.slds-split-view__detail {
  flex: 1;
  overflow-y: auto;
  padding: var(--slds-spacing-medium);
}

/* レスポンシブ */
@media (max-width: 767px) {
  .slds-split-view {
    flex-direction: column;
  }

  .slds-split-view__list {
    width: 100%;
    border-right: none;
    border-bottom: 1px solid var(--slds-color-border-light);
  }

  .slds-split-view__detail {
    display: none;
  }

  .slds-split-view.has-detail-open .slds-split-view__list {
    display: none;
  }

  .slds-split-view.has-detail-open .slds-split-view__detail {
    display: block;
  }
}
```

## コンテナ

### Max Width Container

```css
.slds-container {
  width: 100%;
  max-width: var(--slds-container-width, 1280px);
  margin-left: auto;
  margin-right: auto;
  padding-left: var(--slds-spacing-medium);
  padding-right: var(--slds-spacing-medium);
}

.slds-container--small {
  --slds-container-width: 640px;
}

.slds-container--medium {
  --slds-container-width: 960px;
}

.slds-container--large {
  --slds-container-width: 1280px;
}

.slds-container--x-large {
  --slds-container-width: 1440px;
}

.slds-container--fluid {
  max-width: none;
}
```

## マージンとパディングユーティリティ

```css
/* マージン */
.slds-m-around-none { margin: 0; }
.slds-m-around-xx-small { margin: var(--slds-spacing-xx-small); }
.slds-m-around-x-small { margin: var(--slds-spacing-x-small); }
.slds-m-around-small { margin: var(--slds-spacing-small); }
.slds-m-around-medium { margin: var(--slds-spacing-medium); }
.slds-m-around-large { margin: var(--slds-spacing-large); }
.slds-m-around-x-large { margin: var(--slds-spacing-x-large); }

/* 上マージン */
.slds-m-top-none { margin-top: 0; }
.slds-m-top-xx-small { margin-top: var(--slds-spacing-xx-small); }
.slds-m-top-x-small { margin-top: var(--slds-spacing-x-small); }
.slds-m-top-small { margin-top: var(--slds-spacing-small); }
.slds-m-top-medium { margin-top: var(--slds-spacing-medium); }
.slds-m-top-large { margin-top: var(--slds-spacing-large); }
.slds-m-top-x-large { margin-top: var(--slds-spacing-x-large); }

/* 下マージン */
.slds-m-bottom-none { margin-bottom: 0; }
.slds-m-bottom-xx-small { margin-bottom: var(--slds-spacing-xx-small); }
.slds-m-bottom-x-small { margin-bottom: var(--slds-spacing-x-small); }
.slds-m-bottom-small { margin-bottom: var(--slds-spacing-small); }
.slds-m-bottom-medium { margin-bottom: var(--slds-spacing-medium); }
.slds-m-bottom-large { margin-bottom: var(--slds-spacing-large); }
.slds-m-bottom-x-large { margin-bottom: var(--slds-spacing-x-large); }

/* 左右マージン */
.slds-m-horizontal-none { margin-left: 0; margin-right: 0; }
.slds-m-horizontal-x-small { margin-left: var(--slds-spacing-x-small); margin-right: var(--slds-spacing-x-small); }
.slds-m-horizontal-small { margin-left: var(--slds-spacing-small); margin-right: var(--slds-spacing-small); }
.slds-m-horizontal-medium { margin-left: var(--slds-spacing-medium); margin-right: var(--slds-spacing-medium); }

/* 上下マージン */
.slds-m-vertical-none { margin-top: 0; margin-bottom: 0; }
.slds-m-vertical-x-small { margin-top: var(--slds-spacing-x-small); margin-bottom: var(--slds-spacing-x-small); }
.slds-m-vertical-small { margin-top: var(--slds-spacing-small); margin-bottom: var(--slds-spacing-small); }
.slds-m-vertical-medium { margin-top: var(--slds-spacing-medium); margin-bottom: var(--slds-spacing-medium); }

/* パディング */
.slds-p-around-none { padding: 0; }
.slds-p-around-xx-small { padding: var(--slds-spacing-xx-small); }
.slds-p-around-x-small { padding: var(--slds-spacing-x-small); }
.slds-p-around-small { padding: var(--slds-spacing-small); }
.slds-p-around-medium { padding: var(--slds-spacing-medium); }
.slds-p-around-large { padding: var(--slds-spacing-large); }
.slds-p-around-x-large { padding: var(--slds-spacing-x-large); }

/* 上パディング */
.slds-p-top-none { padding-top: 0; }
.slds-p-top-x-small { padding-top: var(--slds-spacing-x-small); }
.slds-p-top-small { padding-top: var(--slds-spacing-small); }
.slds-p-top-medium { padding-top: var(--slds-spacing-medium); }
.slds-p-top-large { padding-top: var(--slds-spacing-large); }

/* 下パディング */
.slds-p-bottom-none { padding-bottom: 0; }
.slds-p-bottom-x-small { padding-bottom: var(--slds-spacing-x-small); }
.slds-p-bottom-small { padding-bottom: var(--slds-spacing-small); }
.slds-p-bottom-medium { padding-bottom: var(--slds-spacing-medium); }
.slds-p-bottom-large { padding-bottom: var(--slds-spacing-large); }

/* 左右パディング */
.slds-p-horizontal-none { padding-left: 0; padding-right: 0; }
.slds-p-horizontal-x-small { padding-left: var(--slds-spacing-x-small); padding-right: var(--slds-spacing-x-small); }
.slds-p-horizontal-small { padding-left: var(--slds-spacing-small); padding-right: var(--slds-spacing-small); }
.slds-p-horizontal-medium { padding-left: var(--slds-spacing-medium); padding-right: var(--slds-spacing-medium); }
.slds-p-horizontal-large { padding-left: var(--slds-spacing-large); padding-right: var(--slds-spacing-large); }

/* 上下パディング */
.slds-p-vertical-none { padding-top: 0; padding-bottom: 0; }
.slds-p-vertical-x-small { padding-top: var(--slds-spacing-x-small); padding-bottom: var(--slds-spacing-x-small); }
.slds-p-vertical-small { padding-top: var(--slds-spacing-small); padding-bottom: var(--slds-spacing-small); }
.slds-p-vertical-medium { padding-top: var(--slds-spacing-medium); padding-bottom: var(--slds-spacing-medium); }
.slds-p-vertical-large { padding-top: var(--slds-spacing-large); padding-bottom: var(--slds-spacing-large); }
```

## 可視性ユーティリティ

```css
/* 表示/非表示 */
.slds-show { display: block; }
.slds-hide { display: none; }

/* レスポンシブ表示 */
.slds-show-small { display: none; }
.slds-show-medium { display: none; }
.slds-show-large { display: none; }

@media (min-width: 480px) {
  .slds-show-small { display: block; }
  .slds-hide-small { display: none; }
}

@media (min-width: 768px) {
  .slds-show-medium { display: block; }
  .slds-hide-medium { display: none; }
}

@media (min-width: 1024px) {
  .slds-show-large { display: block; }
  .slds-hide-large { display: none; }
}

/* スクリーンリーダー用 */
.slds-assistive-text {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}
```

## ボーダーユーティリティ

```css
/* ボーダー */
.slds-border-top { border-top: 1px solid var(--slds-color-border-light); }
.slds-border-bottom { border-bottom: 1px solid var(--slds-color-border-light); }
.slds-border-left { border-left: 1px solid var(--slds-color-border-light); }
.slds-border-right { border-right: 1px solid var(--slds-color-border-light); }
.slds-border-around { border: 1px solid var(--slds-color-border-light); }

/* ボーダー半径 */
.slds-rounded-none { border-radius: 0; }
.slds-rounded-small { border-radius: var(--slds-border-radius-small); }
.slds-rounded-medium { border-radius: var(--slds-border-radius-medium); }
.slds-rounded-large { border-radius: var(--slds-border-radius-large); }
.slds-rounded-full { border-radius: 9999px; }
```

## シャドウユーティリティ

```css
:root {
  --slds-shadow-card: 0 2px 4px rgba(0, 0, 0, 0.1);
  --slds-shadow-dropdown: 0 4px 12px rgba(0, 0, 0, 0.15);
  --slds-shadow-modal: 0 8px 24px rgba(0, 0, 0, 0.2);
}

.slds-shadow-none { box-shadow: none; }
.slds-shadow-card { box-shadow: var(--slds-shadow-card); }
.slds-shadow-dropdown { box-shadow: var(--slds-shadow-dropdown); }
.slds-shadow-modal { box-shadow: var(--slds-shadow-modal); }
```

## ベストプラクティス

### DO（推奨）

- 4px/8pxの基準グリッドに従う
- CSS変数でスペーシングを管理
- レスポンシブブレークポイントを使用
- コンテナでmax-widthを制限
- セマンティックなクラス名を使用

### DON'T（非推奨）

- ハードコードされたピクセル値
- 基準グリッド外のスペーシング
- 固定幅レイアウト
- ネガティブマージンの多用
- 深いネスト構造
