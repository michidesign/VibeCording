# Material Design コンポーネントライブラリ

Material Design 3 に基づいたUIコンポーネントの完全なリファレンス。

## ボタン

### Filled Button（プライマリ）

```html
<button class="md-filled-button">
  <span class="md-button-label">Button</span>
</button>

<!-- アイコン付き -->
<button class="md-filled-button">
  <span class="md-button-icon">
    <svg><!-- icon --></svg>
  </span>
  <span class="md-button-label">Button</span>
</button>
```

```css
.md-filled-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 40px;
  padding: 0 24px;

  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  font-weight: var(--md-sys-typescale-label-large-weight);
  letter-spacing: var(--md-sys-typescale-label-large-tracking);

  background-color: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
  border: none;
  border-radius: 20px;
  cursor: pointer;

  position: relative;
  overflow: hidden;
  transition: box-shadow 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-filled-button:hover {
  box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.15),
              0 1px 2px rgba(0, 0, 0, 0.3);
}

.md-filled-button:focus-visible {
  outline: 2px solid var(--md-sys-color-primary);
  outline-offset: 2px;
}

.md-filled-button:disabled {
  background-color: color-mix(in srgb, var(--md-sys-color-on-surface) 12%, transparent);
  color: color-mix(in srgb, var(--md-sys-color-on-surface) 38%, transparent);
  cursor: not-allowed;
}

.md-button-icon {
  width: 18px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

### Outlined Button（セカンダリ）

```html
<button class="md-outlined-button">
  <span class="md-button-label">Button</span>
</button>
```

```css
.md-outlined-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 40px;
  padding: 0 24px;

  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  font-weight: var(--md-sys-typescale-label-large-weight);
  letter-spacing: var(--md-sys-typescale-label-large-tracking);

  background-color: transparent;
  color: var(--md-sys-color-primary);
  border: 1px solid var(--md-sys-color-outline);
  border-radius: 20px;
  cursor: pointer;

  position: relative;
  overflow: hidden;
}

.md-outlined-button:hover {
  background-color: color-mix(in srgb, var(--md-sys-color-primary) 8%, transparent);
}
```

### Text Button

```html
<button class="md-text-button">
  <span class="md-button-label">Button</span>
</button>
```

```css
.md-text-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 40px;
  padding: 0 12px;

  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  font-weight: var(--md-sys-typescale-label-large-weight);
  letter-spacing: var(--md-sys-typescale-label-large-tracking);

  background-color: transparent;
  color: var(--md-sys-color-primary);
  border: none;
  border-radius: 20px;
  cursor: pointer;
}

.md-text-button:hover {
  background-color: color-mix(in srgb, var(--md-sys-color-primary) 8%, transparent);
}
```

### FAB（Floating Action Button）

```html
<button class="md-fab">
  <svg class="md-fab-icon"><!-- icon --></svg>
</button>

<!-- Extended FAB -->
<button class="md-fab md-fab-extended">
  <svg class="md-fab-icon"><!-- icon --></svg>
  <span class="md-fab-label">Create</span>
</button>
```

```css
.md-fab {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 56px;
  height: 56px;

  background-color: var(--md-sys-color-primary-container);
  color: var(--md-sys-color-on-primary-container);
  border: none;
  border-radius: 16px;
  cursor: pointer;

  box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2),
              0 6px 10px rgba(0, 0, 0, 0.14),
              0 1px 18px rgba(0, 0, 0, 0.12);

  transition: box-shadow 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-fab:hover {
  box-shadow: 0 5px 5px -3px rgba(0, 0, 0, 0.2),
              0 8px 10px 1px rgba(0, 0, 0, 0.14),
              0 3px 14px 2px rgba(0, 0, 0, 0.12);
}

.md-fab-icon {
  width: 24px;
  height: 24px;
}

.md-fab-extended {
  width: auto;
  padding: 0 16px;
  gap: 12px;
}

.md-fab-label {
  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  font-weight: var(--md-sys-typescale-label-large-weight);
}
```

## カード

### Elevated Card

```html
<article class="md-card md-card-elevated">
  <div class="md-card-media">
    <img src="image.jpg" alt="">
  </div>
  <div class="md-card-content">
    <h3 class="md-card-headline">Headline</h3>
    <p class="md-card-subhead">Subhead</p>
    <p class="md-card-text">Supporting text</p>
  </div>
  <div class="md-card-actions">
    <button class="md-text-button">Action</button>
  </div>
</article>
```

```css
.md-card {
  display: flex;
  flex-direction: column;
  border-radius: 12px;
  overflow: hidden;
}

.md-card-elevated {
  background-color: var(--md-sys-color-surface-container-low);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3),
              0 1px 3px 1px rgba(0, 0, 0, 0.15);
}

.md-card-media {
  aspect-ratio: 16 / 9;
  overflow: hidden;
}

.md-card-media img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.md-card-content {
  padding: 16px;
}

.md-card-headline {
  font-family: var(--md-sys-typescale-title-large-font);
  font-size: var(--md-sys-typescale-title-large-size);
  line-height: var(--md-sys-typescale-title-large-line-height);
  margin: 0 0 4px;
  color: var(--md-sys-color-on-surface);
}

.md-card-subhead {
  font-family: var(--md-sys-typescale-body-medium-font);
  font-size: var(--md-sys-typescale-body-medium-size);
  color: var(--md-sys-color-on-surface-variant);
  margin: 0 0 16px;
}

.md-card-text {
  font-family: var(--md-sys-typescale-body-medium-font);
  font-size: var(--md-sys-typescale-body-medium-size);
  color: var(--md-sys-color-on-surface-variant);
  margin: 0;
}

.md-card-actions {
  display: flex;
  gap: 8px;
  padding: 16px;
  padding-top: 0;
}
```

### Filled Card

```css
.md-card-filled {
  background-color: var(--md-sys-color-surface-container-highest);
}
```

### Outlined Card

```css
.md-card-outlined {
  background-color: var(--md-sys-color-surface);
  border: 1px solid var(--md-sys-color-outline-variant);
}
```

## テキストフィールド

### Filled Text Field

```html
<div class="md-text-field md-text-field-filled">
  <input type="text" id="input" placeholder=" ">
  <label for="input">Label</label>
  <div class="md-text-field-active-indicator"></div>
</div>
```

```css
.md-text-field {
  position: relative;
  display: flex;
  flex-direction: column;
}

.md-text-field-filled {
  background-color: var(--md-sys-color-surface-container-highest);
  border-radius: 4px 4px 0 0;
}

.md-text-field input {
  width: 100%;
  height: 56px;
  padding: 24px 16px 8px;

  font-family: var(--md-sys-typescale-body-large-font);
  font-size: var(--md-sys-typescale-body-large-size);

  background: transparent;
  border: none;
  caret-color: var(--md-sys-color-primary);
}

.md-text-field input:focus {
  outline: none;
}

.md-text-field label {
  position: absolute;
  left: 16px;
  top: 16px;

  font-family: var(--md-sys-typescale-body-large-font);
  font-size: var(--md-sys-typescale-body-large-size);
  color: var(--md-sys-color-on-surface-variant);

  pointer-events: none;
  transition: all 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-text-field input:focus + label,
.md-text-field input:not(:placeholder-shown) + label {
  top: 8px;
  font-size: var(--md-sys-typescale-body-small-size);
  color: var(--md-sys-color-primary);
}

.md-text-field-active-indicator {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 1px;
  background-color: var(--md-sys-color-on-surface-variant);
}

.md-text-field input:focus ~ .md-text-field-active-indicator {
  height: 2px;
  background-color: var(--md-sys-color-primary);
}
```

### Outlined Text Field

```html
<div class="md-text-field md-text-field-outlined">
  <input type="text" id="input2" placeholder=" ">
  <label for="input2">Label</label>
</div>
```

```css
.md-text-field-outlined {
  background: transparent;
}

.md-text-field-outlined input {
  padding: 16px;
  border: 1px solid var(--md-sys-color-outline);
  border-radius: 4px;
}

.md-text-field-outlined input:focus {
  border-width: 2px;
  border-color: var(--md-sys-color-primary);
  padding: 15px;
}

.md-text-field-outlined label {
  top: 50%;
  transform: translateY(-50%);
  background-color: var(--md-sys-color-surface);
  padding: 0 4px;
}

.md-text-field-outlined input:focus + label,
.md-text-field-outlined input:not(:placeholder-shown) + label {
  top: 0;
  transform: translateY(-50%);
  font-size: var(--md-sys-typescale-body-small-size);
}
```

## チップ

### Assist Chip

```html
<button class="md-chip md-chip-assist">
  <span class="md-chip-icon">
    <svg><!-- icon --></svg>
  </span>
  <span class="md-chip-label">Assist chip</span>
</button>
```

```css
.md-chip {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 32px;
  padding: 0 16px;

  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  font-weight: var(--md-sys-typescale-label-large-weight);

  border: 1px solid var(--md-sys-color-outline);
  border-radius: 8px;
  background-color: transparent;
  color: var(--md-sys-color-on-surface);
  cursor: pointer;
}

.md-chip:hover {
  background-color: color-mix(in srgb, var(--md-sys-color-on-surface) 8%, transparent);
}

.md-chip-icon {
  width: 18px;
  height: 18px;
  margin-left: -8px;
}
```

### Filter Chip

```css
.md-chip-filter {
  padding-left: 8px;
}

.md-chip-filter[aria-selected="true"] {
  background-color: var(--md-sys-color-secondary-container);
  border-color: transparent;
}

.md-chip-filter[aria-selected="true"] .md-chip-icon::before {
  content: '✓';
}
```

## ナビゲーション

### Navigation Bar（モバイル）

```html
<nav class="md-navigation-bar">
  <a href="#" class="md-nav-item active">
    <div class="md-nav-icon">
      <svg><!-- icon --></svg>
    </div>
    <span class="md-nav-label">Home</span>
  </a>
  <a href="#" class="md-nav-item">
    <div class="md-nav-icon">
      <svg><!-- icon --></svg>
    </div>
    <span class="md-nav-label">Search</span>
  </a>
</nav>
```

```css
.md-navigation-bar {
  display: flex;
  height: 80px;
  background-color: var(--md-sys-color-surface-container);
}

.md-nav-item {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 4px;

  text-decoration: none;
  color: var(--md-sys-color-on-surface-variant);
}

.md-nav-icon {
  width: 64px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 16px;
}

.md-nav-item.active .md-nav-icon {
  background-color: var(--md-sys-color-secondary-container);
}

.md-nav-item.active {
  color: var(--md-sys-color-on-surface);
}

.md-nav-label {
  font-family: var(--md-sys-typescale-label-medium-font);
  font-size: var(--md-sys-typescale-label-medium-size);
  font-weight: var(--md-sys-typescale-label-medium-weight);
}
```

### Top App Bar

```html
<header class="md-top-app-bar">
  <button class="md-icon-button" aria-label="Menu">
    <svg><!-- menu icon --></svg>
  </button>
  <h1 class="md-top-app-bar-title">Title</h1>
  <button class="md-icon-button" aria-label="Search">
    <svg><!-- search icon --></svg>
  </button>
</header>
```

```css
.md-top-app-bar {
  display: flex;
  align-items: center;
  gap: 4px;
  height: 64px;
  padding: 0 4px;
  background-color: var(--md-sys-color-surface);
}

.md-top-app-bar-title {
  flex: 1;
  margin: 0;
  padding: 0 16px;

  font-family: var(--md-sys-typescale-title-large-font);
  font-size: var(--md-sys-typescale-title-large-size);
  font-weight: var(--md-sys-typescale-title-large-weight);
  color: var(--md-sys-color-on-surface);
}

.md-icon-button {
  width: 48px;
  height: 48px;
  display: flex;
  align-items: center;
  justify-content: center;

  background: transparent;
  border: none;
  border-radius: 50%;
  cursor: pointer;
}

.md-icon-button:hover {
  background-color: color-mix(in srgb, var(--md-sys-color-on-surface) 8%, transparent);
}
```

## ダイアログ

```html
<div class="md-dialog-scrim">
  <dialog class="md-dialog" open>
    <div class="md-dialog-icon">
      <svg><!-- icon --></svg>
    </div>
    <h2 class="md-dialog-headline">Headline</h2>
    <p class="md-dialog-content">
      A dialog is a type of modal window that appears in front of app content.
    </p>
    <div class="md-dialog-actions">
      <button class="md-text-button">Cancel</button>
      <button class="md-text-button">OK</button>
    </div>
  </dialog>
</div>
```

```css
.md-dialog-scrim {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgba(0, 0, 0, 0.32);
}

.md-dialog {
  width: min(560px, calc(100% - 48px));
  padding: 24px;

  background-color: var(--md-sys-color-surface-container-high);
  border: none;
  border-radius: 28px;

  box-shadow: 0 8px 12px 6px rgba(0, 0, 0, 0.15),
              0 4px 4px rgba(0, 0, 0, 0.3);
}

.md-dialog-icon {
  display: flex;
  justify-content: center;
  margin-bottom: 16px;
  color: var(--md-sys-color-secondary);
}

.md-dialog-icon svg {
  width: 24px;
  height: 24px;
}

.md-dialog-headline {
  font-family: var(--md-sys-typescale-headline-small-font);
  font-size: var(--md-sys-typescale-headline-small-size);
  text-align: center;
  margin: 0 0 16px;
  color: var(--md-sys-color-on-surface);
}

.md-dialog-content {
  font-family: var(--md-sys-typescale-body-medium-font);
  font-size: var(--md-sys-typescale-body-medium-size);
  color: var(--md-sys-color-on-surface-variant);
  margin: 0 0 24px;
}

.md-dialog-actions {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
}
```

## リスト

```html
<ul class="md-list">
  <li class="md-list-item">
    <span class="md-list-item-leading">
      <svg><!-- icon --></svg>
    </span>
    <div class="md-list-item-content">
      <span class="md-list-item-headline">Headline</span>
      <span class="md-list-item-supporting">Supporting text</span>
    </div>
    <span class="md-list-item-trailing">100+</span>
  </li>
</ul>
```

```css
.md-list {
  list-style: none;
  margin: 0;
  padding: 8px 0;
}

.md-list-item {
  display: flex;
  align-items: center;
  gap: 16px;
  min-height: 56px;
  padding: 8px 16px;
  cursor: pointer;
}

.md-list-item:hover {
  background-color: color-mix(in srgb, var(--md-sys-color-on-surface) 8%, transparent);
}

.md-list-item-leading {
  width: 24px;
  height: 24px;
  color: var(--md-sys-color-on-surface-variant);
}

.md-list-item-content {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.md-list-item-headline {
  font-family: var(--md-sys-typescale-body-large-font);
  font-size: var(--md-sys-typescale-body-large-size);
  color: var(--md-sys-color-on-surface);
}

.md-list-item-supporting {
  font-family: var(--md-sys-typescale-body-medium-font);
  font-size: var(--md-sys-typescale-body-medium-size);
  color: var(--md-sys-color-on-surface-variant);
}

.md-list-item-trailing {
  font-family: var(--md-sys-typescale-label-small-font);
  font-size: var(--md-sys-typescale-label-small-size);
  color: var(--md-sys-color-on-surface-variant);
}
```

## スナックバー

```html
<div class="md-snackbar">
  <span class="md-snackbar-text">This is a snackbar message</span>
  <button class="md-snackbar-action">Undo</button>
</div>
```

```css
.md-snackbar {
  display: flex;
  align-items: center;
  gap: 8px;
  min-height: 48px;
  padding: 0 16px;

  background-color: var(--md-sys-color-inverse-surface);
  color: var(--md-sys-color-inverse-on-surface);
  border-radius: 4px;

  box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2),
              0 6px 10px rgba(0, 0, 0, 0.14),
              0 1px 18px rgba(0, 0, 0, 0.12);
}

.md-snackbar-text {
  flex: 1;
  font-family: var(--md-sys-typescale-body-medium-font);
  font-size: var(--md-sys-typescale-body-medium-size);
}

.md-snackbar-action {
  color: var(--md-sys-color-inverse-primary);
  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  font-weight: var(--md-sys-typescale-label-large-weight);
  background: transparent;
  border: none;
  cursor: pointer;
}
```
