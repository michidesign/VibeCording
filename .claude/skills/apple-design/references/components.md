# Apple コンポーネントライブラリ

Apple デザインに基づいたUIコンポーネントの完全なリファレンス。

## ボタン

### プライマリボタン

```html
<button class="btn-primary">購入する</button>
<a href="#" class="btn-primary">詳しく見る</a>
```

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 12px 24px;
  min-width: 140px;

  background: var(--color-blue);
  color: #fff;

  font-family: var(--font-text);
  font-size: 17px;
  font-weight: 400;
  text-decoration: none;
  white-space: nowrap;

  border: none;
  border-radius: 980px;
  cursor: pointer;

  transition: background 0.3s var(--ease-out);
}

.btn-primary:hover {
  background: var(--color-blue-hover);
}

.btn-primary:active {
  transform: scale(0.98);
}

.btn-primary:disabled {
  background: var(--color-label-tertiary);
  cursor: not-allowed;
}

/* サイズバリエーション */
.btn-primary.btn-sm {
  padding: 8px 16px;
  font-size: 14px;
  min-width: 100px;
}

.btn-primary.btn-lg {
  padding: 16px 32px;
  font-size: 19px;
  min-width: 180px;
}
```

### セカンダリボタン

```html
<button class="btn-secondary">キャンセル</button>
```

```css
.btn-secondary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 12px 24px;
  min-width: 140px;

  background: transparent;
  color: var(--color-blue);

  font-family: var(--font-text);
  font-size: 17px;
  font-weight: 400;
  text-decoration: none;

  border: 1px solid var(--color-blue);
  border-radius: 980px;
  cursor: pointer;

  transition: all 0.3s var(--ease-out);
}

.btn-secondary:hover {
  background: var(--color-blue);
  color: #fff;
}
```

### テキストリンク

```html
<a href="#" class="link">詳しく見る ›</a>
<a href="#" class="link-arrow">すべて見る</a>
```

```css
.link {
  color: var(--color-blue);
  font-size: 17px;
  text-decoration: none;
  transition: color 0.2s var(--ease-out);
}

.link:hover {
  text-decoration: underline;
}

.link-arrow {
  color: var(--color-blue);
  font-size: 17px;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 4px;
}

.link-arrow::after {
  content: '›';
  font-size: 1.2em;
  transition: transform 0.2s var(--ease-out);
}

.link-arrow:hover::after {
  transform: translateX(4px);
}
```

### アイコンボタン

```html
<button class="btn-icon" aria-label="閉じる">
  <svg><!-- アイコン --></svg>
</button>
```

```css
.btn-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;

  background: transparent;
  color: var(--color-label);

  border: none;
  border-radius: 50%;
  cursor: pointer;

  transition: background 0.2s var(--ease-out);
}

.btn-icon:hover {
  background: var(--color-background-tertiary);
}

.btn-icon svg {
  width: 20px;
  height: 20px;
}
```

## ナビゲーション

### グローバルナビゲーション

```html
<nav class="nav-global">
  <div class="nav-container">
    <a href="/" class="nav-logo">
      <svg><!-- ロゴ --></svg>
    </a>

    <ul class="nav-menu">
      <li><a href="#">製品</a></li>
      <li><a href="#">機能</a></li>
      <li><a href="#">価格</a></li>
      <li><a href="#">サポート</a></li>
    </ul>

    <div class="nav-actions">
      <button class="nav-search" aria-label="検索">
        <svg><!-- 検索アイコン --></svg>
      </button>
      <a href="#" class="btn-primary btn-sm">購入</a>
    </div>

    <button class="nav-toggle" aria-label="メニュー">
      <span></span>
    </button>
  </div>
</nav>
```

```css
.nav-global {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 48px;
  z-index: 9999;

  background: rgba(251, 251, 253, 0.8);
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
}

@media (prefers-color-scheme: dark) {
  .nav-global {
    background: rgba(29, 29, 31, 0.8);
  }
}

.nav-container {
  max-width: 1024px;
  height: 100%;
  margin: 0 auto;
  padding: 0 22px;

  display: flex;
  align-items: center;
  justify-content: space-between;
}

.nav-logo {
  display: flex;
  align-items: center;
}

.nav-logo svg {
  width: 20px;
  height: 20px;
}

.nav-menu {
  display: flex;
  gap: 32px;
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-menu a {
  color: var(--color-label);
  font-size: 14px;
  font-weight: 400;
  text-decoration: none;
  opacity: 0.8;
  transition: opacity 0.3s var(--ease-out);
}

.nav-menu a:hover {
  opacity: 1;
}

.nav-actions {
  display: flex;
  align-items: center;
  gap: 16px;
}

.nav-toggle {
  display: none;
}

@media (max-width: 734px) {
  .nav-menu,
  .nav-actions {
    display: none;
  }

  .nav-toggle {
    display: block;
  }
}
```

## カード

### 製品カード

```html
<article class="card-product">
  <div class="card-image">
    <img src="product.jpg" alt="製品名">
  </div>
  <div class="card-content">
    <span class="card-eyebrow">新登場</span>
    <h3 class="card-title">製品名</h3>
    <p class="card-description">
      製品の簡単な説明文がここに入ります。
    </p>
    <div class="card-actions">
      <a href="#" class="link-arrow">詳しく見る</a>
      <a href="#" class="link">購入 ›</a>
    </div>
  </div>
</article>
```

```css
.card-product {
  background: var(--color-background);
  border-radius: 18px;
  overflow: hidden;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);

  transition: transform 0.4s var(--ease-out),
              box-shadow 0.4s var(--ease-out);
}

.card-product:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.12);
}

.card-image {
  aspect-ratio: 4 / 3;
  overflow: hidden;
}

.card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s var(--ease-out);
}

.card-product:hover .card-image img {
  transform: scale(1.05);
}

.card-content {
  padding: 24px;
}

.card-eyebrow {
  display: block;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: var(--color-orange);
  margin-bottom: 8px;
}

.card-title {
  font-size: 24px;
  font-weight: 600;
  margin: 0 0 8px;
}

.card-description {
  font-size: 14px;
  color: var(--color-label-secondary);
  margin: 0 0 16px;
}

.card-actions {
  display: flex;
  gap: 16px;
}
```

### フィーチャーカード

```html
<div class="card-feature">
  <div class="card-icon">
    <svg><!-- アイコン --></svg>
  </div>
  <h3 class="card-title">機能タイトル</h3>
  <p class="card-description">
    機能の説明文がここに入ります。簡潔で分かりやすく。
  </p>
</div>
```

```css
.card-feature {
  background: var(--color-background-secondary);
  border-radius: 18px;
  padding: 32px;
  text-align: center;

  transition: transform 0.3s var(--ease-out);
}

.card-feature:hover {
  transform: translateY(-4px);
}

.card-icon {
  width: 56px;
  height: 56px;
  margin: 0 auto 16px;

  display: flex;
  align-items: center;
  justify-content: center;

  background: linear-gradient(135deg, var(--color-blue), var(--color-purple));
  border-radius: 16px;
}

.card-icon svg {
  width: 28px;
  height: 28px;
  color: #fff;
}

.card-feature .card-title {
  font-size: 21px;
  font-weight: 600;
  margin: 0 0 8px;
}

.card-feature .card-description {
  font-size: 14px;
  color: var(--color-label-secondary);
  margin: 0;
  line-height: 1.5;
}
```

## フォーム

### テキスト入力

```html
<div class="form-field">
  <label for="email">メールアドレス</label>
  <input type="email" id="email" placeholder="example@email.com">
</div>
```

```css
.form-field {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-field label {
  font-size: 14px;
  font-weight: 500;
  color: var(--color-label);
}

.form-field input {
  padding: 12px 16px;

  font-family: var(--font-text);
  font-size: 17px;
  color: var(--color-label);

  background: var(--color-background-tertiary);
  border: 1px solid transparent;
  border-radius: 12px;

  transition: border-color 0.2s var(--ease-out),
              box-shadow 0.2s var(--ease-out);
}

.form-field input::placeholder {
  color: var(--color-label-tertiary);
}

.form-field input:focus {
  outline: none;
  border-color: var(--color-blue);
  box-shadow: 0 0 0 3px rgba(0, 113, 227, 0.2);
}

.form-field input:invalid:not(:placeholder-shown) {
  border-color: var(--color-red);
}
```

### セレクト

```html
<div class="form-field">
  <label for="country">国・地域</label>
  <div class="select-wrapper">
    <select id="country">
      <option>日本</option>
      <option>アメリカ</option>
    </select>
  </div>
</div>
```

```css
.select-wrapper {
  position: relative;
}

.select-wrapper select {
  width: 100%;
  padding: 12px 40px 12px 16px;

  font-family: var(--font-text);
  font-size: 17px;
  color: var(--color-label);

  background: var(--color-background-tertiary);
  border: 1px solid transparent;
  border-radius: 12px;

  appearance: none;
  cursor: pointer;

  transition: border-color 0.2s var(--ease-out);
}

.select-wrapper::after {
  content: '';
  position: absolute;
  right: 16px;
  top: 50%;
  transform: translateY(-50%);

  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 6px solid var(--color-label-secondary);

  pointer-events: none;
}

.select-wrapper select:focus {
  outline: none;
  border-color: var(--color-blue);
}
```

## モーダル

```html
<div class="modal-overlay" role="dialog" aria-modal="true">
  <div class="modal">
    <button class="modal-close" aria-label="閉じる">
      <svg><!-- × アイコン --></svg>
    </button>
    <div class="modal-content">
      <h2>モーダルタイトル</h2>
      <p>モーダルの内容がここに入ります。</p>
    </div>
    <div class="modal-actions">
      <button class="btn-secondary">キャンセル</button>
      <button class="btn-primary">確認</button>
    </div>
  </div>
</div>
```

```css
.modal-overlay {
  position: fixed;
  inset: 0;
  z-index: 10000;

  display: flex;
  align-items: center;
  justify-content: center;
  padding: 24px;

  background: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(10px);

  animation: fade-in 0.2s var(--ease-out);
}

.modal {
  position: relative;
  width: 100%;
  max-width: 480px;

  background: var(--color-background);
  border-radius: 18px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);

  animation: scale-in 0.3s var(--ease-out);
}

.modal-close {
  position: absolute;
  top: 16px;
  right: 16px;

  width: 32px;
  height: 32px;

  display: flex;
  align-items: center;
  justify-content: center;

  background: var(--color-background-tertiary);
  border: none;
  border-radius: 50%;
  cursor: pointer;

  transition: background 0.2s var(--ease-out);
}

.modal-close:hover {
  background: var(--color-label-tertiary);
}

.modal-content {
  padding: 32px;
}

.modal-content h2 {
  font-size: 24px;
  font-weight: 600;
  margin: 0 0 16px;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
  padding: 16px 32px 32px;
}

@keyframes fade-in {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes scale-in {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
```

## タブ

```html
<div class="tabs">
  <div class="tab-list" role="tablist">
    <button class="tab active" role="tab" aria-selected="true">概要</button>
    <button class="tab" role="tab" aria-selected="false">仕様</button>
    <button class="tab" role="tab" aria-selected="false">レビュー</button>
  </div>
  <div class="tab-panels">
    <div class="tab-panel active" role="tabpanel">
      概要の内容
    </div>
  </div>
</div>
```

```css
.tab-list {
  display: flex;
  gap: 8px;
  padding: 4px;

  background: var(--color-background-secondary);
  border-radius: 12px;
}

.tab {
  flex: 1;
  padding: 10px 20px;

  font-family: var(--font-text);
  font-size: 14px;
  font-weight: 500;
  color: var(--color-label-secondary);

  background: transparent;
  border: none;
  border-radius: 8px;
  cursor: pointer;

  transition: all 0.2s var(--ease-out);
}

.tab:hover {
  color: var(--color-label);
}

.tab.active {
  background: var(--color-background);
  color: var(--color-label);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.tab-panel {
  display: none;
  padding: 24px 0;
}

.tab-panel.active {
  display: block;
  animation: fade-in 0.3s var(--ease-out);
}
```

## バッジ・タグ

```html
<span class="badge">新機能</span>
<span class="badge badge-success">完了</span>
<span class="badge badge-warning">保留中</span>
```

```css
.badge {
  display: inline-flex;
  align-items: center;
  padding: 4px 10px;

  font-size: 12px;
  font-weight: 500;

  background: var(--color-background-tertiary);
  color: var(--color-label);
  border-radius: 980px;
}

.badge-success {
  background: rgba(52, 199, 89, 0.15);
  color: var(--color-green);
}

.badge-warning {
  background: rgba(255, 149, 0, 0.15);
  color: var(--color-orange);
}

.badge-error {
  background: rgba(255, 59, 48, 0.15);
  color: var(--color-red);
}
```
