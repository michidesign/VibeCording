# Material Design レイアウトシステム

Material Design 3 に基づいたレイアウトシステムの完全なリファレンス。

## レスポンシブレイアウト

### ブレークポイント

```css
:root {
  /* Window Size Classes */
  --md-breakpoint-compact: 0px;      /* 0-599px: スマートフォン */
  --md-breakpoint-medium: 600px;     /* 600-839px: 小型タブレット、折りたたみ */
  --md-breakpoint-expanded: 840px;   /* 840-1199px: タブレット */
  --md-breakpoint-large: 1200px;     /* 1200-1599px: デスクトップ */
  --md-breakpoint-extra-large: 1600px; /* 1600px+: 大型デスクトップ */
}

/* Compact (スマートフォン) */
@media (max-width: 599px) {
  /* 1カラム、フルワイドレイアウト */
}

/* Medium (小型タブレット) */
@media (min-width: 600px) and (max-width: 839px) {
  /* 2カラムまたは拡張された1カラム */
}

/* Expanded (タブレット) */
@media (min-width: 840px) and (max-width: 1199px) {
  /* 2-3カラム */
}

/* Large (デスクトップ) */
@media (min-width: 1200px) and (max-width: 1599px) {
  /* 3+カラム */
}

/* Extra Large (大型デスクトップ) */
@media (min-width: 1600px) {
  /* 固定幅コンテナ */
}
```

### コンテナ幅

```css
.container {
  width: 100%;
  margin: 0 auto;
  padding: 0 16px;
}

@media (min-width: 600px) {
  .container {
    padding: 0 24px;
  }
}

@media (min-width: 840px) {
  .container {
    padding: 0 24px;
    max-width: 840px;
  }
}

@media (min-width: 1200px) {
  .container {
    max-width: 1040px;
  }
}

@media (min-width: 1600px) {
  .container {
    max-width: 1280px;
  }
}
```

## グリッドシステム

### 12カラムグリッド

```css
.md-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  padding: 0 16px;
}

@media (min-width: 600px) {
  .md-grid {
    grid-template-columns: repeat(8, 1fr);
    gap: 24px;
    padding: 0 24px;
  }
}

@media (min-width: 840px) {
  .md-grid {
    grid-template-columns: repeat(12, 1fr);
  }
}
```

### カラムスパン

```css
/* Compact (4カラム) */
.col-1 { grid-column: span 1; }
.col-2 { grid-column: span 2; }
.col-3 { grid-column: span 3; }
.col-4 { grid-column: span 4; }

/* Medium (8カラム) */
@media (min-width: 600px) {
  .col-md-1 { grid-column: span 1; }
  .col-md-2 { grid-column: span 2; }
  .col-md-3 { grid-column: span 3; }
  .col-md-4 { grid-column: span 4; }
  .col-md-6 { grid-column: span 6; }
  .col-md-8 { grid-column: span 8; }
}

/* Expanded+ (12カラム) */
@media (min-width: 840px) {
  .col-lg-1 { grid-column: span 1; }
  .col-lg-2 { grid-column: span 2; }
  .col-lg-3 { grid-column: span 3; }
  .col-lg-4 { grid-column: span 4; }
  .col-lg-6 { grid-column: span 6; }
  .col-lg-8 { grid-column: span 8; }
  .col-lg-12 { grid-column: span 12; }
}
```

## 8dp グリッド

Material Design の基本単位は 8dp（density-independent pixels）。

```css
:root {
  /* スペーシングスケール（8の倍数） */
  --md-spacing-0: 0px;
  --md-spacing-1: 4px;   /* 例外的に4dp */
  --md-spacing-2: 8px;
  --md-spacing-3: 12px;  /* 例外的に12dp */
  --md-spacing-4: 16px;
  --md-spacing-5: 20px;
  --md-spacing-6: 24px;
  --md-spacing-8: 32px;
  --md-spacing-10: 40px;
  --md-spacing-12: 48px;
  --md-spacing-16: 64px;
  --md-spacing-20: 80px;
  --md-spacing-24: 96px;
}
```

### スペーシングユーティリティ

```css
/* Margin */
.m-0 { margin: 0; }
.m-2 { margin: var(--md-spacing-2); }
.m-4 { margin: var(--md-spacing-4); }
.m-6 { margin: var(--md-spacing-6); }

.mt-4 { margin-top: var(--md-spacing-4); }
.mb-4 { margin-bottom: var(--md-spacing-4); }
.ml-4 { margin-left: var(--md-spacing-4); }
.mr-4 { margin-right: var(--md-spacing-4); }

.mx-4 { margin-left: var(--md-spacing-4); margin-right: var(--md-spacing-4); }
.my-4 { margin-top: var(--md-spacing-4); margin-bottom: var(--md-spacing-4); }

/* Padding */
.p-0 { padding: 0; }
.p-2 { padding: var(--md-spacing-2); }
.p-4 { padding: var(--md-spacing-4); }
.p-6 { padding: var(--md-spacing-6); }

.px-4 { padding-left: var(--md-spacing-4); padding-right: var(--md-spacing-4); }
.py-4 { padding-top: var(--md-spacing-4); padding-bottom: var(--md-spacing-4); }

/* Gap */
.gap-2 { gap: var(--md-spacing-2); }
.gap-4 { gap: var(--md-spacing-4); }
.gap-6 { gap: var(--md-spacing-6); }
.gap-8 { gap: var(--md-spacing-8); }
```

## Flexbox ユーティリティ

```css
.flex { display: flex; }
.flex-col { flex-direction: column; }
.flex-row { flex-direction: row; }
.flex-wrap { flex-wrap: wrap; }

.items-start { align-items: flex-start; }
.items-center { align-items: center; }
.items-end { align-items: flex-end; }
.items-stretch { align-items: stretch; }

.justify-start { justify-content: flex-start; }
.justify-center { justify-content: center; }
.justify-end { justify-content: flex-end; }
.justify-between { justify-content: space-between; }
.justify-around { justify-content: space-around; }

.flex-1 { flex: 1; }
.flex-auto { flex: auto; }
.flex-none { flex: none; }
```

## ナビゲーションレール & ドロワー

### Navigation Rail（タブレット以上）

```html
<nav class="md-navigation-rail">
  <div class="md-rail-header">
    <button class="md-fab md-fab-small">
      <svg><!-- icon --></svg>
    </button>
  </div>
  <div class="md-rail-items">
    <a href="#" class="md-rail-item active">
      <div class="md-rail-icon">
        <svg><!-- icon --></svg>
      </div>
      <span class="md-rail-label">Home</span>
    </a>
    <!-- more items -->
  </div>
</nav>
```

```css
.md-navigation-rail {
  width: 80px;
  height: 100vh;
  position: fixed;
  left: 0;
  top: 0;

  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 12px 0;

  background-color: var(--md-sys-color-surface);
}

.md-rail-header {
  padding: 0 0 24px;
}

.md-rail-items {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.md-rail-item {
  width: 56px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  padding: 12px 0 16px;

  text-decoration: none;
  color: var(--md-sys-color-on-surface-variant);
  border-radius: 16px;
}

.md-rail-item.active {
  color: var(--md-sys-color-on-surface);
}

.md-rail-icon {
  width: 56px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 16px;
}

.md-rail-item.active .md-rail-icon {
  background-color: var(--md-sys-color-secondary-container);
}

.md-rail-label {
  font-family: var(--md-sys-typescale-label-medium-font);
  font-size: var(--md-sys-typescale-label-medium-size);
  font-weight: var(--md-sys-typescale-label-medium-weight);
}
```

### Navigation Drawer（デスクトップ）

```css
.md-navigation-drawer {
  width: 360px;
  height: 100vh;
  position: fixed;
  left: 0;
  top: 0;

  display: flex;
  flex-direction: column;
  padding: 12px;

  background-color: var(--md-sys-color-surface-container-low);
  border-radius: 0 16px 16px 0;
}

.md-drawer-header {
  padding: 16px;
}

.md-drawer-headline {
  font-family: var(--md-sys-typescale-title-small-font);
  font-size: var(--md-sys-typescale-title-small-size);
  font-weight: var(--md-sys-typescale-title-small-weight);
  color: var(--md-sys-color-on-surface-variant);
}

.md-drawer-item {
  display: flex;
  align-items: center;
  gap: 12px;
  height: 56px;
  padding: 0 24px 0 16px;

  text-decoration: none;
  color: var(--md-sys-color-on-surface-variant);
  border-radius: 28px;
}

.md-drawer-item:hover {
  background-color: color-mix(in srgb, var(--md-sys-color-on-surface) 8%, transparent);
}

.md-drawer-item.active {
  background-color: var(--md-sys-color-secondary-container);
  color: var(--md-sys-color-on-secondary-container);
}
```

## アダプティブレイアウト

### ナビゲーションの切り替え

```css
/* Compact: Bottom Navigation */
@media (max-width: 599px) {
  .md-navigation-rail,
  .md-navigation-drawer {
    display: none;
  }

  .md-navigation-bar {
    display: flex;
  }

  .main-content {
    padding-bottom: 80px;
  }
}

/* Medium: Navigation Rail */
@media (min-width: 600px) and (max-width: 1199px) {
  .md-navigation-bar,
  .md-navigation-drawer {
    display: none;
  }

  .md-navigation-rail {
    display: flex;
  }

  .main-content {
    margin-left: 80px;
  }
}

/* Large+: Navigation Drawer */
@media (min-width: 1200px) {
  .md-navigation-bar,
  .md-navigation-rail {
    display: none;
  }

  .md-navigation-drawer {
    display: flex;
  }

  .main-content {
    margin-left: 360px;
  }
}
```

## Canonical Layouts

### List-Detail（リスト・詳細）

```css
.list-detail-layout {
  display: grid;
  grid-template-columns: 1fr;
  height: 100vh;
}

@media (min-width: 840px) {
  .list-detail-layout {
    grid-template-columns: 360px 1fr;
  }

  .list-pane {
    border-right: 1px solid var(--md-sys-color-outline-variant);
  }
}

@media (min-width: 1200px) {
  .list-detail-layout {
    grid-template-columns: 400px 1fr;
  }
}
```

### Supporting Pane（サポートペイン）

```css
.supporting-pane-layout {
  display: grid;
  grid-template-columns: 1fr;
}

@media (min-width: 840px) {
  .supporting-pane-layout {
    grid-template-columns: 1fr 320px;
    gap: 24px;
  }
}

@media (min-width: 1200px) {
  .supporting-pane-layout {
    grid-template-columns: 1fr 400px;
  }
}
```

### Feed（フィード）

```css
.feed-layout {
  display: grid;
  grid-template-columns: 1fr;
  gap: 16px;
  padding: 16px;
}

@media (min-width: 600px) {
  .feed-layout {
    grid-template-columns: repeat(2, 1fr);
    gap: 24px;
    padding: 24px;
  }
}

@media (min-width: 840px) {
  .feed-layout {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (min-width: 1200px) {
  .feed-layout {
    grid-template-columns: repeat(4, 1fr);
    max-width: 1280px;
    margin: 0 auto;
  }
}
```

## エレベーション（高さ）

```css
:root {
  /* Elevation Levels */
  --md-elevation-0: none;
  --md-elevation-1: 0 1px 2px rgba(0, 0, 0, 0.3),
                    0 1px 3px 1px rgba(0, 0, 0, 0.15);
  --md-elevation-2: 0 1px 2px rgba(0, 0, 0, 0.3),
                    0 2px 6px 2px rgba(0, 0, 0, 0.15);
  --md-elevation-3: 0 4px 8px 3px rgba(0, 0, 0, 0.15),
                    0 1px 3px rgba(0, 0, 0, 0.3);
  --md-elevation-4: 0 6px 10px 4px rgba(0, 0, 0, 0.15),
                    0 2px 3px rgba(0, 0, 0, 0.3);
  --md-elevation-5: 0 8px 12px 6px rgba(0, 0, 0, 0.15),
                    0 4px 4px rgba(0, 0, 0, 0.3);
}

/* Elevation Classes */
.elevation-0 { box-shadow: var(--md-elevation-0); }
.elevation-1 { box-shadow: var(--md-elevation-1); }
.elevation-2 { box-shadow: var(--md-elevation-2); }
.elevation-3 { box-shadow: var(--md-elevation-3); }
.elevation-4 { box-shadow: var(--md-elevation-4); }
.elevation-5 { box-shadow: var(--md-elevation-5); }
```

## Shape（角丸）

```css
:root {
  /* Shape Scale */
  --md-shape-none: 0px;
  --md-shape-extra-small: 4px;
  --md-shape-small: 8px;
  --md-shape-medium: 12px;
  --md-shape-large: 16px;
  --md-shape-extra-large: 28px;
  --md-shape-full: 9999px;
}

/* コンポーネント別の推奨値 */
.button { border-radius: var(--md-shape-full); }
.card { border-radius: var(--md-shape-medium); }
.dialog { border-radius: var(--md-shape-extra-large); }
.chip { border-radius: var(--md-shape-small); }
.text-field { border-radius: var(--md-shape-extra-small); }
.fab { border-radius: var(--md-shape-large); }
```

## ベストプラクティス

### DO（推奨）

- 8dp グリッドに従う
- ブレークポイントでレイアウトを適応させる
- ナビゲーションパターンを画面サイズに合わせる
- Surface Container でエレベーションを表現

### DON'T（非推奨）

- 任意のスペーシング値
- 固定幅のレイアウト
- すべての画面サイズで同じナビゲーション
- 過度なネスト
