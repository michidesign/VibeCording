# PayPay レイアウト

## 基本原則

- モバイルファースト設計
- 片手操作を考慮したUI配置
- Safe Area対応（ノッチ、ホームインジケーター）
- タッチターゲットは最低44x44px

## スペーシングシステム

4pxベースのスペーシングシステム。

| 名前 | サイズ | 用途 |
|------|--------|------|
| xs | 4px | 密接な要素間 |
| sm | 8px | 関連要素間 |
| md | 16px | 標準的な余白 |
| lg | 24px | セクション間 |
| xl | 32px | 大きなセクション間 |
| 2xl | 48px | ページセクション間 |

```css
:root {
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;
}
```

## コンテナ

```css
.container {
  width: 100%;
  max-width: 500px;
  margin: 0 auto;
  padding: 0 var(--spacing-md);
}

/* Safe Area考慮 */
.container-safe {
  padding-top: env(safe-area-inset-top);
  padding-bottom: env(safe-area-inset-bottom);
  padding-left: max(var(--spacing-md), env(safe-area-inset-left));
  padding-right: max(var(--spacing-md), env(safe-area-inset-right));
}
```

## ページレイアウト

### 基本構造

```css
.page {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--color-background-secondary);
}

.page-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 56px;
  padding-top: env(safe-area-inset-top);
  background: var(--color-background);
  z-index: 100;
}

.page-content {
  flex: 1;
  margin-top: calc(56px + env(safe-area-inset-top));
  margin-bottom: calc(56px + env(safe-area-inset-bottom));
  padding: var(--spacing-md);
}

.page-footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding-bottom: env(safe-area-inset-bottom);
  background: var(--color-background);
  z-index: 100;
}
```

### ホーム画面レイアウト

```html
<div class="page page-home">
  <!-- ヘッダー（残高表示） -->
  <header class="home-header">
    <div class="balance-section">
      <span class="balance-label">PayPay残高</span>
      <div class="balance-amount">¥12,345</div>
    </div>
  </header>

  <!-- メインコンテンツ -->
  <main class="home-content">
    <!-- アクションボタン群 -->
    <section class="action-section">
      <div class="action-grid">
        <!-- 支払う、チャージ、送る、受け取る -->
      </div>
    </section>

    <!-- バナーエリア -->
    <section class="banner-section">
      <!-- キャンペーンバナー等 -->
    </section>

    <!-- サービスグリッド -->
    <section class="service-section">
      <!-- 各種サービスへのショートカット -->
    </section>
  </main>

  <!-- ボトムナビ -->
  <nav class="bottom-nav">
    <!-- ナビゲーション -->
  </nav>
</div>
```

```css
.home-header {
  background: var(--color-background);
  padding: var(--spacing-lg) var(--spacing-md);
  padding-top: calc(var(--spacing-lg) + env(safe-area-inset-top));
}

.home-content {
  flex: 1;
  padding-bottom: calc(72px + env(safe-area-inset-bottom));
}

.action-section {
  background: var(--color-background);
  padding: var(--spacing-md);
}

.banner-section {
  padding: var(--spacing-md);
}

.service-section {
  background: var(--color-background);
  margin-top: var(--spacing-sm);
  padding: var(--spacing-md);
}
```

## グリッドシステム

### アクションボタングリッド

```css
.action-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--spacing-sm);
  padding: var(--spacing-sm) 0;
}

/* 3列版 */
.action-grid--3col {
  grid-template-columns: repeat(3, 1fr);
}
```

### サービスグリッド

```css
.service-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--spacing-md);
}

.service-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--spacing-xs);
}

.service-icon {
  width: 48px;
  height: 48px;
  border-radius: var(--radius-md);
  background: var(--color-gray-100);
  display: flex;
  align-items: center;
  justify-content: center;
}

.service-label {
  font-size: 11px;
  color: var(--color-text-secondary);
  text-align: center;
}
```

### カードグリッド

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--spacing-md);
}

/* 単一カラム（リスト表示） */
.card-grid--list {
  grid-template-columns: 1fr;
}
```

## リストレイアウト

### 履歴リスト

```css
.history-list {
  background: var(--color-background);
  border-radius: var(--radius-lg);
  overflow: hidden;
}

.history-item {
  display: flex;
  align-items: center;
  gap: var(--spacing-md);
  padding: var(--spacing-md);
  border-bottom: 1px solid var(--color-gray-200);
}

.history-item:last-child {
  border-bottom: none;
}
```

### 設定リスト

```css
.settings-list {
  background: var(--color-background);
  border-radius: var(--radius-lg);
  overflow: hidden;
}

.settings-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--spacing-md);
  border-bottom: 1px solid var(--color-gray-200);
}

.settings-item:last-child {
  border-bottom: none;
}

.settings-item .item-label {
  font-size: 16px;
  color: var(--color-text-primary);
}

.settings-item .item-value {
  font-size: 14px;
  color: var(--color-text-secondary);
}

.settings-item .item-arrow {
  color: var(--color-gray-400);
  font-size: 18px;
}
```

## セクション構成

```css
.section {
  margin-bottom: var(--spacing-lg);
}

.section-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--spacing-sm) var(--spacing-md);
}

.section-title {
  font-size: 14px;
  font-weight: 600;
  color: var(--color-text-secondary);
}

.section-action {
  font-size: 14px;
  color: var(--color-info);
}

.section-content {
  background: var(--color-background);
  border-radius: var(--radius-lg);
  overflow: hidden;
}
```

## スクロール領域

### 横スクロール

```css
.horizontal-scroll {
  display: flex;
  gap: var(--spacing-md);
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  -webkit-overflow-scrolling: touch;
  padding: var(--spacing-md);
  margin: 0 calc(var(--spacing-md) * -1);
}

.horizontal-scroll::-webkit-scrollbar {
  display: none;
}

.horizontal-scroll > * {
  scroll-snap-align: start;
  flex-shrink: 0;
}
```

### バナーカルーセル

```css
.carousel {
  position: relative;
  overflow: hidden;
}

.carousel-track {
  display: flex;
  transition: transform var(--duration-normal) var(--ease-out);
}

.carousel-item {
  flex: 0 0 100%;
  padding: 0 var(--spacing-md);
}

.carousel-dots {
  display: flex;
  justify-content: center;
  gap: var(--spacing-xs);
  padding: var(--spacing-md) 0;
}

.carousel-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--color-gray-300);
}

.carousel-dot--active {
  background: var(--paypay-red);
  width: 18px;
  border-radius: 3px;
}
```

## フレックスユーティリティ

```css
.flex {
  display: flex;
}

.flex-col {
  flex-direction: column;
}

.flex-center {
  align-items: center;
  justify-content: center;
}

.flex-between {
  justify-content: space-between;
}

.flex-1 {
  flex: 1;
}

.gap-xs { gap: var(--spacing-xs); }
.gap-sm { gap: var(--spacing-sm); }
.gap-md { gap: var(--spacing-md); }
.gap-lg { gap: var(--spacing-lg); }
```

## マージン・パディングユーティリティ

```css
/* マージン */
.m-0 { margin: 0; }
.m-xs { margin: var(--spacing-xs); }
.m-sm { margin: var(--spacing-sm); }
.m-md { margin: var(--spacing-md); }
.m-lg { margin: var(--spacing-lg); }

.mt-md { margin-top: var(--spacing-md); }
.mb-md { margin-bottom: var(--spacing-md); }
.ml-md { margin-left: var(--spacing-md); }
.mr-md { margin-right: var(--spacing-md); }

/* パディング */
.p-0 { padding: 0; }
.p-xs { padding: var(--spacing-xs); }
.p-sm { padding: var(--spacing-sm); }
.p-md { padding: var(--spacing-md); }
.p-lg { padding: var(--spacing-lg); }

.pt-md { padding-top: var(--spacing-md); }
.pb-md { padding-bottom: var(--spacing-md); }
.pl-md { padding-left: var(--spacing-md); }
.pr-md { padding-right: var(--spacing-md); }
```

## レスポンシブ対応

```css
/* 小さいスマートフォン (iPhone SE等) */
@media (max-width: 374px) {
  .action-grid {
    grid-template-columns: repeat(3, 1fr);
  }

  .service-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

/* 大きいスマートフォン */
@media (min-width: 414px) {
  .container {
    padding: 0 var(--spacing-lg);
  }
}

/* タブレット */
@media (min-width: 768px) {
  .container {
    max-width: 600px;
  }

  .card-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

## Z-Index管理

```css
:root {
  --z-base: 0;
  --z-header: 100;
  --z-sticky: 200;
  --z-dropdown: 300;
  --z-modal-backdrop: 400;
  --z-modal: 500;
  --z-toast: 600;
}
```
