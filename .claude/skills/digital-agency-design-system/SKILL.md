---
name: digital-agency-design-system
description: デジタル庁デザインシステム（DADS）に基づいたアクセシブルで統一感のあるUIを作成する。行政機関・公共性の高いWebサイト/アプリ向け。Noto Sans JPフォント、8pxグリッド、WCAG 2.2準拠のアクセシビリティ対応。政府・自治体・公共機関のWebサイトをデザインする際に使用。
---

# デジタル庁デザインシステム（DADS）スキル

デジタル庁デザインシステムに基づいた、アクセシブルで統一感のある UI を作成するためのガイドです。

## このスキルを使用するタイミング

- 政府・行政機関のWebサイトやWebアプリケーションを作成するとき
- 自治体・公共機関のサービスサイトを構築するとき
- アクセシビリティ（WCAG 2.2 / JIS X 8341-3:2016）準拠のUIが必要なとき
- 日本語コンテンツ中心の公式サイトを設計するとき
- デジタル庁デザインシステム、DADS、行政デザインシステムを使用するとき

## デジタル庁デザインシステムの核心原則

### 1. アクセシビリティファースト

- WCAG 2.2 および JIS X 8341-3:2016 に準拠
- コントラスト比は最低 4.5:1 を確保（テキスト）
- 大きいテキスト・UIコンポーネントは 3:1 以上
- キーボード操作に完全対応
- スクリーンリーダー対応

### 2. 一貫性と予測可能性

- すべてのページで統一されたナビゲーション
- 予測可能なインタラクション
- 視覚的な一貫性で認知負荷を軽減

### 3. 読みやすさと明瞭さ

- 十分なフォントサイズ（本文16px以上）
- 適切な行間（1.5倍以上）
- 明確な情報階層

### 4. インクルーシブデザイン

- 多様なユーザーへの配慮
- 高齢者・障害者にも使いやすい設計
- モバイルからデスクトップまで対応

## カラーパレット

```css
:root {
  /* プライマリカラー（青系） */
  --dads-primary-900: #003d78;
  --dads-primary-800: #004c96;
  --dads-primary-700: #005bb4;
  --dads-primary-600: #006bd2;
  --dads-primary-500: #0071c1;  /* メインプライマリ */
  --dads-primary-400: #3d8fd4;
  --dads-primary-300: #6aade7;
  --dads-primary-200: #a3cef2;
  --dads-primary-100: #d1e7f9;
  --dads-primary-50: #e8f3fc;

  /* セカンダリカラー（ティール/シアン系） */
  --dads-secondary-700: #006d75;
  --dads-secondary-600: #008a94;
  --dads-secondary-500: #00a7b3;
  --dads-secondary-400: #33b9c2;
  --dads-secondary-300: #66cbd1;
  --dads-secondary-200: #99dde0;
  --dads-secondary-100: #cceeef;

  /* ニュートラル（グレースケール） */
  --dads-neutral-white: #ffffff;
  --dads-neutral-50: #f8f9fa;
  --dads-neutral-100: #f1f3f5;
  --dads-neutral-200: #e9ecef;
  --dads-neutral-300: #dee2e6;
  --dads-neutral-400: #ced4da;
  --dads-neutral-500: #adb5bd;
  --dads-neutral-600: #868e96;
  --dads-neutral-700: #495057;
  --dads-neutral-800: #343a40;
  --dads-neutral-900: #212529;
  --dads-neutral-black: #000000;

  /* セマンティックカラー */
  /* 成功（緑） */
  --dads-success-light: #d4edda;
  --dads-success: #28a745;
  --dads-success-dark: #1e7e34;

  /* エラー（赤） */
  --dads-error-light: #f8d7da;
  --dads-error: #dc3545;
  --dads-error-dark: #bd2130;

  /* 警告（黄/オレンジ） */
  --dads-warning-light: #fff3cd;
  --dads-warning: #ffc107;
  --dads-warning-dark: #d39e00;

  /* 情報（青） */
  --dads-info-light: #cce5ff;
  --dads-info: #17a2b8;
  --dads-info-dark: #117a8b;

  /* テキストカラー */
  --dads-text-primary: #212529;
  --dads-text-secondary: #495057;
  --dads-text-muted: #6c757d;
  --dads-text-link: #0071c1;
  --dads-text-link-hover: #004c96;
  --dads-text-link-visited: #5c3d9e;

  /* 背景カラー */
  --dads-bg-primary: #ffffff;
  --dads-bg-secondary: #f8f9fa;
  --dads-bg-tertiary: #e9ecef;

  /* ボーダーカラー */
  --dads-border-light: #dee2e6;
  --dads-border-default: #ced4da;
  --dads-border-dark: #adb5bd;
}
```

### カラー使用ガイドライン

- **プライマリカラー**: 主要なアクション、リンク、アクティブ状態に使用
- **セカンダリカラー**: 補助的なUI要素に使用
- **ニュートラル**: 背景、ボーダー、テキストに使用
- **セマンティックカラー**: 状態表示（成功、エラー、警告、情報）に使用
- **コントラスト比**: テキストは背景に対して 4.5:1 以上を維持

## タイポグラフィ

```css
/* フォントスタック */
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

/* 等幅フォント（コード用） */
code, pre, .monospace {
  font-family:
    'Noto Sans Mono',
    'SFMono-Regular',
    Consolas,
    'Liberation Mono',
    Menlo,
    monospace;
}

/* フォントウェイト */
:root {
  --font-weight-normal: 400;
  --font-weight-bold: 700;
}

/* タイポグラフィスケール */
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

.heading-1 {
  font-size: 40px;
  font-weight: 700;
  line-height: 1.4;
}

.heading-2 {
  font-size: 32px;
  font-weight: 700;
  line-height: 1.4;
}

.heading-3 {
  font-size: 24px;
  font-weight: 700;
  line-height: 1.4;
}

.heading-4 {
  font-size: 20px;
  font-weight: 700;
  line-height: 1.4;
}

.heading-5 {
  font-size: 18px;
  font-weight: 700;
  line-height: 1.4;
}

.heading-6 {
  font-size: 16px;
  font-weight: 700;
  line-height: 1.4;
}

.body-large {
  font-size: 18px;
  font-weight: 400;
  line-height: 1.75;
}

.body-default {
  font-size: 16px;
  font-weight: 400;
  line-height: 1.75;
}

.body-small {
  font-size: 14px;
  font-weight: 400;
  line-height: 1.5;
}

.caption {
  font-size: 12px;
  font-weight: 400;
  line-height: 1.4;
}
```

### タイポグラフィガイドライン

- **本文**: 最低 16px（14px は補足情報のみ）
- **行間**: 本文は 1.5～1.75 倍、見出しは 1.2～1.4 倍
- **文字間隔**: 見出しは -0.02em～0em、本文は標準

## スペーシングシステム

```css
:root {
  /* 8pxベースのスペーシングスケール */
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

### スペーシングガイドライン

- **近接の原則**: 関連する要素には小さな間隔、関連性の低い要素には大きな間隔
- **一貫性**: 同じ階層レベルの要素には同じスペーシングを使用
- **情報階層**: 大きな余白でセクション区切りを明確に

## グリッドシステム

```css
:root {
  /* グリッド設定 */
  --grid-columns: 12;
  --grid-gutter: 24px;  /* 本文サイズの1.5倍 */
  --grid-margin: 16px;
}

/* コンテナ */
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--grid-margin);
}

/* グリッドレイアウト */
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: var(--grid-gutter);
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

/* オフセット（コンテンツフォーカス配置用） */
.col-offset-1 { grid-column-start: 2; }
.col-offset-2 { grid-column-start: 3; }
.col-offset-3 { grid-column-start: 4; }
```

## レスポンシブブレークポイント

```css
:root {
  --breakpoint-sm: 576px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 992px;
  --breakpoint-xl: 1200px;
}

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

## コンポーネントパターン

### ボタン

```html
<!-- プライマリボタン -->
<button class="btn btn-primary">送信する</button>

<!-- セカンダリボタン -->
<button class="btn btn-secondary">キャンセル</button>

<!-- アウトラインボタン -->
<button class="btn btn-outline">詳細を見る</button>

<!-- テキストボタン -->
<button class="btn btn-text">もっと見る</button>
```

```css
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 12px 24px;
  font-size: 16px;
  font-weight: 700;
  line-height: 1;
  text-decoration: none;
  border: 2px solid transparent;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.2s ease;
  min-height: 48px;  /* タッチターゲット確保 */
}

.btn:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
}

/* プライマリボタン */
.btn-primary {
  background: var(--dads-primary-500);
  color: var(--dads-neutral-white);
  border-color: var(--dads-primary-500);
}

.btn-primary:hover {
  background: var(--dads-primary-700);
  border-color: var(--dads-primary-700);
}

.btn-primary:active {
  background: var(--dads-primary-800);
  border-color: var(--dads-primary-800);
}

/* セカンダリボタン */
.btn-secondary {
  background: var(--dads-neutral-600);
  color: var(--dads-neutral-white);
  border-color: var(--dads-neutral-600);
}

.btn-secondary:hover {
  background: var(--dads-neutral-700);
  border-color: var(--dads-neutral-700);
}

/* アウトラインボタン */
.btn-outline {
  background: transparent;
  color: var(--dads-primary-500);
  border-color: var(--dads-primary-500);
}

.btn-outline:hover {
  background: var(--dads-primary-50);
}

/* テキストボタン */
.btn-text {
  background: transparent;
  color: var(--dads-text-link);
  border: none;
  padding: 8px 16px;
  text-decoration: underline;
}

.btn-text:hover {
  color: var(--dads-text-link-hover);
}

/* 無効状態 */
.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

### フォーム要素

```html
<!-- テキスト入力 -->
<div class="form-group">
  <label for="name" class="form-label">
    お名前<span class="required">*</span>
  </label>
  <input type="text" id="name" class="form-input" required>
  <p class="form-hint">姓と名の間にスペースを入れてください</p>
</div>

<!-- エラー状態 -->
<div class="form-group has-error">
  <label for="email" class="form-label">
    メールアドレス<span class="required">*</span>
  </label>
  <input type="email" id="email" class="form-input" aria-invalid="true" aria-describedby="email-error">
  <p class="form-error" id="email-error">正しいメールアドレスを入力してください</p>
</div>

<!-- セレクトボックス -->
<div class="form-group">
  <label for="prefecture" class="form-label">都道府県</label>
  <select id="prefecture" class="form-select">
    <option value="">選択してください</option>
    <option value="tokyo">東京都</option>
    <option value="osaka">大阪府</option>
  </select>
</div>

<!-- チェックボックス -->
<div class="form-check">
  <input type="checkbox" id="agree" class="form-checkbox">
  <label for="agree" class="form-check-label">利用規約に同意する</label>
</div>

<!-- ラジオボタン -->
<fieldset class="form-fieldset">
  <legend class="form-legend">連絡方法</legend>
  <div class="form-check">
    <input type="radio" id="contact-email" name="contact" class="form-radio">
    <label for="contact-email" class="form-check-label">メール</label>
  </div>
  <div class="form-check">
    <input type="radio" id="contact-phone" name="contact" class="form-radio">
    <label for="contact-phone" class="form-check-label">電話</label>
  </div>
</fieldset>
```

```css
.form-group {
  margin-bottom: var(--space-5);
}

.form-label {
  display: block;
  margin-bottom: var(--space-2);
  font-size: 16px;
  font-weight: 700;
  color: var(--dads-text-primary);
}

.required {
  color: var(--dads-error);
  margin-left: 4px;
}

.form-input,
.form-select,
.form-textarea {
  width: 100%;
  padding: 12px 16px;
  font-size: 16px;
  line-height: 1.5;
  color: var(--dads-text-primary);
  background: var(--dads-bg-primary);
  border: 2px solid var(--dads-border-default);
  border-radius: 4px;
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.form-input:hover,
.form-select:hover {
  border-color: var(--dads-border-dark);
}

.form-input:focus,
.form-select:focus {
  outline: none;
  border-color: var(--dads-primary-500);
  box-shadow: 0 0 0 3px rgba(0, 113, 193, 0.2);
}

/* エラー状態 */
.has-error .form-input,
.has-error .form-select {
  border-color: var(--dads-error);
}

.has-error .form-input:focus {
  box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.2);
}

.form-hint {
  margin-top: var(--space-1);
  font-size: 14px;
  color: var(--dads-text-muted);
}

.form-error {
  margin-top: var(--space-1);
  font-size: 14px;
  color: var(--dads-error);
}

/* チェックボックス・ラジオボタン */
.form-check {
  display: flex;
  align-items: flex-start;
  gap: var(--space-2);
  margin-bottom: var(--space-2);
}

.form-checkbox,
.form-radio {
  width: 24px;
  height: 24px;
  margin: 0;
  accent-color: var(--dads-primary-500);
}

.form-check-label {
  font-size: 16px;
  line-height: 1.5;
  color: var(--dads-text-primary);
}

.form-fieldset {
  border: none;
  padding: 0;
  margin: 0 0 var(--space-5);
}

.form-legend {
  font-size: 16px;
  font-weight: 700;
  color: var(--dads-text-primary);
  margin-bottom: var(--space-3);
}
```

### カード

```html
<article class="card">
  <div class="card-body">
    <h3 class="card-title">カードタイトル</h3>
    <p class="card-text">カードの説明文がここに入ります。</p>
    <a href="#" class="card-link">詳細を見る</a>
  </div>
</article>

<!-- 画像付きカード -->
<article class="card">
  <img src="image.jpg" alt="画像の説明" class="card-image">
  <div class="card-body">
    <h3 class="card-title">カードタイトル</h3>
    <p class="card-text">カードの説明文がここに入ります。</p>
  </div>
</article>
```

```css
.card {
  background: var(--dads-bg-primary);
  border: 1px solid var(--dads-border-light);
  border-radius: 8px;
  overflow: hidden;
  transition: box-shadow 0.2s ease;
}

.card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.card-image {
  width: 100%;
  height: auto;
  display: block;
}

.card-body {
  padding: var(--space-5);
}

.card-title {
  font-size: 20px;
  font-weight: 700;
  color: var(--dads-text-primary);
  margin: 0 0 var(--space-3);
}

.card-text {
  font-size: 16px;
  color: var(--dads-text-secondary);
  margin: 0 0 var(--space-4);
  line-height: 1.75;
}

.card-link {
  color: var(--dads-text-link);
  text-decoration: underline;
  font-weight: 700;
}

.card-link:hover {
  color: var(--dads-text-link-hover);
}
```

### ナビゲーション

```html
<!-- グローバルヘッダー -->
<header class="header">
  <div class="container">
    <div class="header-inner">
      <a href="/" class="header-logo">
        <img src="logo.svg" alt="サイト名">
      </a>
      <nav class="header-nav" aria-label="メインメニュー">
        <ul class="nav-list">
          <li><a href="/about" class="nav-link">サービス概要</a></li>
          <li><a href="/guide" class="nav-link">ご利用ガイド</a></li>
          <li><a href="/faq" class="nav-link">よくある質問</a></li>
          <li><a href="/contact" class="nav-link">お問い合わせ</a></li>
        </ul>
      </nav>
      <button class="header-menu-btn" aria-expanded="false" aria-label="メニューを開く">
        <span class="menu-icon"></span>
      </button>
    </div>
  </div>
</header>

<!-- パンくずリスト -->
<nav class="breadcrumb" aria-label="パンくずリスト">
  <ol class="breadcrumb-list">
    <li class="breadcrumb-item">
      <a href="/">ホーム</a>
    </li>
    <li class="breadcrumb-item">
      <a href="/services">サービス一覧</a>
    </li>
    <li class="breadcrumb-item" aria-current="page">
      サービス詳細
    </li>
  </ol>
</nav>
```

```css
.header {
  background: var(--dads-bg-primary);
  border-bottom: 1px solid var(--dads-border-light);
  position: sticky;
  top: 0;
  z-index: 100;
}

.header-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 64px;
}

.header-logo img {
  height: 40px;
  width: auto;
}

.nav-list {
  display: flex;
  gap: var(--space-6);
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-link {
  color: var(--dads-text-primary);
  text-decoration: none;
  font-size: 16px;
  font-weight: 500;
  padding: var(--space-2) 0;
  border-bottom: 3px solid transparent;
  transition: color 0.2s ease, border-color 0.2s ease;
}

.nav-link:hover {
  color: var(--dads-primary-500);
}

.nav-link[aria-current="page"] {
  color: var(--dads-primary-500);
  border-bottom-color: var(--dads-primary-500);
}

/* パンくずリスト */
.breadcrumb {
  padding: var(--space-4) 0;
  background: var(--dads-bg-secondary);
}

.breadcrumb-list {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-2);
  list-style: none;
  margin: 0;
  padding: 0;
  font-size: 14px;
}

.breadcrumb-item {
  display: flex;
  align-items: center;
}

.breadcrumb-item:not(:last-child)::after {
  content: ">";
  margin-left: var(--space-2);
  color: var(--dads-text-muted);
}

.breadcrumb-item a {
  color: var(--dads-text-link);
  text-decoration: underline;
}

.breadcrumb-item a:hover {
  color: var(--dads-text-link-hover);
}

.breadcrumb-item[aria-current="page"] {
  color: var(--dads-text-primary);
}
```

### 通知バナー

```html
<!-- 情報バナー -->
<div class="notification notification-info" role="alert">
  <div class="notification-icon" aria-hidden="true">ℹ️</div>
  <div class="notification-content">
    <p class="notification-text">システムメンテナンスのお知らせ：1月15日午前2時〜6時の間、サービスをご利用いただけません。</p>
  </div>
  <button class="notification-close" aria-label="通知を閉じる">&times;</button>
</div>

<!-- 緊急バナー -->
<div class="notification notification-emergency" role="alert">
  <div class="notification-icon" aria-hidden="true">⚠️</div>
  <div class="notification-content">
    <p class="notification-text"><strong>【緊急】</strong>台風接近に伴い、本日の窓口業務は午後3時で終了します。</p>
  </div>
</div>

<!-- 成功バナー -->
<div class="notification notification-success" role="status">
  <div class="notification-icon" aria-hidden="true">✓</div>
  <div class="notification-content">
    <p class="notification-text">申請が完了しました。確認メールをお送りしましたのでご確認ください。</p>
  </div>
</div>

<!-- エラーバナー -->
<div class="notification notification-error" role="alert">
  <div class="notification-icon" aria-hidden="true">✕</div>
  <div class="notification-content">
    <p class="notification-text">エラーが発生しました。入力内容をご確認ください。</p>
  </div>
</div>
```

```css
.notification {
  display: flex;
  align-items: flex-start;
  gap: var(--space-3);
  padding: var(--space-4);
  border-radius: 4px;
  margin-bottom: var(--space-4);
}

.notification-icon {
  flex-shrink: 0;
  font-size: 20px;
}

.notification-content {
  flex: 1;
}

.notification-text {
  margin: 0;
  font-size: 16px;
  line-height: 1.5;
}

.notification-close {
  flex-shrink: 0;
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  opacity: 0.7;
  padding: 0;
  line-height: 1;
}

.notification-close:hover {
  opacity: 1;
}

/* バリエーション */
.notification-info {
  background: var(--dads-info-light);
  border-left: 4px solid var(--dads-info);
}

.notification-success {
  background: var(--dads-success-light);
  border-left: 4px solid var(--dads-success);
}

.notification-warning {
  background: var(--dads-warning-light);
  border-left: 4px solid var(--dads-warning);
}

.notification-error {
  background: var(--dads-error-light);
  border-left: 4px solid var(--dads-error);
}

.notification-emergency {
  background: var(--dads-error);
  color: var(--dads-neutral-white);
  border-left: none;
}
```

### ステップナビゲーション

```html
<nav class="step-nav" aria-label="申請手順">
  <ol class="step-list">
    <li class="step-item completed">
      <span class="step-number">1</span>
      <span class="step-label">基本情報入力</span>
    </li>
    <li class="step-item current" aria-current="step">
      <span class="step-number">2</span>
      <span class="step-label">書類アップロード</span>
    </li>
    <li class="step-item">
      <span class="step-number">3</span>
      <span class="step-label">確認</span>
    </li>
    <li class="step-item">
      <span class="step-number">4</span>
      <span class="step-label">完了</span>
    </li>
  </ol>
</nav>
```

```css
.step-nav {
  padding: var(--space-5) 0;
}

.step-list {
  display: flex;
  justify-content: center;
  gap: var(--space-2);
  list-style: none;
  margin: 0;
  padding: 0;
}

.step-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--space-2);
  position: relative;
  flex: 1;
  max-width: 200px;
}

.step-item:not(:last-child)::after {
  content: "";
  position: absolute;
  top: 20px;
  left: calc(50% + 24px);
  width: calc(100% - 48px);
  height: 2px;
  background: var(--dads-border-default);
}

.step-item.completed:not(:last-child)::after {
  background: var(--dads-primary-500);
}

.step-number {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--dads-bg-secondary);
  border: 2px solid var(--dads-border-default);
  font-size: 16px;
  font-weight: 700;
  color: var(--dads-text-muted);
  position: relative;
  z-index: 1;
}

.step-item.completed .step-number {
  background: var(--dads-primary-500);
  border-color: var(--dads-primary-500);
  color: var(--dads-neutral-white);
}

.step-item.current .step-number {
  background: var(--dads-bg-primary);
  border-color: var(--dads-primary-500);
  color: var(--dads-primary-500);
}

.step-label {
  font-size: 14px;
  color: var(--dads-text-muted);
  text-align: center;
}

.step-item.current .step-label {
  color: var(--dads-text-primary);
  font-weight: 700;
}

.step-item.completed .step-label {
  color: var(--dads-text-secondary);
}
```

### アコーディオン

```html
<div class="accordion">
  <div class="accordion-item">
    <h3 class="accordion-header">
      <button class="accordion-trigger" aria-expanded="false" aria-controls="panel-1">
        <span class="accordion-title">よくある質問 1</span>
        <span class="accordion-icon" aria-hidden="true"></span>
      </button>
    </h3>
    <div class="accordion-panel" id="panel-1" hidden>
      <div class="accordion-content">
        <p>回答の内容がここに入ります。</p>
      </div>
    </div>
  </div>
</div>
```

```css
.accordion {
  border: 1px solid var(--dads-border-light);
  border-radius: 8px;
  overflow: hidden;
}

.accordion-item {
  border-bottom: 1px solid var(--dads-border-light);
}

.accordion-item:last-child {
  border-bottom: none;
}

.accordion-trigger {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  padding: var(--space-4) var(--space-5);
  background: var(--dads-bg-primary);
  border: none;
  cursor: pointer;
  text-align: left;
  transition: background 0.2s ease;
}

.accordion-trigger:hover {
  background: var(--dads-bg-secondary);
}

.accordion-title {
  font-size: 16px;
  font-weight: 700;
  color: var(--dads-text-primary);
}

.accordion-icon {
  width: 24px;
  height: 24px;
  position: relative;
  flex-shrink: 0;
}

.accordion-icon::before,
.accordion-icon::after {
  content: "";
  position: absolute;
  background: var(--dads-text-primary);
  transition: transform 0.2s ease;
}

.accordion-icon::before {
  width: 2px;
  height: 16px;
  top: 4px;
  left: 11px;
}

.accordion-icon::after {
  width: 16px;
  height: 2px;
  top: 11px;
  left: 4px;
}

.accordion-trigger[aria-expanded="true"] .accordion-icon::before {
  transform: rotate(90deg);
}

.accordion-panel {
  overflow: hidden;
}

.accordion-content {
  padding: var(--space-4) var(--space-5);
  background: var(--dads-bg-secondary);
}

.accordion-content p {
  margin: 0;
  font-size: 16px;
  line-height: 1.75;
  color: var(--dads-text-secondary);
}
```

## フォーカス状態とアクセシビリティ

```css
/* フォーカス可視化 */
:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
}

/* スキップリンク */
.skip-link {
  position: absolute;
  top: -100%;
  left: 0;
  padding: var(--space-3) var(--space-4);
  background: var(--dads-primary-500);
  color: var(--dads-neutral-white);
  text-decoration: none;
  z-index: 9999;
}

.skip-link:focus {
  top: 0;
}

/* スクリーンリーダー専用テキスト */
.visually-hidden {
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

/* 動き軽減設定への対応 */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

## ベストプラクティス

1. **アクセシビリティを最優先** - コントラスト比、キーボード操作、スクリーンリーダー対応を常に確認
2. **セマンティックHTML** - 適切なHTML要素とランドマークを使用
3. **フォーカス状態を明確に** - `:focus-visible` でフォーカスリングを表示
4. **エラー表示は明確に** - 色だけでなくアイコンやテキストでも伝達
5. **タッチターゲット** - 最低 44x44px（推奨 48x48px）を確保
6. **フォームラベル** - すべてのフォーム要素にラベルを関連付け
7. **画像の代替テキスト** - 意味のある画像には適切な alt を設定
8. **言語属性** - `<html lang="ja">` を必ず設定
9. **見出し階層** - h1 から順番に、スキップなく使用
10. **リンクテキスト** - 「こちら」ではなく具体的な内容を記述

## AI アシスタント向け指示

このスキルが呼び出されたとき：

1. **まず要件を確認する**
   - 作成するページ/コンポーネントの種類
   - 対象ユーザー（一般市民、事業者、行政職員等）
   - 必要なアクセシビリティレベル

2. **デジタル庁デザインシステム原則を適用する**
   - アクセシビリティファースト
   - 一貫性と予測可能性
   - 読みやすさと明瞭さ
   - インクルーシブデザイン

3. **コード生成時のルール**
   - 上記のカラーパレット、タイポグラフィ、スペーシングを使用
   - セマンティックHTMLを使用（適切なランドマーク、見出し階層）
   - WAI-ARIA属性を適切に使用
   - CSS変数でテーマ管理
   - モバイルファーストでレスポンシブ対応

常に行うこと：
- `<html lang="ja">` を設定
- スキップリンクを実装
- フォーカス状態を明確に表示
- フォーム要素にラベルを関連付け
- エラーは色だけでなくテキストでも伝達
- タッチターゲットを 48px 以上確保

避けるべきこと：
- コントラスト比 4.5:1 未満の組み合わせ
- フォーカスリングの非表示
- 「こちら」「詳細」だけのリンクテキスト
- 自動再生するメディア
- 点滅するコンテンツ
- 色のみで情報を伝えるデザイン

## 参考リソース

- [デジタル庁デザインシステム公式サイト](https://design.digital.go.jp/dads/)
- [WCAG 2.2 ガイドライン](https://www.w3.org/TR/WCAG22/)
- [JIS X 8341-3:2016](https://waic.jp/docs/jis2016/understanding/)
