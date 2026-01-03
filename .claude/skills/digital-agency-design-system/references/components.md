# デジタル庁デザインシステム コンポーネント

デジタル庁デザインシステム（DADS）に基づいたUIコンポーネントの完全なリファレンス。

## ボタン

### プライマリボタン

```html
<button class="btn btn-primary">送信する</button>
<button class="btn btn-primary" disabled>送信する</button>
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
  min-height: 48px;  /* タッチターゲット */
}

.btn:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
}

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

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

### セカンダリボタン

```html
<button class="btn btn-secondary">キャンセル</button>
```

```css
.btn-secondary {
  background: var(--dads-neutral-600);
  color: var(--dads-neutral-white);
  border-color: var(--dads-neutral-600);
}

.btn-secondary:hover {
  background: var(--dads-neutral-700);
  border-color: var(--dads-neutral-700);
}
```

### アウトラインボタン

```html
<button class="btn btn-outline">詳細を見る</button>
```

```css
.btn-outline {
  background: transparent;
  color: var(--dads-primary-500);
  border-color: var(--dads-primary-500);
}

.btn-outline:hover {
  background: var(--dads-primary-50);
}
```

### テキストボタン

```html
<button class="btn btn-text">もっと見る</button>
```

```css
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
```

### ボタンサイズ

```css
.btn-sm {
  padding: 8px 16px;
  font-size: 14px;
  min-height: 36px;
}

.btn-lg {
  padding: 16px 32px;
  font-size: 18px;
  min-height: 56px;
}

.btn-block {
  display: flex;
  width: 100%;
}
```

## フォーム

### テキスト入力

```html
<div class="form-group">
  <label for="name" class="form-label">
    お名前<span class="required" aria-label="必須">*</span>
  </label>
  <input type="text" id="name" class="form-input" required>
  <p class="form-hint">姓と名の間にスペースを入れてください</p>
</div>
```

```css
.form-group {
  margin-bottom: 24px;
}

.form-label {
  display: block;
  margin-bottom: 8px;
  font-size: 16px;
  font-weight: 700;
  color: var(--dads-text-primary);
}

.required {
  color: var(--dads-error);
  margin-left: 4px;
}

.form-input {
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

.form-input:hover {
  border-color: var(--dads-border-dark);
}

.form-input:focus {
  outline: none;
  border-color: var(--dads-primary-500);
  box-shadow: 0 0 0 3px rgba(0, 113, 193, 0.2);
}

.form-hint {
  margin-top: 4px;
  font-size: 14px;
  color: var(--dads-text-muted);
}
```

### エラー状態

```html
<div class="form-group has-error">
  <label for="email" class="form-label">
    メールアドレス<span class="required">*</span>
  </label>
  <input type="email" id="email" class="form-input"
         aria-invalid="true" aria-describedby="email-error">
  <p class="form-error" id="email-error">
    <span aria-hidden="true">⚠</span>
    正しいメールアドレスを入力してください
  </p>
</div>
```

```css
.has-error .form-input {
  border-color: var(--dads-error);
}

.has-error .form-input:focus {
  box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.2);
}

.form-error {
  margin-top: 4px;
  font-size: 14px;
  color: var(--dads-error);
  display: flex;
  align-items: center;
  gap: 4px;
}
```

### セレクトボックス

```html
<div class="form-group">
  <label for="prefecture" class="form-label">都道府県</label>
  <select id="prefecture" class="form-select">
    <option value="">選択してください</option>
    <option value="tokyo">東京都</option>
  </select>
</div>
```

```css
.form-select {
  width: 100%;
  padding: 12px 40px 12px 16px;
  font-size: 16px;
  color: var(--dads-text-primary);
  background: var(--dads-bg-primary) url("data:image/svg+xml,...") no-repeat right 12px center;
  border: 2px solid var(--dads-border-default);
  border-radius: 4px;
  appearance: none;
  cursor: pointer;
}
```

### チェックボックス・ラジオボタン

```html
<div class="form-check">
  <input type="checkbox" id="agree" class="form-checkbox">
  <label for="agree" class="form-check-label">利用規約に同意する</label>
</div>

<fieldset class="form-fieldset">
  <legend class="form-legend">連絡方法</legend>
  <div class="form-check">
    <input type="radio" id="email" name="contact" class="form-radio">
    <label for="email" class="form-check-label">メール</label>
  </div>
  <div class="form-check">
    <input type="radio" id="phone" name="contact" class="form-radio">
    <label for="phone" class="form-check-label">電話</label>
  </div>
</fieldset>
```

```css
.form-check {
  display: flex;
  align-items: flex-start;
  gap: 8px;
  margin-bottom: 8px;
}

.form-checkbox,
.form-radio {
  width: 24px;
  height: 24px;
  margin: 0;
  accent-color: var(--dads-primary-500);
  cursor: pointer;
}

.form-check-label {
  font-size: 16px;
  line-height: 1.5;
  color: var(--dads-text-primary);
  cursor: pointer;
}

.form-fieldset {
  border: none;
  padding: 0;
  margin: 0 0 24px;
}

.form-legend {
  font-size: 16px;
  font-weight: 700;
  color: var(--dads-text-primary);
  margin-bottom: 12px;
}
```

## カード

```html
<article class="card">
  <img src="image.jpg" alt="" class="card-image">
  <div class="card-body">
    <h3 class="card-title">カードタイトル</h3>
    <p class="card-text">カードの説明文がここに入ります。</p>
    <a href="#" class="card-link">詳細を見る</a>
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
  padding: 24px;
}

.card-title {
  font-size: 20px;
  font-weight: 700;
  color: var(--dads-text-primary);
  margin: 0 0 12px;
}

.card-text {
  font-size: 16px;
  color: var(--dads-text-secondary);
  margin: 0 0 16px;
  line-height: 1.75;
}

.card-link {
  color: var(--dads-text-link);
  text-decoration: underline;
  font-weight: 700;
}
```

## ナビゲーション

### グローバルヘッダー

```html
<header class="header">
  <div class="container">
    <div class="header-inner">
      <a href="/" class="header-logo">
        <img src="logo.svg" alt="サイト名">
      </a>
      <nav class="header-nav" aria-label="メインメニュー">
        <ul class="nav-list">
          <li><a href="/about" class="nav-link">サービス概要</a></li>
          <li><a href="/guide" class="nav-link" aria-current="page">ご利用ガイド</a></li>
          <li><a href="/faq" class="nav-link">よくある質問</a></li>
        </ul>
      </nav>
    </div>
  </div>
</header>
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

.nav-list {
  display: flex;
  gap: 32px;
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-link {
  color: var(--dads-text-primary);
  text-decoration: none;
  font-size: 16px;
  font-weight: 500;
  padding: 8px 0;
  border-bottom: 3px solid transparent;
}

.nav-link:hover {
  color: var(--dads-primary-500);
}

.nav-link[aria-current="page"] {
  color: var(--dads-primary-500);
  border-bottom-color: var(--dads-primary-500);
}
```

### パンくずリスト

```html
<nav class="breadcrumb" aria-label="パンくずリスト">
  <ol class="breadcrumb-list">
    <li class="breadcrumb-item"><a href="/">ホーム</a></li>
    <li class="breadcrumb-item"><a href="/services">サービス一覧</a></li>
    <li class="breadcrumb-item" aria-current="page">サービス詳細</li>
  </ol>
</nav>
```

```css
.breadcrumb {
  padding: 16px 0;
  background: var(--dads-bg-secondary);
}

.breadcrumb-list {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
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
  margin-left: 8px;
  color: var(--dads-text-muted);
}

.breadcrumb-item a {
  color: var(--dads-text-link);
  text-decoration: underline;
}

.breadcrumb-item[aria-current="page"] {
  color: var(--dads-text-primary);
}
```

## 通知バナー

```html
<div class="notification notification-info" role="alert">
  <span class="notification-icon" aria-hidden="true">ℹ️</span>
  <p class="notification-text">お知らせ内容</p>
  <button class="notification-close" aria-label="通知を閉じる">&times;</button>
</div>
```

```css
.notification {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  padding: 16px;
  border-radius: 4px;
  margin-bottom: 16px;
}

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

## ステップナビゲーション

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
  </ol>
</nav>
```

```css
.step-list {
  display: flex;
  justify-content: center;
  list-style: none;
  margin: 0;
  padding: 0;
}

.step-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1;
  max-width: 200px;
  position: relative;
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
  font-weight: 700;
  color: var(--dads-text-muted);
}

.step-item.completed .step-number {
  background: var(--dads-primary-500);
  border-color: var(--dads-primary-500);
  color: var(--dads-neutral-white);
}

.step-item.current .step-number {
  border-color: var(--dads-primary-500);
  color: var(--dads-primary-500);
}

.step-label {
  font-size: 14px;
  color: var(--dads-text-muted);
  text-align: center;
  margin-top: 8px;
}

.step-item.current .step-label {
  color: var(--dads-text-primary);
  font-weight: 700;
}
```

## アコーディオン

```html
<div class="accordion">
  <div class="accordion-item">
    <h3 class="accordion-header">
      <button class="accordion-trigger"
              aria-expanded="false"
              aria-controls="panel-1">
        <span class="accordion-title">よくある質問</span>
        <span class="accordion-icon" aria-hidden="true"></span>
      </button>
    </h3>
    <div class="accordion-panel" id="panel-1" hidden>
      <div class="accordion-content">
        <p>回答内容</p>
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
  padding: 16px 24px;
  background: var(--dads-bg-primary);
  border: none;
  cursor: pointer;
  text-align: left;
}

.accordion-trigger:hover {
  background: var(--dads-bg-secondary);
}

.accordion-title {
  font-size: 16px;
  font-weight: 700;
}

.accordion-icon {
  width: 24px;
  height: 24px;
  position: relative;
}

.accordion-icon::before,
.accordion-icon::after {
  content: "";
  position: absolute;
  background: var(--dads-text-primary);
  transition: transform 0.2s;
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

.accordion-content {
  padding: 16px 24px;
  background: var(--dads-bg-secondary);
}
```

## テーブル

```html
<div class="table-wrapper">
  <table class="table">
    <caption class="table-caption">申請状況一覧</caption>
    <thead>
      <tr>
        <th scope="col">申請番号</th>
        <th scope="col">申請日</th>
        <th scope="col">状況</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>2024-001</td>
        <td>2024年1月15日</td>
        <td><span class="badge badge-success">承認済み</span></td>
      </tr>
    </tbody>
  </table>
</div>
```

```css
.table-wrapper {
  overflow-x: auto;
}

.table {
  width: 100%;
  border-collapse: collapse;
}

.table-caption {
  text-align: left;
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 16px;
}

.table th,
.table td {
  padding: 12px 16px;
  text-align: left;
  border-bottom: 1px solid var(--dads-border-light);
}

.table th {
  background: var(--dads-bg-secondary);
  font-weight: 700;
}

.table tbody tr:hover {
  background: var(--dads-bg-secondary);
}

.badge {
  display: inline-block;
  padding: 4px 8px;
  font-size: 12px;
  font-weight: 700;
  border-radius: 4px;
}

.badge-success {
  background: var(--dads-success-light);
  color: var(--dads-success-dark);
}

.badge-warning {
  background: var(--dads-warning-light);
  color: var(--dads-warning-dark);
}

.badge-error {
  background: var(--dads-error-light);
  color: var(--dads-error-dark);
}
```
