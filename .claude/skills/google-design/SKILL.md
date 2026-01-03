---
name: google-design
description: Google風のMaterial Designを活用したモダンでクリーンなUIを作成する。エレベーション、Ripple効果、鮮やかなカラーパレット、Robotoフォントを活用。Webサイト、アプリUI、ダッシュボードをGoogle風にデザインする際に使用。
---

# Google Design スキル

Google の Material Design に基づいた、明快でモダンな UI を作成するためのガイドです。

## このスキルを使用するタイミング

- Google風のWebサイトやダッシュボードを作成するとき
- Material Designのコンポーネントを実装するとき
- 鮮やかで親しみやすいUIデザインが必要なとき
- カードベースのレイアウトを設計するとき
- FAB（フローティングアクションボタン）やRipple効果を実装するとき

## Google デザインの核心原則

### 1. マテリアルメタファー（Material Metaphor）

- 物理的な紙とインクにインスパイア
- エレベーション（高さ）で奥行きを表現
- 光と影が一貫した世界観を作る

### 2. 大胆でグラフィック、意図的（Bold, Graphic, Intentional）

- 鮮やかな色使い
- 大きなタイポグラフィ
- 意図的な余白
- アイコンは明確で認識しやすく

### 3. モーションは意味を提供（Motion Provides Meaning）

- アニメーションはユーザーをガイド
- フィードバックは即座に
- トランジションは連続性を保つ

## カラーパレット

```css
:root {
  /* Google プライマリカラー */
  --google-blue: #4285f4;
  --google-red: #ea4335;
  --google-yellow: #fbbc04;
  --google-green: #34a853;

  /* グレースケール */
  --google-gray-50: #fafafa;
  --google-gray-100: #f5f5f5;
  --google-gray-200: #eeeeee;
  --google-gray-300: #e0e0e0;
  --google-gray-400: #bdbdbd;
  --google-gray-500: #9e9e9e;
  --google-gray-600: #757575;
  --google-gray-700: #616161;
  --google-gray-800: #424242;
  --google-gray-900: #212121;

  /* テキスト */
  --google-text-primary: rgba(0, 0, 0, 0.87);
  --google-text-secondary: rgba(0, 0, 0, 0.54);
  --google-text-disabled: rgba(0, 0, 0, 0.38);
  --google-text-hint: rgba(0, 0, 0, 0.38);

  /* 背景 */
  --google-bg-primary: #ffffff;
  --google-bg-secondary: #f1f3f4;
  --google-bg-dark: #202124;

  /* アクセント */
  --google-accent: #1a73e8;
  --google-accent-hover: #1967d2;
  --google-accent-light: #e8f0fe;
}
```

### 4. エレベーション（Elevation）

```css
/* Material Design エレベーションシステム */
:root {
  /* レベル0 - フラット */
  --elevation-0: none;

  /* レベル1 - カード、ボタン休止状態 */
  --elevation-1: 0 1px 2px 0 rgba(60, 64, 67, 0.3),
                 0 1px 3px 1px rgba(60, 64, 67, 0.15);

  /* レベル2 - 検索バー、ホバー状態 */
  --elevation-2: 0 1px 2px 0 rgba(60, 64, 67, 0.3),
                 0 2px 6px 2px rgba(60, 64, 67, 0.15);

  /* レベル3 - FAB休止状態 */
  --elevation-3: 0 1px 3px 0 rgba(60, 64, 67, 0.3),
                 0 4px 8px 3px rgba(60, 64, 67, 0.15);

  /* レベル4 - ナビドロワー、ダイアログ */
  --elevation-4: 0 2px 3px 0 rgba(60, 64, 67, 0.3),
                 0 6px 10px 4px rgba(60, 64, 67, 0.15);

  /* レベル5 - モーダル、FABホバー */
  --elevation-5: 0 4px 4px 0 rgba(60, 64, 67, 0.3),
                 0 8px 12px 6px rgba(60, 64, 67, 0.15);
}

.card {
  box-shadow: var(--elevation-1);
  transition: box-shadow 0.2s ease;
}

.card:hover {
  box-shadow: var(--elevation-2);
}
```

### 5. 角丸（Border Radius）

```css
:root {
  --radius-xs: 4px;   /* チップ、小さなボタン */
  --radius-sm: 8px;   /* カード、インプット */
  --radius-md: 12px;  /* ダイアログ */
  --radius-lg: 16px;  /* 大きなカード */
  --radius-xl: 24px;  /* ボトムシート */
  --radius-full: 9999px; /* FAB、丸ボタン */
}
```

### 6. タイポグラフィ

```css
/* Googleフォントスタック */
body {
  font-family:
    'Google Sans',
    'Roboto',
    -apple-system,
    BlinkMacSystemFont,
    'Segoe UI',
    'Noto Sans JP',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* タイポグラフィスケール */
.headline-1 {
  font-size: 96px;
  font-weight: 300;
  letter-spacing: -1.5px;
  line-height: 1.2;
}

.headline-2 {
  font-size: 60px;
  font-weight: 300;
  letter-spacing: -0.5px;
  line-height: 1.2;
}

.headline-3 {
  font-size: 48px;
  font-weight: 400;
  letter-spacing: 0;
  line-height: 1.2;
}

.headline-4 {
  font-size: 34px;
  font-weight: 400;
  letter-spacing: 0.25px;
  line-height: 1.3;
}

.headline-5 {
  font-size: 24px;
  font-weight: 400;
  letter-spacing: 0;
  line-height: 1.4;
}

.headline-6 {
  font-size: 20px;
  font-weight: 500;
  letter-spacing: 0.15px;
  line-height: 1.4;
}

.subtitle-1 {
  font-size: 16px;
  font-weight: 400;
  letter-spacing: 0.15px;
  line-height: 1.5;
}

.subtitle-2 {
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0.1px;
  line-height: 1.5;
}

.body-1 {
  font-size: 16px;
  font-weight: 400;
  letter-spacing: 0.5px;
  line-height: 1.5;
}

.body-2 {
  font-size: 14px;
  font-weight: 400;
  letter-spacing: 0.25px;
  line-height: 1.5;
}

.button-text {
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 1.25px;
  text-transform: uppercase;
}

.caption {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0.4px;
  line-height: 1.4;
}

.overline {
  font-size: 10px;
  font-weight: 400;
  letter-spacing: 1.5px;
  text-transform: uppercase;
  line-height: 1.4;
}
```

### 7. アニメーション

```css
/* Material Motion カーブ */
:root {
  --motion-standard: cubic-bezier(0.4, 0, 0.2, 1);
  --motion-decelerate: cubic-bezier(0, 0, 0.2, 1);
  --motion-accelerate: cubic-bezier(0.4, 0, 1, 1);
  --motion-sharp: cubic-bezier(0.4, 0, 0.6, 1);

  /* 継続時間 */
  --duration-short: 150ms;
  --duration-medium: 250ms;
  --duration-long: 300ms;
  --duration-complex: 375ms;
}

/* 基本トランジション */
.material-transition {
  transition: all var(--duration-medium) var(--motion-standard);
}

/* フェードイン */
@keyframes material-fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/* スケールイン */
@keyframes material-scale-in {
  from {
    opacity: 0;
    transform: scale(0.8);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

/* スライドアップ */
@keyframes material-slide-up {
  from {
    opacity: 0;
    transform: translateY(24px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

### 8. Ripple効果

```css
/* Ripple効果のベーススタイル */
.ripple {
  position: relative;
  overflow: hidden;
}

.ripple::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  opacity: 0;
}

.ripple:active::after {
  width: 200%;
  height: 200%;
  opacity: 1;
  transition: width 0.3s ease-out, height 0.3s ease-out, opacity 0.3s ease-out;
}

/* ダーク用Ripple */
.ripple-dark::after {
  background: rgba(0, 0, 0, 0.1);
}
```

## コンポーネントパターン

### ナビゲーションバー

```html
<header class="google-header">
  <div class="header-container">
    <div class="header-left">
      <button class="icon-button menu-button">
        <svg viewBox="0 0 24 24" width="24" height="24">
          <path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"/>
        </svg>
      </button>
      <a href="/" class="logo">
        <span class="logo-text">ProductName</span>
      </a>
    </div>
    <div class="header-center">
      <div class="search-bar">
        <svg class="search-icon" viewBox="0 0 24 24" width="20" height="20">
          <path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0016 9.5 6.5 6.5 0 109.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
        </svg>
        <input type="text" placeholder="検索">
      </div>
    </div>
    <div class="header-right">
      <button class="icon-button">
        <svg viewBox="0 0 24 24" width="24" height="24">
          <path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.89 2 2 2zm6-6v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2z"/>
        </svg>
      </button>
      <div class="avatar">
        <img src="avatar.jpg" alt="User">
      </div>
    </div>
  </div>
</header>
```

```css
.google-header {
  position: sticky;
  top: 0;
  background: var(--google-bg-primary);
  border-bottom: 1px solid var(--google-gray-200);
  z-index: 100;
}

.header-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 64px;
  padding: 0 16px;
  max-width: 1400px;
  margin: 0 auto;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 16px;
}

.logo-text {
  font-size: 22px;
  font-weight: 400;
  color: var(--google-gray-700);
}

.search-bar {
  display: flex;
  align-items: center;
  background: var(--google-gray-100);
  border-radius: var(--radius-sm);
  padding: 0 16px;
  height: 48px;
  min-width: 400px;
  transition: background var(--duration-short) var(--motion-standard),
              box-shadow var(--duration-short) var(--motion-standard);
}

.search-bar:focus-within {
  background: var(--google-bg-primary);
  box-shadow: var(--elevation-2);
}

.search-bar input {
  flex: 1;
  border: none;
  background: transparent;
  font-size: 16px;
  padding: 0 8px;
  outline: none;
}

.search-icon {
  fill: var(--google-gray-600);
}

.icon-button {
  width: 40px;
  height: 40px;
  border: none;
  background: transparent;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background var(--duration-short) var(--motion-standard);
}

.icon-button:hover {
  background: var(--google-gray-100);
}

.icon-button svg {
  fill: var(--google-gray-700);
}

.avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  overflow: hidden;
}

.avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

### ボタン

```css
/* 塗りつぶしボタン（Contained） */
.btn-contained {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 0 24px;
  height: 36px;
  background: var(--google-accent);
  color: #fff;
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  text-decoration: none;
  border: none;
  border-radius: var(--radius-xs);
  cursor: pointer;
  box-shadow: var(--elevation-1);
  transition: background var(--duration-short) var(--motion-standard),
              box-shadow var(--duration-short) var(--motion-standard);
}

.btn-contained:hover {
  background: var(--google-accent-hover);
  box-shadow: var(--elevation-2);
}

.btn-contained:active {
  box-shadow: var(--elevation-3);
}

/* アウトラインボタン（Outlined） */
.btn-outlined {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 0 24px;
  height: 36px;
  background: transparent;
  color: var(--google-accent);
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  text-decoration: none;
  border: 1px solid var(--google-gray-300);
  border-radius: var(--radius-xs);
  cursor: pointer;
  transition: background var(--duration-short) var(--motion-standard),
              border-color var(--duration-short) var(--motion-standard);
}

.btn-outlined:hover {
  background: var(--google-accent-light);
  border-color: var(--google-accent);
}

/* テキストボタン（Text） */
.btn-text {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 0 16px;
  height: 36px;
  background: transparent;
  color: var(--google-accent);
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  text-decoration: none;
  border: none;
  border-radius: var(--radius-xs);
  cursor: pointer;
  transition: background var(--duration-short) var(--motion-standard);
}

.btn-text:hover {
  background: var(--google-accent-light);
}

/* FAB（Floating Action Button） */
.fab {
  position: fixed;
  right: 24px;
  bottom: 24px;
  width: 56px;
  height: 56px;
  background: var(--google-accent);
  color: #fff;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  box-shadow: var(--elevation-3);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: box-shadow var(--duration-short) var(--motion-standard),
              transform var(--duration-short) var(--motion-standard);
}

.fab:hover {
  box-shadow: var(--elevation-5);
}

.fab:active {
  transform: scale(0.95);
}

/* 拡張FAB */
.fab-extended {
  width: auto;
  padding: 0 20px;
  border-radius: var(--radius-lg);
  gap: 12px;
}
```

### カード

```css
.google-card {
  background: var(--google-bg-primary);
  border-radius: var(--radius-sm);
  box-shadow: var(--elevation-1);
  overflow: hidden;
  transition: box-shadow var(--duration-short) var(--motion-standard);
}

.google-card:hover {
  box-shadow: var(--elevation-2);
}

.card-media {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-content {
  padding: 16px;
}

.card-title {
  font-size: 20px;
  font-weight: 500;
  color: var(--google-text-primary);
  margin-bottom: 8px;
}

.card-subtitle {
  font-size: 14px;
  color: var(--google-text-secondary);
  margin-bottom: 16px;
}

.card-actions {
  display: flex;
  gap: 8px;
  padding: 8px 16px 16px;
}

/* アウトラインカード */
.google-card-outlined {
  background: var(--google-bg-primary);
  border: 1px solid var(--google-gray-300);
  border-radius: var(--radius-sm);
  box-shadow: none;
}
```

### チップ

```css
.chip {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 32px;
  padding: 0 12px;
  background: var(--google-gray-100);
  border-radius: 16px;
  font-size: 14px;
  color: var(--google-text-primary);
  cursor: pointer;
  transition: background var(--duration-short) var(--motion-standard);
}

.chip:hover {
  background: var(--google-gray-200);
}

.chip-icon {
  width: 18px;
  height: 18px;
}

.chip-avatar {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  margin-left: -8px;
}

/* 選択済みチップ */
.chip-selected {
  background: var(--google-accent-light);
  color: var(--google-accent);
}

/* アウトラインチップ */
.chip-outlined {
  background: transparent;
  border: 1px solid var(--google-gray-300);
}
```

### テキストフィールド

```css
.text-field {
  position: relative;
  margin-bottom: 24px;
}

.text-field input {
  width: 100%;
  height: 56px;
  padding: 20px 16px 6px;
  font-size: 16px;
  border: 1px solid var(--google-gray-400);
  border-radius: var(--radius-xs);
  background: transparent;
  outline: none;
  transition: border-color var(--duration-short) var(--motion-standard);
}

.text-field label {
  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 16px;
  color: var(--google-text-secondary);
  pointer-events: none;
  transition: all var(--duration-short) var(--motion-standard);
}

.text-field input:focus {
  border-color: var(--google-accent);
  border-width: 2px;
}

.text-field input:focus + label,
.text-field input:not(:placeholder-shown) + label {
  top: 8px;
  transform: translateY(0);
  font-size: 12px;
  color: var(--google-accent);
}

/* 塗りつぶしテキストフィールド */
.text-field-filled input {
  background: var(--google-gray-100);
  border: none;
  border-bottom: 1px solid var(--google-gray-400);
  border-radius: var(--radius-xs) var(--radius-xs) 0 0;
}

.text-field-filled input:focus {
  border-bottom: 2px solid var(--google-accent);
}
```

### ダイアログ

```css
.dialog-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.32);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  animation: material-fade-in var(--duration-medium) var(--motion-decelerate);
}

.dialog {
  background: var(--google-bg-primary);
  border-radius: var(--radius-md);
  box-shadow: var(--elevation-5);
  min-width: 280px;
  max-width: 560px;
  max-height: calc(100vh - 48px);
  overflow: hidden;
  animation: material-scale-in var(--duration-medium) var(--motion-decelerate);
}

.dialog-title {
  padding: 24px 24px 16px;
  font-size: 20px;
  font-weight: 500;
  color: var(--google-text-primary);
}

.dialog-content {
  padding: 0 24px 24px;
  font-size: 14px;
  color: var(--google-text-secondary);
  line-height: 1.5;
}

.dialog-actions {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  padding: 8px 16px 16px;
}
```

### リスト

```css
.google-list {
  list-style: none;
  padding: 8px 0;
  margin: 0;
}

.list-item {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 12px 16px;
  cursor: pointer;
  transition: background var(--duration-short) var(--motion-standard);
}

.list-item:hover {
  background: var(--google-gray-100);
}

.list-item-icon {
  width: 24px;
  height: 24px;
  fill: var(--google-gray-600);
}

.list-item-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

.list-item-text {
  flex: 1;
}

.list-item-primary {
  font-size: 16px;
  color: var(--google-text-primary);
}

.list-item-secondary {
  font-size: 14px;
  color: var(--google-text-secondary);
}

.list-divider {
  height: 1px;
  background: var(--google-gray-200);
  margin: 8px 0;
}
```

## グリッドレイアウト

```css
.google-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
  padding: 24px;
  max-width: 1400px;
  margin: 0 auto;
}

/* Google Photos風グリッド */
.masonry-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  grid-auto-rows: 10px;
  gap: 8px;
}
```

## レスポンシブブレークポイント

```css
/* Material Designのブレークポイント */
@media (max-width: 600px) {
  /* スマートフォン（小） */
}

@media (max-width: 905px) {
  /* タブレット（縦向き） */
}

@media (max-width: 1240px) {
  /* タブレット（横向き）・小型デスクトップ */
}

@media (max-width: 1440px) {
  /* デスクトップ */
}

/* 1440px以上は大型デスクトップ */
```

## ダークテーマ

```css
@media (prefers-color-scheme: dark) {
  :root {
    --google-text-primary: rgba(255, 255, 255, 0.87);
    --google-text-secondary: rgba(255, 255, 255, 0.60);
    --google-text-disabled: rgba(255, 255, 255, 0.38);

    --google-bg-primary: #202124;
    --google-bg-secondary: #303134;

    --google-gray-100: #3c4043;
    --google-gray-200: #5f6368;
    --google-gray-300: #80868b;
  }

  body {
    background: var(--google-bg-primary);
    color: var(--google-text-primary);
  }

  .google-card {
    background: var(--google-bg-secondary);
  }

  .search-bar {
    background: var(--google-bg-secondary);
  }
}
```

## ベストプラクティス

1. **エレベーションで階層を表現** - 重要な要素ほど高いエレベーションを使用
2. **アクセントカラーは控えめに** - アクション要素にのみ使用
3. **リップル効果でフィードバック** - タッチ/クリックに対する即座の反応
4. **一貫したスペーシング** - 8pxグリッドシステムを使用
5. **アイコンはMaterial Icons** - 統一感のあるアイコンセット
6. **モーションは意図的に** - アニメーションには目的を持たせる
7. **タッチターゲットは48px以上** - モバイルでのタップを考慮

## AI アシスタント向け指示

このスキルが呼び出されたとき：

1. **まず要件を確認する**
   - 作成するページ/コンポーネントの種類
   - 必要な要素（ヘッダー、カード、FAB等）
   - ダークテーマ対応の有無

2. **Material Design原則を適用する**
   - エレベーションによる奥行き表現
   - 意図的な色使い
   - 一貫したタイポグラフィスケール
   - 適切なモーション

3. **コード生成時のルール**
   - 上記のカラーパレット、エレベーション、アニメーションを使用
   - セマンティックHTMLを使用
   - CSS変数でテーマ管理
   - 8pxグリッドでスペーシング
   - モバイルファーストでレスポンシブ対応

常に行うこと：
- エレベーションで視覚的階層を作る
- Ripple効果でインタラクティブフィードバック
- 鮮やかなアクセントカラーをポイント使い
- 滑らかで意図的なアニメーション

避けるべきこと：
- 過度なエレベーションの使用
- アクセントカラーの乱用
- 意味のないアニメーション
- 一貫性のないスペーシング
