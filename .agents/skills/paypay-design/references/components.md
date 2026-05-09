# PayPay コンポーネント

## ボタン

### プライマリボタン

最も重要なアクション用。PayPayレッドを使用。

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 120px;
  height: 48px;
  padding: 0 24px;
  background: var(--paypay-red);
  color: var(--color-text-inverse);
  font-family: var(--font-ja);
  font-size: 16px;
  font-weight: 600;
  border: none;
  border-radius: var(--radius-full);
  cursor: pointer;
  transition: all var(--duration-fast) var(--ease-out);
  -webkit-tap-highlight-color: transparent;
}

.btn-primary:hover {
  background: var(--paypay-red-dark);
}

.btn-primary:active {
  transform: scale(0.97);
}

.btn-primary:disabled {
  background: var(--color-gray-300);
  color: var(--color-gray-500);
  cursor: not-allowed;
}
```

```html
<button class="btn-primary">支払う</button>
<button class="btn-primary" disabled>支払う</button>
```

### セカンダリボタン

副次的なアクション用。アウトラインスタイル。

```css
.btn-secondary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 120px;
  height: 48px;
  padding: 0 24px;
  background: transparent;
  color: var(--paypay-red);
  font-family: var(--font-ja);
  font-size: 16px;
  font-weight: 600;
  border: 2px solid var(--paypay-red);
  border-radius: var(--radius-full);
  cursor: pointer;
  transition: all var(--duration-fast) var(--ease-out);
}

.btn-secondary:hover {
  background: rgba(255, 0, 51, 0.05);
}

.btn-secondary:active {
  transform: scale(0.97);
}
```

### テキストボタン

リンク的なアクション用。

```css
.btn-text {
  display: inline-flex;
  align-items: center;
  padding: 8px 12px;
  background: transparent;
  color: var(--color-info);
  font-family: var(--font-ja);
  font-size: 14px;
  font-weight: 500;
  border: none;
  cursor: pointer;
}

.btn-text:hover {
  text-decoration: underline;
}
```

### アクションボタン（円形）

ホーム画面のメインアクション用。

```css
.action-btn {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  padding: 12px;
  background: transparent;
  border: none;
  cursor: pointer;
  min-width: 72px;
}

.action-btn .action-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 56px;
  height: 56px;
  background: var(--color-gray-100);
  border-radius: 50%;
  font-size: 24px;
  transition: all var(--duration-fast) var(--ease-out);
}

.action-btn:hover .action-icon {
  background: var(--color-gray-200);
}

.action-btn--primary .action-icon {
  background: var(--paypay-red);
  color: var(--color-text-inverse);
}

.action-btn .action-label {
  font-family: var(--font-ja);
  font-size: 12px;
  font-weight: 500;
  color: var(--color-text-primary);
}
```

```html
<div class="action-buttons">
  <button class="action-btn action-btn--primary">
    <span class="action-icon">📱</span>
    <span class="action-label">支払う</span>
  </button>
  <button class="action-btn">
    <span class="action-icon">💰</span>
    <span class="action-label">チャージ</span>
  </button>
  <button class="action-btn">
    <span class="action-icon">📤</span>
    <span class="action-label">送る</span>
  </button>
  <button class="action-btn">
    <span class="action-icon">📥</span>
    <span class="action-label">受け取る</span>
  </button>
</div>
```

## カード

### 基本カード

```css
.card {
  background: var(--color-background-card);
  border-radius: var(--radius-lg);
  padding: var(--spacing-md);
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--duration-normal) var(--ease-out);
}

.card:hover {
  box-shadow: var(--shadow-md);
}

.card-title {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-text-primary);
  margin-bottom: var(--spacing-sm);
}

.card-description {
  font-size: 14px;
  color: var(--color-text-secondary);
  line-height: 1.5;
}
```

### 残高カード

```css
.balance-card {
  background: var(--color-background-card);
  border-radius: var(--radius-xl);
  padding: var(--spacing-lg);
  box-shadow: var(--shadow-md);
}

.balance-card .balance-label {
  font-size: 12px;
  font-weight: 500;
  color: var(--color-text-secondary);
  margin-bottom: var(--spacing-xs);
}

.balance-card .balance-amount {
  font-family: var(--font-number);
  font-size: 36px;
  font-weight: 700;
  color: var(--color-text-primary);
  letter-spacing: -1px;
}

.balance-card .balance-amount .currency {
  font-size: 22px;
  font-weight: 500;
  margin-right: 2px;
}
```

```html
<div class="balance-card">
  <span class="balance-label">PayPay残高</span>
  <div class="balance-amount">
    <span class="currency">¥</span>12,345
  </div>
</div>
```

### 履歴カード

```css
.history-card {
  display: flex;
  align-items: center;
  gap: var(--spacing-md);
  padding: var(--spacing-md);
  background: var(--color-background-card);
  border-bottom: 1px solid var(--color-gray-200);
}

.history-card .history-icon {
  width: 44px;
  height: 44px;
  border-radius: var(--radius-md);
  background: var(--color-gray-100);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
}

.history-card .history-content {
  flex: 1;
}

.history-card .history-title {
  font-size: 14px;
  font-weight: 500;
  color: var(--color-text-primary);
  margin-bottom: 2px;
}

.history-card .history-date {
  font-size: 12px;
  color: var(--color-text-tertiary);
}

.history-card .history-amount {
  font-family: var(--font-number);
  font-size: 16px;
  font-weight: 600;
  text-align: right;
}

.history-card .history-amount--positive {
  color: var(--color-success);
}

.history-card .history-amount--negative {
  color: var(--color-text-primary);
}
```

```html
<div class="history-card">
  <div class="history-icon">🏪</div>
  <div class="history-content">
    <div class="history-title">セブンイレブン 渋谷店</div>
    <div class="history-date">12月25日 14:32</div>
  </div>
  <div class="history-amount history-amount--negative">-¥580</div>
</div>
```

### キャンペーンバナー

```css
.campaign-banner {
  position: relative;
  background: linear-gradient(135deg, var(--paypay-red) 0%, var(--paypay-red-light) 100%);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
  color: var(--color-text-inverse);
  overflow: hidden;
}

.campaign-banner .campaign-badge {
  display: inline-block;
  padding: 4px 8px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: var(--radius-sm);
  font-size: 10px;
  font-weight: 600;
  margin-bottom: var(--spacing-sm);
}

.campaign-banner .campaign-title {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: var(--spacing-xs);
}

.campaign-banner .campaign-description {
  font-size: 14px;
  opacity: 0.9;
}

.campaign-banner .campaign-percentage {
  position: absolute;
  right: var(--spacing-lg);
  bottom: var(--spacing-md);
  font-family: var(--font-number);
  font-size: 48px;
  font-weight: 700;
  opacity: 0.3;
}
```

```html
<div class="campaign-banner">
  <span class="campaign-badge">開催中</span>
  <h3 class="campaign-title">最大20%還元キャンペーン</h3>
  <p class="campaign-description">対象店舗でのお支払いがお得に</p>
  <span class="campaign-percentage">20%</span>
</div>
```

## ボトムナビゲーション

```css
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-around;
  align-items: center;
  height: 56px;
  background: var(--color-background);
  border-top: 1px solid var(--color-gray-200);
  padding-bottom: env(safe-area-inset-bottom);
}

.nav-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 2px;
  padding: 8px 16px;
  text-decoration: none;
  transition: color var(--duration-fast) var(--ease-out);
}

.nav-item .nav-icon {
  font-size: 24px;
  color: var(--color-gray-500);
  transition: color var(--duration-fast) var(--ease-out);
}

.nav-item .nav-label {
  font-size: 10px;
  font-weight: 500;
  color: var(--color-gray-500);
}

.nav-item--active .nav-icon,
.nav-item--active .nav-label {
  color: var(--paypay-red);
}
```

```html
<nav class="bottom-nav">
  <a href="#" class="nav-item nav-item--active">
    <span class="nav-icon">🏠</span>
    <span class="nav-label">ホーム</span>
  </a>
  <a href="#" class="nav-item">
    <span class="nav-icon">💳</span>
    <span class="nav-label">支払い</span>
  </a>
  <a href="#" class="nav-item">
    <span class="nav-icon">🔍</span>
    <span class="nav-label">探す</span>
  </a>
  <a href="#" class="nav-item">
    <span class="nav-icon">👤</span>
    <span class="nav-label">アカウント</span>
  </a>
</nav>
```

## ヘッダー

```css
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 56px;
  padding: 0 var(--spacing-md);
  background: var(--color-background);
  border-bottom: 1px solid var(--color-gray-200);
  padding-top: env(safe-area-inset-top);
  z-index: 100;
}

.header-back {
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  border: none;
  cursor: pointer;
}

.header-title {
  font-size: 17px;
  font-weight: 600;
  color: var(--color-text-primary);
}

.header-action {
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

## フォーム要素

### テキスト入力

```css
.input-field {
  width: 100%;
  height: 48px;
  padding: 0 var(--spacing-md);
  background: var(--color-gray-100);
  border: 2px solid transparent;
  border-radius: var(--radius-md);
  font-family: var(--font-ja);
  font-size: 16px;
  color: var(--color-text-primary);
  transition: all var(--duration-fast) var(--ease-out);
}

.input-field:focus {
  outline: none;
  background: var(--color-background);
  border-color: var(--paypay-red);
}

.input-field::placeholder {
  color: var(--color-text-tertiary);
}
```

### 金額入力

```css
.amount-input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.amount-input {
  width: 100%;
  padding: var(--spacing-md);
  padding-left: 32px;
  background: var(--color-gray-100);
  border: 2px solid transparent;
  border-radius: var(--radius-md);
  font-family: var(--font-number);
  font-size: 28px;
  font-weight: 700;
  text-align: right;
  color: var(--color-text-primary);
}

.amount-input-wrapper .currency-symbol {
  position: absolute;
  left: var(--spacing-md);
  font-family: var(--font-number);
  font-size: 20px;
  font-weight: 500;
  color: var(--color-text-secondary);
}
```

### チェックボックス

```css
.checkbox-wrapper {
  display: flex;
  align-items: center;
  gap: var(--spacing-sm);
  cursor: pointer;
}

.checkbox {
  width: 22px;
  height: 22px;
  border: 2px solid var(--color-gray-400);
  border-radius: 6px;
  appearance: none;
  cursor: pointer;
  transition: all var(--duration-fast) var(--ease-out);
}

.checkbox:checked {
  background: var(--paypay-red);
  border-color: var(--paypay-red);
  background-image: url("data:image/svg+xml,..."); /* チェックマーク */
  background-repeat: no-repeat;
  background-position: center;
}

.checkbox-label {
  font-size: 14px;
  color: var(--color-text-primary);
}
```

## モーダル・オーバーレイ

```css
.modal-overlay {
  position: fixed;
  inset: 0;
  background: var(--color-background-overlay);
  display: flex;
  align-items: flex-end;
  justify-content: center;
  z-index: 1000;
}

.modal {
  width: 100%;
  max-width: 500px;
  background: var(--color-background);
  border-radius: var(--radius-xl) var(--radius-xl) 0 0;
  padding: var(--spacing-lg);
  padding-bottom: calc(var(--spacing-lg) + env(safe-area-inset-bottom));
}

.modal-handle {
  width: 36px;
  height: 4px;
  background: var(--color-gray-300);
  border-radius: 2px;
  margin: 0 auto var(--spacing-md);
}

.modal-title {
  font-size: 18px;
  font-weight: 600;
  text-align: center;
  margin-bottom: var(--spacing-lg);
}
```

## バッジ・タグ

```css
.badge {
  display: inline-flex;
  align-items: center;
  padding: 4px 8px;
  border-radius: var(--radius-sm);
  font-size: 10px;
  font-weight: 600;
}

.badge--primary {
  background: var(--paypay-red);
  color: var(--color-text-inverse);
}

.badge--success {
  background: rgba(0, 200, 83, 0.1);
  color: var(--color-success);
}

.badge--warning {
  background: rgba(255, 179, 0, 0.1);
  color: var(--color-warning);
}

.badge--info {
  background: rgba(0, 122, 255, 0.1);
  color: var(--color-info);
}
```

## 通知バッジ

```css
.notification-badge {
  position: absolute;
  top: -4px;
  right: -4px;
  min-width: 18px;
  height: 18px;
  padding: 0 5px;
  background: var(--paypay-red);
  color: var(--color-text-inverse);
  font-family: var(--font-number);
  font-size: 11px;
  font-weight: 700;
  border-radius: var(--radius-full);
  display: flex;
  align-items: center;
  justify-content: center;
}
```

## ローディング

```css
.loading-spinner {
  width: 32px;
  height: 32px;
  border: 3px solid var(--color-gray-200);
  border-top-color: var(--paypay-red);
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.loading-skeleton {
  background: linear-gradient(
    90deg,
    var(--color-gray-100) 25%,
    var(--color-gray-200) 50%,
    var(--color-gray-100) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
  border-radius: var(--radius-sm);
}

@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```
