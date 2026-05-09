# Atlassian コンポーネント

Atlassian Design System の再利用可能なUIコンポーネントです。

## ボタン

### Button Variants

| バリアント | 用途 |
|-----------|------|
| Primary | 主要アクション（1画面に1つ推奨） |
| Default | 標準的なアクション |
| Subtle | 控えめなアクション |
| Link | テキストリンク風 |
| Warning | 注意が必要なアクション |
| Danger | 破壊的アクション（削除等） |

### Primary Button

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
  height: 32px;
  padding: 0 12px;

  background-color: var(--color-brand-bold);
  color: var(--color-text-inverse);
  border: none;
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 1;
  white-space: nowrap;
  cursor: pointer;

  transition: background-color 100ms ease-in-out;
}

.btn-primary:hover {
  background-color: var(--color-brand-boldHovered);
}

.btn-primary:active {
  background-color: var(--color-brand-boldPressed);
}

.btn-primary:focus-visible {
  outline: 2px solid var(--color-border-focused);
  outline-offset: 2px;
}

.btn-primary:disabled {
  background-color: var(--color-background-neutral);
  color: var(--color-text-disabled);
  cursor: not-allowed;
}
```

### Default Button

```css
.btn-default {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
  height: 32px;
  padding: 0 12px;

  background-color: var(--color-background-neutral);
  color: var(--color-text);
  border: none;
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 1;
  white-space: nowrap;
  cursor: pointer;

  transition: background-color 100ms ease-in-out;
}

.btn-default:hover {
  background-color: var(--color-background-neutral-bold);
}

.btn-default:active {
  background-color: rgba(9, 30, 66, 0.14);
}
```

### Subtle Button

```css
.btn-subtle {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
  height: 32px;
  padding: 0 12px;

  background-color: transparent;
  color: var(--color-text);
  border: none;
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 1;
  white-space: nowrap;
  cursor: pointer;

  transition: background-color 100ms ease-in-out;
}

.btn-subtle:hover {
  background-color: var(--color-background-neutral);
}

.btn-subtle:active {
  background-color: var(--color-background-neutral-bold);
}
```

### Danger Button

```css
.btn-danger {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
  height: 32px;
  padding: 0 12px;

  background-color: var(--color-background-danger-bold);
  color: var(--color-text-inverse);
  border: none;
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 1;
  cursor: pointer;

  transition: background-color 100ms ease-in-out;
}

.btn-danger:hover {
  background-color: #FF5630;
}

.btn-danger:active {
  background-color: #BF2600;
}
```

### Icon Button

```css
.btn-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  padding: 0;

  background-color: transparent;
  color: var(--color-text-subtle);
  border: none;
  border-radius: 3px;
  cursor: pointer;

  transition: background-color 100ms ease-in-out;
}

.btn-icon:hover {
  background-color: var(--color-background-neutral);
  color: var(--color-text);
}

.btn-icon:active {
  background-color: var(--color-background-neutral-bold);
}
```

## フォーム要素

### Text Field

```css
.textfield {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.textfield-label {
  font-size: 12px;
  font-weight: 600;
  color: var(--color-text);
}

.textfield-input {
  height: 40px;
  padding: 8px 12px;

  background-color: var(--color-background-input);
  color: var(--color-text);
  border: 2px solid var(--color-border);
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  line-height: 1.4;

  transition: border-color 100ms ease-in-out,
              background-color 100ms ease-in-out;
}

.textfield-input:hover {
  background-color: var(--color-background-input-hovered);
}

.textfield-input:focus {
  outline: none;
  border-color: var(--color-border-focused);
  background-color: #FFFFFF;
}

.textfield-input::placeholder {
  color: var(--color-text-subtlest);
}

.textfield-input:disabled {
  background-color: var(--color-background-neutral);
  color: var(--color-text-disabled);
  cursor: not-allowed;
}

.textfield-input--error {
  border-color: var(--color-border-danger);
}

.textfield-error {
  font-size: 12px;
  color: var(--color-text-danger);
}
```

### Textarea

```css
.textarea {
  min-height: 100px;
  padding: 8px 12px;

  background-color: var(--color-background-input);
  color: var(--color-text);
  border: 2px solid var(--color-border);
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  line-height: 1.5;
  resize: vertical;

  transition: border-color 100ms ease-in-out;
}

.textarea:focus {
  outline: none;
  border-color: var(--color-border-focused);
  background-color: #FFFFFF;
}
```

### Select

```css
.select {
  height: 40px;
  padding: 8px 36px 8px 12px;

  background-color: var(--color-background-input);
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%236B778C'%3E%3Cpath d='M4 6l4 4 4-4'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 8px center;

  color: var(--color-text);
  border: 2px solid var(--color-border);
  border-radius: 3px;

  font-family: var(--font-family-sans);
  font-size: 14px;
  appearance: none;
  cursor: pointer;

  transition: border-color 100ms ease-in-out;
}

.select:focus {
  outline: none;
  border-color: var(--color-border-focused);
}
```

### Checkbox

```css
.checkbox {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
}

.checkbox-input {
  width: 14px;
  height: 14px;

  border: 2px solid var(--color-border-bold);
  border-radius: 3px;

  appearance: none;
  cursor: pointer;

  transition: background-color 100ms ease-in-out,
              border-color 100ms ease-in-out;
}

.checkbox-input:checked {
  background-color: var(--color-brand-bold);
  border-color: var(--color-brand-bold);
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='10' fill='white'%3E%3Cpath d='M3.5 6.5L1.5 4.5 0 6l3.5 3.5L10 3 8.5 1.5z'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: center;
}

.checkbox-input:focus-visible {
  outline: 2px solid var(--color-border-focused);
  outline-offset: 2px;
}

.checkbox-label {
  font-size: 14px;
  color: var(--color-text);
}
```

## カード

### Basic Card

```css
.card {
  background-color: #FFFFFF;
  border-radius: 3px;
  box-shadow: var(--shadow-raised);
  overflow: hidden;
}

.card-header {
  padding: 16px;
  border-bottom: 1px solid var(--color-border);
}

.card-title {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-text);
  margin: 0;
}

.card-body {
  padding: 16px;
}

.card-footer {
  padding: 12px 16px;
  background-color: var(--color-background-neutral-subtle);
  border-top: 1px solid var(--color-border);
}
```

### Interactive Card

```css
.card-interactive {
  background-color: #FFFFFF;
  border-radius: 3px;
  box-shadow: var(--shadow-raised);
  cursor: pointer;

  transition: box-shadow 200ms ease-in-out,
              transform 200ms ease-in-out;
}

.card-interactive:hover {
  box-shadow: var(--shadow-overlay);
  transform: translateY(-2px);
}

.card-interactive:active {
  box-shadow: var(--shadow-raised);
  transform: translateY(0);
}
```

## Badge / Lozenge

### Lozenge Variants

```css
.lozenge {
  display: inline-flex;
  align-items: center;
  height: 16px;
  padding: 0 4px;

  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
  border-radius: 3px;
}

/* Subtle variants */
.lozenge-default {
  background-color: var(--color-background-neutral);
  color: var(--color-text-subtle);
}

.lozenge-success {
  background-color: var(--color-background-success);
  color: var(--color-text-success);
}

.lozenge-removed {
  background-color: var(--color-background-danger);
  color: var(--color-text-danger);
}

.lozenge-inprogress {
  background-color: var(--color-background-information);
  color: var(--color-text-information);
}

.lozenge-new {
  background-color: #EAE6FF;
  color: #5243AA;
}

.lozenge-moved {
  background-color: var(--color-background-warning);
  color: var(--color-text-warning);
}

/* Bold variants */
.lozenge-default-bold {
  background-color: var(--color-text-subtlest);
  color: var(--color-text-inverse);
}

.lozenge-success-bold {
  background-color: var(--color-background-success-bold);
  color: var(--color-text-inverse);
}

.lozenge-removed-bold {
  background-color: var(--color-background-danger-bold);
  color: var(--color-text-inverse);
}

.lozenge-inprogress-bold {
  background-color: var(--color-brand-bold);
  color: var(--color-text-inverse);
}
```

### Badge

```css
.badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 16px;
  height: 16px;
  padding: 0 4px;

  background-color: var(--color-background-neutral-bold);
  color: var(--color-text);

  font-size: 12px;
  font-weight: 700;
  border-radius: 8px;
}

.badge-primary {
  background-color: var(--color-brand-bold);
  color: var(--color-text-inverse);
}
```

## ナビゲーション

### Top Navigation

```css
.top-nav {
  display: flex;
  align-items: center;
  height: 56px;
  padding: 0 12px;

  background-color: #FFFFFF;
  border-bottom: 1px solid var(--color-border);
}

.top-nav-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
}

.top-nav-left,
.top-nav-right {
  display: flex;
  align-items: center;
  gap: 8px;
}

.top-nav-logo {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 4px 8px;

  font-size: 14px;
  font-weight: 600;
  color: var(--color-text);
  text-decoration: none;
  border-radius: 3px;

  transition: background-color 100ms ease-in-out;
}

.top-nav-logo:hover {
  background-color: var(--color-background-neutral);
}
```

### Side Navigation

```css
.side-nav {
  width: 240px;
  height: 100%;
  padding: 12px 0;

  background-color: var(--color-background-neutral-subtle);
  border-right: 1px solid var(--color-border);
  overflow-y: auto;
}

.side-nav-section {
  margin-bottom: 8px;
}

.side-nav-title {
  padding: 8px 16px;

  font-size: 11px;
  font-weight: 700;
  color: var(--color-text-subtlest);
  text-transform: uppercase;
  letter-spacing: 0.04em;
}

.side-nav-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 8px 16px;

  font-size: 14px;
  font-weight: 400;
  color: var(--color-text);
  text-decoration: none;
  border-radius: 3px;
  margin: 0 8px;

  transition: background-color 100ms ease-in-out;
}

.side-nav-item:hover {
  background-color: var(--color-background-neutral);
}

.side-nav-item--active {
  background-color: var(--color-background-selected);
  color: var(--color-text-selected);
  font-weight: 500;
}

.side-nav-item--active:hover {
  background-color: var(--color-background-selected);
}
```

### Breadcrumbs

```css
.breadcrumbs {
  display: flex;
  align-items: center;
  gap: 4px;

  font-size: 14px;
}

.breadcrumb-item {
  color: var(--color-text-subtle);
  text-decoration: none;
}

.breadcrumb-item:hover {
  color: var(--color-text-brand);
  text-decoration: underline;
}

.breadcrumb-separator {
  color: var(--color-text-subtlest);
}

.breadcrumb-current {
  color: var(--color-text);
  font-weight: 500;
}
```

### Tabs

```css
.tabs {
  display: flex;
  border-bottom: 2px solid var(--color-border);
}

.tab {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 12px 16px;

  font-size: 14px;
  font-weight: 500;
  color: var(--color-text-subtle);
  text-decoration: none;
  border: none;
  background: none;
  cursor: pointer;
  position: relative;

  transition: color 100ms ease-in-out;
}

.tab:hover {
  color: var(--color-text);
}

.tab--active {
  color: var(--color-text-brand);
}

.tab--active::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 2px;
  background-color: var(--color-brand-bold);
}
```

## モーダル / ダイアログ

### Modal

```css
.modal-overlay {
  position: fixed;
  inset: 0;
  background-color: rgba(9, 30, 66, 0.54);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.modal {
  width: 100%;
  max-width: 480px;
  max-height: calc(100vh - 120px);

  background-color: #FFFFFF;
  border-radius: 3px;
  box-shadow: var(--shadow-overlay);
  overflow: hidden;

  animation: modalIn 200ms ease-out;
}

@keyframes modalIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.modal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px 24px;
  border-bottom: 1px solid var(--color-border);
}

.modal-title {
  font-size: 20px;
  font-weight: 500;
  color: var(--color-text);
  margin: 0;
}

.modal-body {
  padding: 24px;
  overflow-y: auto;
}

.modal-footer {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  padding: 16px 24px;
  border-top: 1px solid var(--color-border);
  background-color: var(--color-background-neutral-subtle);
}
```

## アラート / バナー

### Inline Message

```css
.inline-message {
  display: flex;
  gap: 12px;
  padding: 16px;
  border-radius: 3px;
}

.inline-message--info {
  background-color: var(--color-background-information);
}

.inline-message--success {
  background-color: var(--color-background-success);
}

.inline-message--warning {
  background-color: var(--color-background-warning);
}

.inline-message--error {
  background-color: var(--color-background-danger);
}

.inline-message-icon {
  flex-shrink: 0;
  width: 24px;
  height: 24px;
}

.inline-message--info .inline-message-icon { color: var(--color-text-information); }
.inline-message--success .inline-message-icon { color: var(--color-text-success); }
.inline-message--warning .inline-message-icon { color: var(--color-text-warning); }
.inline-message--error .inline-message-icon { color: var(--color-text-danger); }

.inline-message-content {
  flex: 1;
}

.inline-message-title {
  font-size: 14px;
  font-weight: 600;
  margin: 0 0 4px 0;
}

.inline-message--info .inline-message-title { color: var(--color-text-information); }
.inline-message--success .inline-message-title { color: var(--color-text-success); }
.inline-message--warning .inline-message-title { color: var(--color-text-warning); }
.inline-message--error .inline-message-title { color: var(--color-text-danger); }

.inline-message-text {
  font-size: 14px;
  color: var(--color-text);
  margin: 0;
}
```

## ツールチップ

```css
.tooltip {
  position: relative;
}

.tooltip-content {
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%) translateY(-8px);

  padding: 4px 8px;
  background-color: var(--color-text);
  color: var(--color-text-inverse);

  font-size: 12px;
  white-space: nowrap;
  border-radius: 3px;

  opacity: 0;
  visibility: hidden;
  transition: opacity 100ms ease-in-out,
              visibility 100ms ease-in-out;
}

.tooltip:hover .tooltip-content {
  opacity: 1;
  visibility: visible;
}

.tooltip-content::after {
  content: '';
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);

  border: 4px solid transparent;
  border-top-color: var(--color-text);
}
```

## Avatar

```css
.avatar {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  overflow: hidden;
  background-color: var(--color-background-neutral-bold);
  color: var(--color-text);
  font-weight: 500;
}

.avatar-xsmall { width: 16px; height: 16px; font-size: 10px; }
.avatar-small { width: 24px; height: 24px; font-size: 12px; }
.avatar-medium { width: 32px; height: 32px; font-size: 14px; }
.avatar-large { width: 40px; height: 40px; font-size: 16px; }
.avatar-xlarge { width: 48px; height: 48px; font-size: 18px; }

.avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.avatar-group {
  display: flex;
}

.avatar-group .avatar {
  margin-left: -8px;
  border: 2px solid #FFFFFF;
}

.avatar-group .avatar:first-child {
  margin-left: 0;
}
```

## プログレス / ローダー

### Progress Bar

```css
.progress {
  height: 8px;
  background-color: var(--color-background-neutral);
  border-radius: 4px;
  overflow: hidden;
}

.progress-bar {
  height: 100%;
  background-color: var(--color-brand-bold);
  border-radius: 4px;
  transition: width 300ms ease-in-out;
}

.progress-bar--success {
  background-color: var(--color-background-success-bold);
}

.progress-bar--warning {
  background-color: var(--color-background-warning-bold);
}

.progress-bar--danger {
  background-color: var(--color-background-danger-bold);
}
```

### Spinner

```css
.spinner {
  width: 24px;
  height: 24px;
  border: 2px solid var(--color-background-neutral);
  border-top-color: var(--color-brand-bold);
  border-radius: 50%;
  animation: spin 600ms linear infinite;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.spinner-small { width: 16px; height: 16px; border-width: 2px; }
.spinner-medium { width: 24px; height: 24px; border-width: 2px; }
.spinner-large { width: 48px; height: 48px; border-width: 3px; }
```
