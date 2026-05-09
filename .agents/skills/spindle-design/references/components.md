# Spindle コンポーネント

Spindle のコンポーネントは、再利用可能な UI の構成要素です。各コンポーネントは一貫性のあるスタイルとインタラクションを持ち、直感的な操作を実現します。

## ボタン（Button）

### プライマリボタン

```html
<button class="btn btn-primary">ボタン</button>
<button class="btn btn-primary" disabled>無効</button>
```

```css
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 12px 24px;
  font-weight: bold;
  font-size: 0.875rem;
  line-height: 1.3;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 150ms ease-out, box-shadow 150ms ease-out;
}

.btn:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-primary {
  background-color: var(--color-primary-70);
  color: #ffffff;
}

.btn-primary:hover:not(:disabled) {
  background-color: var(--color-primary-80);
}

.btn-primary:active:not(:disabled) {
  background-color: var(--color-primary-80);
}
```

### セカンダリボタン

```html
<button class="btn btn-secondary">ボタン</button>
```

```css
.btn-secondary {
  background-color: transparent;
  color: var(--color-primary-70);
  border: 1px solid var(--color-primary-70);
}

.btn-secondary:hover:not(:disabled) {
  background-color: rgba(41, 135, 55, 0.08);
}
```

### テキストボタン

```html
<button class="btn btn-text">ボタン</button>
```

```css
.btn-text {
  background-color: transparent;
  color: var(--color-primary-70);
  padding: 12px 16px;
}

.btn-text:hover:not(:disabled) {
  background-color: rgba(41, 135, 55, 0.08);
}
```

### ボタンサイズ

```css
.btn-sm {
  padding: 8px 16px;
  font-size: 0.75rem;
}

.btn-lg {
  padding: 16px 32px;
  font-size: 1rem;
}
```

## チェックボックス（Checkbox）

```html
<label class="checkbox">
  <input type="checkbox" class="checkbox-input">
  <span class="checkbox-box"></span>
  <span class="checkbox-label">チェックボックス</span>
</label>
```

```css
.checkbox {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
}

.checkbox-input {
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

.checkbox-box {
  position: relative;
  width: 20px;
  height: 20px;
  border: 2px solid var(--color-gray-50);
  border-radius: 4px;
  background-color: var(--color-background-primary);
  transition: border-color 150ms ease-out, background-color 150ms ease-out;
}

.checkbox-input:checked + .checkbox-box {
  border-color: var(--color-primary-70);
  background-color: var(--color-primary-70);
}

.checkbox-input:checked + .checkbox-box::after {
  content: '';
  position: absolute;
  left: 5px;
  top: 1px;
  width: 6px;
  height: 10px;
  border: solid #ffffff;
  border-width: 0 2px 2px 0;
  transform: rotate(45deg);
}

.checkbox-input:focus-visible + .checkbox-box {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}

.checkbox-label {
  font-size: 0.875rem;
  color: var(--color-text-primary);
}
```

## テキストフィールド（TextField）

```html
<div class="text-field">
  <label class="text-field-label" for="input1">ラベル</label>
  <input type="text" id="input1" class="text-field-input" placeholder="プレースホルダー">
  <span class="text-field-helper">ヘルパーテキスト</span>
</div>
```

```css
.text-field {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.text-field-label {
  font-size: 0.875rem;
  font-weight: bold;
  color: var(--color-text-primary);
}

.text-field-input {
  padding: 12px 16px;
  font-size: 1rem;
  line-height: 1.5;
  color: var(--color-text-primary);
  background-color: var(--color-background-primary);
  border: 1px solid var(--color-border-primary);
  border-radius: 8px;
  transition: border-color 150ms ease-out, box-shadow 150ms ease-out;
}

.text-field-input::placeholder {
  color: var(--color-text-tertiary);
}

.text-field-input:hover {
  border-color: var(--color-gray-60);
}

.text-field-input:focus {
  border-color: var(--color-focus);
  box-shadow: 0 0 0 3px rgba(0, 145, 255, 0.2);
  outline: none;
}

.text-field-input:disabled {
  background-color: var(--color-background-secondary);
  color: var(--color-text-disabled);
  cursor: not-allowed;
}

.text-field-helper {
  font-size: 0.75rem;
  color: var(--color-text-tertiary);
}

/* エラー状態 */
.text-field.is-error .text-field-input {
  border-color: var(--color-caution);
}

.text-field.is-error .text-field-helper {
  color: var(--color-caution);
}
```

## モーダル（Modal）

```html
<div class="modal-overlay">
  <div class="modal" role="dialog" aria-labelledby="modal-title" aria-modal="true">
    <div class="modal-header">
      <h2 id="modal-title" class="modal-title">モーダルタイトル</h2>
      <button class="modal-close" aria-label="閉じる">
        <svg>...</svg>
      </button>
    </div>
    <div class="modal-body">
      <p>モーダルの内容がここに入ります。</p>
    </div>
    <div class="modal-footer">
      <button class="btn btn-secondary">キャンセル</button>
      <button class="btn btn-primary">確認</button>
    </div>
  </div>
</div>
```

```css
.modal-overlay {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 16px;
  background-color: rgba(8, 18, 26, 0.5);
  z-index: 1000;
}

.modal {
  width: 100%;
  max-width: 480px;
  max-height: calc(100vh - 32px);
  background-color: var(--color-background-primary);
  border-radius: 12px;
  box-shadow: 0 8px 32px rgba(8, 18, 26, 0.16);
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.modal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 24px;
  border-bottom: 1px solid var(--color-border-secondary);
}

.modal-title {
  font-size: 1.125rem;
  font-weight: bold;
  color: var(--color-text-primary);
  margin: 0;
}

.modal-close {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  padding: 0;
  background: transparent;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  color: var(--color-text-secondary);
  transition: background-color 150ms ease-out;
}

.modal-close:hover {
  background-color: var(--color-background-secondary);
}

.modal-close:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}

.modal-body {
  padding: 24px;
  overflow-y: auto;
}

.modal-footer {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
  padding: 16px 24px;
  border-top: 1px solid var(--color-border-secondary);
}
```

## リスト（List）

```html
<ul class="list">
  <li class="list-item">
    <span class="list-item-content">リストアイテム 1</span>
  </li>
  <li class="list-item">
    <span class="list-item-content">リストアイテム 2</span>
  </li>
  <li class="list-item">
    <span class="list-item-content">リストアイテム 3</span>
  </li>
</ul>
```

```css
.list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.list-item {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  border-bottom: 1px solid var(--color-border-secondary);
  transition: background-color 150ms ease-out;
}

.list-item:last-child {
  border-bottom: none;
}

.list-item:hover {
  background-color: var(--color-background-secondary);
}

.list-item-content {
  flex: 1;
  font-size: 0.875rem;
  color: var(--color-text-primary);
}
```

### インタラクティブリスト

```html
<ul class="list">
  <li class="list-item list-item-interactive">
    <a href="#" class="list-item-link">
      <span class="list-item-content">リンクアイテム</span>
      <svg class="list-item-arrow">...</svg>
    </a>
  </li>
</ul>
```

```css
.list-item-interactive {
  padding: 0;
}

.list-item-link {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  text-decoration: none;
  color: inherit;
  width: 100%;
}

.list-item-link:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: -2px;
}

.list-item-arrow {
  width: 20px;
  height: 20px;
  color: var(--color-text-tertiary);
}
```

## カード（Card）

```html
<div class="card">
  <div class="card-image">
    <img src="image.jpg" alt="カード画像">
  </div>
  <div class="card-content">
    <h3 class="card-title">カードタイトル</h3>
    <p class="card-description">カードの説明文がここに入ります。</p>
  </div>
  <div class="card-footer">
    <button class="btn btn-primary btn-sm">詳細を見る</button>
  </div>
</div>
```

```css
.card {
  display: flex;
  flex-direction: column;
  background-color: var(--color-background-primary);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(8, 18, 26, 0.08);
  transition: box-shadow 350ms ease-out;
}

.card:hover {
  box-shadow: 0 4px 16px rgba(8, 18, 26, 0.12);
}

.card-image {
  aspect-ratio: 16 / 9;
  overflow: hidden;
}

.card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.card-content {
  padding: 16px;
  flex: 1;
}

.card-title {
  font-size: 1rem;
  font-weight: bold;
  color: var(--color-text-primary);
  margin: 0 0 8px;
}

.card-description {
  font-size: 0.875rem;
  line-height: 1.6;
  color: var(--color-text-secondary);
  margin: 0;
}

.card-footer {
  padding: 16px;
  padding-top: 0;
}
```

## ステータス（Status）

```html
<span class="status status-success">成功</span>
<span class="status status-warning">警告</span>
<span class="status status-error">エラー</span>
<span class="status status-info">情報</span>
```

```css
.status {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 4px 8px;
  font-size: 0.75rem;
  font-weight: bold;
  border-radius: 4px;
}

.status-success {
  color: var(--color-success);
  background-color: rgba(41, 135, 55, 0.1);
}

.status-warning {
  color: var(--color-warning);
  background-color: rgba(230, 119, 0, 0.1);
}

.status-error {
  color: var(--color-caution);
  background-color: rgba(217, 28, 11, 0.1);
}

.status-info {
  color: var(--color-info);
  background-color: rgba(0, 145, 255, 0.1);
}
```

## ナビゲーション（Navigation）

### グローバルナビゲーション

```html
<header class="header">
  <nav class="nav-global">
    <a href="/" class="nav-logo">Ameba</a>
    <ul class="nav-menu">
      <li><a href="#" class="nav-link">ブログ</a></li>
      <li><a href="#" class="nav-link">マンガ</a></li>
      <li><a href="#" class="nav-link">ニュース</a></li>
    </ul>
    <div class="nav-actions">
      <button class="btn btn-primary btn-sm">ログイン</button>
    </div>
  </nav>
</header>
```

```css
.header {
  position: sticky;
  top: 0;
  background-color: var(--color-background-primary);
  border-bottom: 1px solid var(--color-border-secondary);
  z-index: 100;
}

.nav-global {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 24px;
  max-width: 1200px;
  margin: 0 auto;
}

.nav-logo {
  font-size: 1.25rem;
  font-weight: bold;
  color: var(--color-primary-70);
  text-decoration: none;
}

.nav-menu {
  display: flex;
  align-items: center;
  gap: 24px;
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-link {
  font-size: 0.875rem;
  color: var(--color-text-primary);
  text-decoration: none;
  padding: 8px 0;
  position: relative;
}

.nav-link:hover {
  color: var(--color-primary-70);
}

.nav-link::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: var(--color-primary-70);
  transform: scaleX(0);
  transition: transform 150ms ease-out;
}

.nav-link:hover::after,
.nav-link.is-active::after {
  transform: scaleX(1);
}
```
