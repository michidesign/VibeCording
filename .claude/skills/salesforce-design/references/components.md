# Salesforce Lightning Design System コンポーネント

Lightning Design System 2 (SLDS 2) に基づいたUIコンポーネントの完全なリファレンス。

## ボタン

### Brand Button（プライマリ）

```html
<button class="slds-button slds-button--brand">
  <span class="slds-button__label">Primary Action</span>
</button>

<!-- アイコン付き -->
<button class="slds-button slds-button--brand">
  <svg class="slds-button__icon slds-button__icon--left"><!-- icon --></svg>
  <span class="slds-button__label">Create New</span>
</button>
```

```css
.slds-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  height: 2.5rem;
  padding: 0 1rem;

  font-family: var(--slds-font-family);
  font-size: 0.8125rem;
  font-weight: 600;
  line-height: 1;

  border: none;
  border-radius: 0.25rem;
  cursor: pointer;
  transition: all 0.15s ease;
}

.slds-button--brand {
  background-color: var(--slds-color-brand);
  color: #FFFFFF;
}

.slds-button--brand:hover {
  background-color: var(--slds-color-brand-hover);
}

.slds-button--brand:active {
  background-color: var(--slds-color-brand-active);
}

.slds-button--brand:focus-visible {
  outline: 2px solid var(--slds-color-brand);
  outline-offset: 2px;
}

.slds-button--brand:disabled {
  background-color: var(--slds-color-gray-300);
  color: var(--slds-color-gray-500);
  cursor: not-allowed;
}

.slds-button__icon {
  width: 1rem;
  height: 1rem;
  fill: currentColor;
}
```

### Outline Button（セカンダリ）

```html
<button class="slds-button slds-button--outline">
  <span class="slds-button__label">Secondary Action</span>
</button>
```

```css
.slds-button--outline {
  background-color: transparent;
  color: var(--slds-color-brand);
  border: 1px solid var(--slds-color-brand);
}

.slds-button--outline:hover {
  background-color: var(--slds-color-brand-light);
}

.slds-button--outline:active {
  background-color: var(--slds-color-blue-100);
}
```

### Neutral Button

```html
<button class="slds-button slds-button--neutral">
  <span class="slds-button__label">Neutral</span>
</button>
```

```css
.slds-button--neutral {
  background-color: #FFFFFF;
  color: var(--slds-color-text-default);
  border: 1px solid var(--slds-color-border);
}

.slds-button--neutral:hover {
  background-color: var(--slds-color-background-alt);
}
```

### Destructive Button

```html
<button class="slds-button slds-button--destructive">
  <span class="slds-button__label">Delete</span>
</button>
```

```css
.slds-button--destructive {
  background-color: var(--slds-color-error);
  color: #FFFFFF;
}

.slds-button--destructive:hover {
  background-color: var(--slds-color-error-dark);
}
```

### Icon Button

```html
<button class="slds-button slds-button--icon" aria-label="Edit">
  <svg class="slds-button__icon"><!-- edit icon --></svg>
</button>
```

```css
.slds-button--icon {
  width: 2.5rem;
  height: 2.5rem;
  padding: 0;
  background-color: transparent;
  color: var(--slds-color-text-secondary);
  border: none;
  border-radius: 0.25rem;
}

.slds-button--icon:hover {
  background-color: var(--slds-color-background-hover);
  color: var(--slds-color-text-default);
}

.slds-button--icon .slds-button__icon {
  width: 1.25rem;
  height: 1.25rem;
}
```

### Button Group

```html
<div class="slds-button-group" role="group">
  <button class="slds-button slds-button--neutral">First</button>
  <button class="slds-button slds-button--neutral">Second</button>
  <button class="slds-button slds-button--neutral">Third</button>
</div>
```

```css
.slds-button-group {
  display: inline-flex;
}

.slds-button-group .slds-button {
  border-radius: 0;
}

.slds-button-group .slds-button:first-child {
  border-radius: 0.25rem 0 0 0.25rem;
}

.slds-button-group .slds-button:last-child {
  border-radius: 0 0.25rem 0.25rem 0;
}

.slds-button-group .slds-button + .slds-button {
  margin-left: -1px;
}
```

## カード

### Basic Card

```html
<article class="slds-card">
  <header class="slds-card__header">
    <h2 class="slds-card__title">Card Title</h2>
    <div class="slds-card__actions">
      <button class="slds-button slds-button--icon" aria-label="More actions">
        <svg><!-- more icon --></svg>
      </button>
    </div>
  </header>
  <div class="slds-card__body">
    <p>Card content goes here.</p>
  </div>
  <footer class="slds-card__footer">
    <button class="slds-button slds-button--neutral">Action</button>
  </footer>
</article>
```

```css
.slds-card {
  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border-light);
  border-radius: 0.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.slds-card__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem;
  border-bottom: 1px solid var(--slds-color-border-light);
}

.slds-card__title {
  font-family: var(--slds-font-family);
  font-size: 1rem;
  font-weight: 600;
  color: var(--slds-color-text-default);
  margin: 0;
}

.slds-card__actions {
  display: flex;
  gap: 0.5rem;
}

.slds-card__body {
  padding: 1rem;
}

.slds-card__body:empty {
  display: none;
}

.slds-card__footer {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 0.5rem;
  padding: 1rem;
  border-top: 1px solid var(--slds-color-border-light);
}
```

### Card with Media

```html
<article class="slds-card slds-card--media">
  <div class="slds-card__media">
    <img src="image.jpg" alt="Description">
  </div>
  <div class="slds-card__content">
    <h3 class="slds-card__title">Card with Image</h3>
    <p class="slds-card__description">Supporting text for the card.</p>
  </div>
</article>
```

```css
.slds-card--media .slds-card__media {
  aspect-ratio: 16 / 9;
  overflow: hidden;
  border-radius: 0.5rem 0.5rem 0 0;
}

.slds-card--media .slds-card__media img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.slds-card--media .slds-card__content {
  padding: 1rem;
}

.slds-card__description {
  font-size: 0.875rem;
  color: var(--slds-color-text-secondary);
  margin: 0.5rem 0 0;
}
```

## フォーム要素

### Text Input

```html
<div class="slds-form-element">
  <label class="slds-form-element__label" for="input-1">
    Label
    <span class="slds-required">*</span>
  </label>
  <div class="slds-form-element__control">
    <input type="text" id="input-1" class="slds-input" placeholder="Placeholder text">
  </div>
  <p class="slds-form-element__help">Help text for this field.</p>
</div>
```

```css
.slds-form-element {
  margin-bottom: 1rem;
}

.slds-form-element__label {
  display: block;
  font-family: var(--slds-font-family);
  font-size: 0.8125rem;
  font-weight: 500;
  color: var(--slds-color-text-secondary);
  margin-bottom: 0.25rem;
}

.slds-required {
  color: var(--slds-color-error);
  margin-left: 0.125rem;
}

.slds-form-element__control {
  position: relative;
}

.slds-input {
  width: 100%;
  height: 2.5rem;
  padding: 0 0.75rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  color: var(--slds-color-text-default);

  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border);
  border-radius: 0.25rem;

  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.slds-input:hover {
  border-color: var(--slds-color-border-dark);
}

.slds-input:focus {
  outline: none;
  border-color: var(--slds-color-brand);
  box-shadow: 0 0 0 1px var(--slds-color-brand);
}

.slds-input::placeholder {
  color: var(--slds-color-text-placeholder);
}

.slds-input:disabled {
  background-color: var(--slds-color-background-alt);
  border-color: var(--slds-color-border-light);
  color: var(--slds-color-text-disabled);
  cursor: not-allowed;
}

.slds-form-element__help {
  font-size: 0.8125rem;
  color: var(--slds-color-text-secondary);
  margin-top: 0.25rem;
}
```

### Error State

```html
<div class="slds-form-element slds-has-error">
  <label class="slds-form-element__label" for="input-error">
    Email
  </label>
  <div class="slds-form-element__control">
    <input type="email" id="input-error" class="slds-input" value="invalid">
  </div>
  <p class="slds-form-element__help slds-form-element__help--error">
    Please enter a valid email address.
  </p>
</div>
```

```css
.slds-has-error .slds-input {
  border-color: var(--slds-color-error);
}

.slds-has-error .slds-input:focus {
  box-shadow: 0 0 0 1px var(--slds-color-error);
}

.slds-form-element__help--error {
  color: var(--slds-color-error);
}
```

### Textarea

```html
<div class="slds-form-element">
  <label class="slds-form-element__label" for="textarea-1">Description</label>
  <div class="slds-form-element__control">
    <textarea id="textarea-1" class="slds-textarea" rows="4"></textarea>
  </div>
</div>
```

```css
.slds-textarea {
  width: 100%;
  min-height: 6rem;
  padding: 0.75rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  color: var(--slds-color-text-default);

  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border);
  border-radius: 0.25rem;
  resize: vertical;

  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.slds-textarea:focus {
  outline: none;
  border-color: var(--slds-color-brand);
  box-shadow: 0 0 0 1px var(--slds-color-brand);
}
```

### Select

```html
<div class="slds-form-element">
  <label class="slds-form-element__label" for="select-1">Choose an option</label>
  <div class="slds-form-element__control">
    <div class="slds-select-wrapper">
      <select id="select-1" class="slds-select">
        <option value="">Select an option</option>
        <option value="1">Option 1</option>
        <option value="2">Option 2</option>
        <option value="3">Option 3</option>
      </select>
    </div>
  </div>
</div>
```

```css
.slds-select-wrapper {
  position: relative;
}

.slds-select-wrapper::after {
  content: '';
  position: absolute;
  right: 0.75rem;
  top: 50%;
  transform: translateY(-50%);
  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid var(--slds-color-text-secondary);
  pointer-events: none;
}

.slds-select {
  width: 100%;
  height: 2.5rem;
  padding: 0 2rem 0 0.75rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  color: var(--slds-color-text-default);

  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border);
  border-radius: 0.25rem;
  appearance: none;
  cursor: pointer;
}

.slds-select:focus {
  outline: none;
  border-color: var(--slds-color-brand);
  box-shadow: 0 0 0 1px var(--slds-color-brand);
}
```

### Checkbox

```html
<div class="slds-form-element">
  <div class="slds-checkbox">
    <input type="checkbox" id="checkbox-1" class="slds-checkbox__input">
    <label class="slds-checkbox__label" for="checkbox-1">
      <span class="slds-checkbox__faux"></span>
      <span class="slds-checkbox__text">Checkbox label</span>
    </label>
  </div>
</div>
```

```css
.slds-checkbox {
  display: flex;
  align-items: flex-start;
}

.slds-checkbox__input {
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

.slds-checkbox__label {
  display: flex;
  align-items: flex-start;
  gap: 0.5rem;
  cursor: pointer;
}

.slds-checkbox__faux {
  width: 1.25rem;
  height: 1.25rem;
  flex-shrink: 0;

  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border);
  border-radius: 0.25rem;

  display: flex;
  align-items: center;
  justify-content: center;

  transition: all 0.15s ease;
}

.slds-checkbox__input:checked + .slds-checkbox__label .slds-checkbox__faux {
  background-color: var(--slds-color-brand);
  border-color: var(--slds-color-brand);
}

.slds-checkbox__input:checked + .slds-checkbox__label .slds-checkbox__faux::after {
  content: '';
  width: 0.5rem;
  height: 0.25rem;
  border-left: 2px solid #FFFFFF;
  border-bottom: 2px solid #FFFFFF;
  transform: rotate(-45deg) translateY(-1px);
}

.slds-checkbox__input:focus + .slds-checkbox__label .slds-checkbox__faux {
  box-shadow: 0 0 0 2px var(--slds-color-brand-light);
}

.slds-checkbox__text {
  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  color: var(--slds-color-text-default);
  line-height: 1.25rem;
}
```

### Radio Button

```html
<fieldset class="slds-form-element">
  <legend class="slds-form-element__label">Select an option</legend>
  <div class="slds-form-element__control">
    <div class="slds-radio">
      <input type="radio" id="radio-1" name="radio-group" class="slds-radio__input">
      <label class="slds-radio__label" for="radio-1">
        <span class="slds-radio__faux"></span>
        <span class="slds-radio__text">Option 1</span>
      </label>
    </div>
    <div class="slds-radio">
      <input type="radio" id="radio-2" name="radio-group" class="slds-radio__input">
      <label class="slds-radio__label" for="radio-2">
        <span class="slds-radio__faux"></span>
        <span class="slds-radio__text">Option 2</span>
      </label>
    </div>
  </div>
</fieldset>
```

```css
.slds-radio {
  display: flex;
  align-items: flex-start;
  margin-bottom: 0.5rem;
}

.slds-radio__input {
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

.slds-radio__label {
  display: flex;
  align-items: flex-start;
  gap: 0.5rem;
  cursor: pointer;
}

.slds-radio__faux {
  width: 1.25rem;
  height: 1.25rem;
  flex-shrink: 0;

  background-color: #FFFFFF;
  border: 1px solid var(--slds-color-border);
  border-radius: 50%;

  display: flex;
  align-items: center;
  justify-content: center;

  transition: all 0.15s ease;
}

.slds-radio__input:checked + .slds-radio__label .slds-radio__faux {
  border-color: var(--slds-color-brand);
}

.slds-radio__input:checked + .slds-radio__label .slds-radio__faux::after {
  content: '';
  width: 0.625rem;
  height: 0.625rem;
  background-color: var(--slds-color-brand);
  border-radius: 50%;
}

.slds-radio__text {
  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  color: var(--slds-color-text-default);
  line-height: 1.25rem;
}
```

## データテーブル

```html
<div class="slds-table-container">
  <table class="slds-table">
    <thead>
      <tr class="slds-table__row">
        <th class="slds-table__header" scope="col">
          <div class="slds-checkbox">
            <input type="checkbox" id="select-all" class="slds-checkbox__input">
            <label class="slds-checkbox__label" for="select-all">
              <span class="slds-checkbox__faux"></span>
            </label>
          </div>
        </th>
        <th class="slds-table__header slds-is-sortable" scope="col">
          <button class="slds-table__header-button">
            Name
            <svg class="slds-table__sort-icon"><!-- sort icon --></svg>
          </button>
        </th>
        <th class="slds-table__header" scope="col">Email</th>
        <th class="slds-table__header" scope="col">Status</th>
        <th class="slds-table__header" scope="col">Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr class="slds-table__row">
        <td class="slds-table__cell">
          <div class="slds-checkbox"><!-- checkbox --></div>
        </td>
        <td class="slds-table__cell">John Doe</td>
        <td class="slds-table__cell">john@example.com</td>
        <td class="slds-table__cell">
          <span class="slds-badge slds-badge--success">Active</span>
        </td>
        <td class="slds-table__cell">
          <button class="slds-button slds-button--icon"><!-- edit --></button>
        </td>
      </tr>
    </tbody>
  </table>
</div>
```

```css
.slds-table-container {
  overflow-x: auto;
  border: 1px solid var(--slds-color-border-light);
  border-radius: 0.5rem;
}

.slds-table {
  width: 100%;
  border-collapse: collapse;
  background-color: #FFFFFF;
}

.slds-table__header {
  padding: 0.75rem 1rem;

  font-family: var(--slds-font-family);
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.02em;
  text-align: left;

  color: var(--slds-color-text-secondary);
  background-color: var(--slds-color-background-alt);
  border-bottom: 2px solid var(--slds-color-border);
}

.slds-table__header-button {
  display: inline-flex;
  align-items: center;
  gap: 0.25rem;
  padding: 0;
  background: none;
  border: none;
  font: inherit;
  color: inherit;
  cursor: pointer;
}

.slds-table__sort-icon {
  width: 0.75rem;
  height: 0.75rem;
  opacity: 0.5;
}

.slds-is-sortable:hover .slds-table__sort-icon {
  opacity: 1;
}

.slds-table__row {
  border-bottom: 1px solid var(--slds-color-border-light);
}

.slds-table__row:hover {
  background-color: var(--slds-color-background-row-hover);
}

.slds-table__row.is-selected {
  background-color: var(--slds-color-background-row-selected);
}

.slds-table__cell {
  padding: 0.75rem 1rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  color: var(--slds-color-text-default);
  vertical-align: middle;
}
```

## バッジ / ピル

```html
<span class="slds-badge">Default</span>
<span class="slds-badge slds-badge--brand">Brand</span>
<span class="slds-badge slds-badge--success">Success</span>
<span class="slds-badge slds-badge--warning">Warning</span>
<span class="slds-badge slds-badge--error">Error</span>
```

```css
.slds-badge {
  display: inline-flex;
  align-items: center;
  height: 1.5rem;
  padding: 0 0.5rem;

  font-family: var(--slds-font-family);
  font-size: 0.75rem;
  font-weight: 600;

  background-color: var(--slds-color-gray-200);
  color: var(--slds-color-text-default);
  border-radius: 0.75rem;
}

.slds-badge--brand {
  background-color: var(--slds-color-brand-light);
  color: var(--slds-color-brand-dark);
}

.slds-badge--success {
  background-color: var(--slds-color-success-light);
  color: var(--slds-color-success-dark);
}

.slds-badge--warning {
  background-color: var(--slds-color-warning-light);
  color: var(--slds-color-warning-dark);
}

.slds-badge--error {
  background-color: var(--slds-color-error-light);
  color: var(--slds-color-error-dark);
}
```

## モーダル / ダイアログ

```html
<div class="slds-modal-backdrop">
  <div class="slds-modal" role="dialog" aria-modal="true" aria-labelledby="modal-title">
    <header class="slds-modal__header">
      <h2 id="modal-title" class="slds-modal__title">Modal Title</h2>
      <button class="slds-button slds-button--icon slds-modal__close" aria-label="Close">
        <svg><!-- close icon --></svg>
      </button>
    </header>
    <div class="slds-modal__body">
      <p>Modal content goes here.</p>
    </div>
    <footer class="slds-modal__footer">
      <button class="slds-button slds-button--neutral">Cancel</button>
      <button class="slds-button slds-button--brand">Save</button>
    </footer>
  </div>
</div>
```

```css
.slds-modal-backdrop {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;

  background-color: rgba(0, 0, 0, 0.5);
  z-index: 9000;
}

.slds-modal {
  width: 100%;
  max-width: 560px;
  max-height: calc(100vh - 2rem);

  background-color: #FFFFFF;
  border-radius: 0.5rem;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.2);

  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.slds-modal__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem 1.5rem;
  border-bottom: 1px solid var(--slds-color-border-light);
}

.slds-modal__title {
  font-family: var(--slds-font-family);
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--slds-color-text-default);
  margin: 0;
}

.slds-modal__close {
  margin-right: -0.5rem;
}

.slds-modal__body {
  padding: 1.5rem;
  overflow-y: auto;
  flex: 1;
}

.slds-modal__footer {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 0.5rem;
  padding: 1rem 1.5rem;
  border-top: 1px solid var(--slds-color-border-light);
}
```

## トースト / アラート

```html
<div class="slds-toast slds-toast--success" role="alert">
  <div class="slds-toast__icon">
    <svg><!-- success icon --></svg>
  </div>
  <div class="slds-toast__content">
    <p class="slds-toast__message">Record saved successfully.</p>
  </div>
  <button class="slds-button slds-button--icon slds-toast__close" aria-label="Close">
    <svg><!-- close icon --></svg>
  </button>
</div>
```

```css
.slds-toast {
  display: flex;
  align-items: flex-start;
  gap: 0.75rem;
  padding: 1rem;

  background-color: var(--slds-color-gray-800);
  color: #FFFFFF;
  border-radius: 0.25rem;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);

  max-width: 400px;
}

.slds-toast--success {
  background-color: var(--slds-color-success);
}

.slds-toast--warning {
  background-color: var(--slds-color-warning);
}

.slds-toast--error {
  background-color: var(--slds-color-error);
}

.slds-toast--info {
  background-color: var(--slds-color-info);
}

.slds-toast__icon {
  width: 1.25rem;
  height: 1.25rem;
  flex-shrink: 0;
}

.slds-toast__content {
  flex: 1;
}

.slds-toast__message {
  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  margin: 0;
}

.slds-toast__close {
  color: #FFFFFF;
  margin: -0.25rem -0.25rem -0.25rem 0;
}
```

## タブ

```html
<div class="slds-tabs">
  <ul class="slds-tabs__nav" role="tablist">
    <li class="slds-tabs__item is-active" role="presentation">
      <button class="slds-tabs__link" role="tab" aria-selected="true">Tab 1</button>
    </li>
    <li class="slds-tabs__item" role="presentation">
      <button class="slds-tabs__link" role="tab" aria-selected="false">Tab 2</button>
    </li>
    <li class="slds-tabs__item" role="presentation">
      <button class="slds-tabs__link" role="tab" aria-selected="false">Tab 3</button>
    </li>
  </ul>
  <div class="slds-tabs__content" role="tabpanel">
    Tab content here.
  </div>
</div>
```

```css
.slds-tabs__nav {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  border-bottom: 1px solid var(--slds-color-border);
}

.slds-tabs__item {
  margin-bottom: -1px;
}

.slds-tabs__link {
  display: block;
  padding: 0.75rem 1rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  font-weight: 500;
  color: var(--slds-color-text-secondary);

  background: none;
  border: none;
  border-bottom: 2px solid transparent;
  cursor: pointer;

  transition: all 0.15s ease;
}

.slds-tabs__link:hover {
  color: var(--slds-color-text-default);
}

.slds-tabs__item.is-active .slds-tabs__link {
  color: var(--slds-color-brand);
  border-bottom-color: var(--slds-color-brand);
}

.slds-tabs__content {
  padding: 1rem;
}
```

## グローバルヘッダー

```html
<header class="slds-global-header">
  <div class="slds-global-header__logo">
    <img src="logo.svg" alt="Company Logo">
  </div>
  <nav class="slds-global-header__nav">
    <a href="#" class="slds-global-header__nav-item is-active">Home</a>
    <a href="#" class="slds-global-header__nav-item">Accounts</a>
    <a href="#" class="slds-global-header__nav-item">Contacts</a>
    <a href="#" class="slds-global-header__nav-item">Reports</a>
  </nav>
  <div class="slds-global-header__actions">
    <button class="slds-button slds-button--icon slds-global-header__action">
      <svg><!-- search icon --></svg>
    </button>
    <button class="slds-button slds-button--icon slds-global-header__action">
      <svg><!-- notification icon --></svg>
    </button>
    <div class="slds-global-header__user">
      <img src="avatar.jpg" alt="User" class="slds-global-header__avatar">
    </div>
  </div>
</header>
```

```css
.slds-global-header {
  display: flex;
  align-items: center;
  height: 3.5rem;
  padding: 0 1rem;

  background-color: var(--slds-color-brand-dark);
  color: #FFFFFF;
}

.slds-global-header__logo {
  display: flex;
  align-items: center;
  margin-right: 2rem;
}

.slds-global-header__logo img {
  height: 2rem;
}

.slds-global-header__nav {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  flex: 1;
}

.slds-global-header__nav-item {
  display: flex;
  align-items: center;
  height: 3.5rem;
  padding: 0 1rem;

  font-family: var(--slds-font-family);
  font-size: 0.875rem;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.8);
  text-decoration: none;

  border-bottom: 2px solid transparent;
  transition: all 0.15s ease;
}

.slds-global-header__nav-item:hover {
  color: #FFFFFF;
  background-color: rgba(255, 255, 255, 0.1);
}

.slds-global-header__nav-item.is-active {
  color: #FFFFFF;
  border-bottom-color: var(--slds-color-brand);
}

.slds-global-header__actions {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.slds-global-header__action {
  color: rgba(255, 255, 255, 0.8);
}

.slds-global-header__action:hover {
  color: #FFFFFF;
  background-color: rgba(255, 255, 255, 0.1);
}

.slds-global-header__avatar {
  width: 2rem;
  height: 2rem;
  border-radius: 50%;
  object-fit: cover;
}
```

## ベストプラクティス

### DO（推奨）

- セマンティックなHTML要素を使用
- ARIA属性を適切に設定
- フォーカス状態を明示的に表示
- キーボードナビゲーションをサポート
- 一貫したスペーシングを維持

### DON'T（非推奨）

- divのみでインタラクティブ要素を作成
- フォーカスインジケーターを削除
- 色のみで状態を伝える
- クリック領域を小さくしすぎる
- 過度なネスト構造
