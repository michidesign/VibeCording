# Material Design アニメーション・モーションシステム

Material Design 3 に基づいたモーションシステムの完全なリファレンス。

## イージング

### 標準イージング

```css
:root {
  /* Emphasized - 大きな動き、画面遷移 */
  --md-sys-motion-easing-emphasized: cubic-bezier(0.2, 0, 0, 1);
  --md-sys-motion-easing-emphasized-decelerate: cubic-bezier(0.05, 0.7, 0.1, 1);
  --md-sys-motion-easing-emphasized-accelerate: cubic-bezier(0.3, 0, 0.8, 0.15);

  /* Standard - 一般的なUI要素 */
  --md-sys-motion-easing-standard: cubic-bezier(0.2, 0, 0, 1);
  --md-sys-motion-easing-standard-decelerate: cubic-bezier(0, 0, 0, 1);
  --md-sys-motion-easing-standard-accelerate: cubic-bezier(0.3, 0, 1, 1);

  /* Legacy - 後方互換性 */
  --md-sys-motion-easing-legacy: cubic-bezier(0.4, 0, 0.2, 1);
  --md-sys-motion-easing-legacy-decelerate: cubic-bezier(0, 0, 0.2, 1);
  --md-sys-motion-easing-legacy-accelerate: cubic-bezier(0.4, 0, 1, 1);

  /* Linear */
  --md-sys-motion-easing-linear: linear;
}
```

### イージングの使い分け

| イージング | 用途 |
|-----------|------|
| emphasized | ページ遷移、モーダル開閉、大きな状態変化 |
| emphasized-decelerate | 要素の出現（画面に入る） |
| emphasized-accelerate | 要素の退場（画面から出る） |
| standard | ボタン、カード、一般的なインタラクション |
| standard-decelerate | ドロップダウン展開、メニュー表示 |
| standard-accelerate | メニュー非表示、折りたたみ |
| linear | プログレス、連続的な変化 |

## デュレーション

### 標準デュレーション

```css
:root {
  /* Short - マイクロインタラクション */
  --md-sys-motion-duration-short1: 50ms;
  --md-sys-motion-duration-short2: 100ms;
  --md-sys-motion-duration-short3: 150ms;
  --md-sys-motion-duration-short4: 200ms;

  /* Medium - 一般的なトランジション */
  --md-sys-motion-duration-medium1: 250ms;
  --md-sys-motion-duration-medium2: 300ms;
  --md-sys-motion-duration-medium3: 350ms;
  --md-sys-motion-duration-medium4: 400ms;

  /* Long - 複雑なアニメーション */
  --md-sys-motion-duration-long1: 450ms;
  --md-sys-motion-duration-long2: 500ms;
  --md-sys-motion-duration-long3: 550ms;
  --md-sys-motion-duration-long4: 600ms;

  /* Extra Long - ページ遷移 */
  --md-sys-motion-duration-extra-long1: 700ms;
  --md-sys-motion-duration-extra-long2: 800ms;
  --md-sys-motion-duration-extra-long3: 900ms;
  --md-sys-motion-duration-extra-long4: 1000ms;
}
```

### デュレーションの目安

| デュレーション | 用途 |
|--------------|------|
| 50-100ms | ホバー、フォーカス、リップル開始 |
| 150-200ms | ボタンプレス、チップ選択 |
| 250-300ms | カード展開、メニュー表示 |
| 350-400ms | モーダル表示、シート展開 |
| 450-600ms | ページ遷移、複雑なレイアウト変更 |

## Ripple（波紋）エフェクト

Material Design の代表的なタッチフィードバック。

### CSS 実装

```css
.ripple {
  position: relative;
  overflow: hidden;
}

.ripple::after {
  content: '';
  position: absolute;
  width: 100%;
  padding-bottom: 100%;
  border-radius: 50%;

  background-color: currentColor;
  opacity: 0;

  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0);
  transition: transform 0s, opacity 0s;
}

.ripple:active::after {
  opacity: 0.12;
  transform: translate(-50%, -50%) scale(2);
  transition: transform 300ms var(--md-sys-motion-easing-standard),
              opacity 100ms var(--md-sys-motion-easing-standard);
}
```

### JavaScript 実装（高度なリップル）

```javascript
function createRipple(event) {
  const button = event.currentTarget;
  const ripple = document.createElement('span');

  const diameter = Math.max(button.clientWidth, button.clientHeight);
  const radius = diameter / 2;

  const rect = button.getBoundingClientRect();

  ripple.style.width = ripple.style.height = `${diameter}px`;
  ripple.style.left = `${event.clientX - rect.left - radius}px`;
  ripple.style.top = `${event.clientY - rect.top - radius}px`;
  ripple.classList.add('ripple-effect');

  const existingRipple = button.querySelector('.ripple-effect');
  if (existingRipple) {
    existingRipple.remove();
  }

  button.appendChild(ripple);

  ripple.addEventListener('animationend', () => {
    ripple.remove();
  });
}
```

```css
.ripple-effect {
  position: absolute;
  border-radius: 50%;
  background-color: currentColor;
  opacity: 0.12;
  transform: scale(0);
  animation: ripple-animation 450ms var(--md-sys-motion-easing-standard);
  pointer-events: none;
}

@keyframes ripple-animation {
  to {
    transform: scale(2.5);
    opacity: 0;
  }
}
```

## キーフレームアニメーション

### フェードイン

```css
@keyframes md-fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.fade-in {
  animation: md-fade-in var(--md-sys-motion-duration-medium2)
             var(--md-sys-motion-easing-standard-decelerate);
}
```

### スケールイン

```css
@keyframes md-scale-in {
  from {
    opacity: 0;
    transform: scale(0.8);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.scale-in {
  animation: md-scale-in var(--md-sys-motion-duration-medium3)
             var(--md-sys-motion-easing-emphasized-decelerate);
}
```

### スライドイン

```css
/* 下からスライドイン */
@keyframes md-slide-in-bottom {
  from {
    opacity: 0;
    transform: translateY(100%);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.slide-in-bottom {
  animation: md-slide-in-bottom var(--md-sys-motion-duration-long1)
             var(--md-sys-motion-easing-emphasized-decelerate);
}

/* 右からスライドイン */
@keyframes md-slide-in-right {
  from {
    opacity: 0;
    transform: translateX(100%);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.slide-in-right {
  animation: md-slide-in-right var(--md-sys-motion-duration-long1)
             var(--md-sys-motion-easing-emphasized-decelerate);
}
```

### 展開アニメーション

```css
/* コンテナの展開 */
@keyframes md-expand {
  from {
    opacity: 0;
    transform: scaleY(0);
    transform-origin: top;
  }
  to {
    opacity: 1;
    transform: scaleY(1);
    transform-origin: top;
  }
}

.expand {
  animation: md-expand var(--md-sys-motion-duration-medium4)
             var(--md-sys-motion-easing-emphasized);
}
```

## Shared Axis トランジション

Material Design のページ遷移パターン。

### 水平方向（X軸）

```css
/* 右へ移動（進む） */
@keyframes md-shared-axis-x-forward-out {
  from {
    opacity: 1;
    transform: translateX(0);
  }
  to {
    opacity: 0;
    transform: translateX(-30px);
  }
}

@keyframes md-shared-axis-x-forward-in {
  from {
    opacity: 0;
    transform: translateX(30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.page-exit-forward {
  animation: md-shared-axis-x-forward-out var(--md-sys-motion-duration-medium2)
             var(--md-sys-motion-easing-emphasized-accelerate);
}

.page-enter-forward {
  animation: md-shared-axis-x-forward-in var(--md-sys-motion-duration-long1)
             var(--md-sys-motion-easing-emphasized-decelerate);
}
```

### 垂直方向（Y軸）

```css
/* 上へ移動 */
@keyframes md-shared-axis-y-up-out {
  from {
    opacity: 1;
    transform: translateY(0);
  }
  to {
    opacity: 0;
    transform: translateY(-30px);
  }
}

@keyframes md-shared-axis-y-up-in {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

### 深度（Z軸）

```css
/* 奥へ移動（親画面） */
@keyframes md-shared-axis-z-back {
  from {
    opacity: 1;
    transform: scale(1);
  }
  to {
    opacity: 0;
    transform: scale(0.9);
  }
}

/* 手前へ移動（子画面） */
@keyframes md-shared-axis-z-forward {
  from {
    opacity: 0;
    transform: scale(1.1);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
```

## スケルトンローディング

```css
@keyframes md-skeleton-wave {
  0% {
    background-position: -200% 0;
  }
  100% {
    background-position: 200% 0;
  }
}

.skeleton {
  background: linear-gradient(
    90deg,
    var(--md-sys-color-surface-container) 25%,
    var(--md-sys-color-surface-container-high) 50%,
    var(--md-sys-color-surface-container) 75%
  );
  background-size: 200% 100%;
  animation: md-skeleton-wave 1.5s var(--md-sys-motion-easing-linear) infinite;
  border-radius: 4px;
}

.skeleton-text {
  height: 16px;
  margin-bottom: 8px;
}

.skeleton-circle {
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
```

## プログレスインジケーター

### Circular Progress

```css
@keyframes md-circular-progress-rotate {
  100% {
    transform: rotate(360deg);
  }
}

@keyframes md-circular-progress-dash {
  0% {
    stroke-dasharray: 1, 200;
    stroke-dashoffset: 0;
  }
  50% {
    stroke-dasharray: 89, 200;
    stroke-dashoffset: -35;
  }
  100% {
    stroke-dasharray: 89, 200;
    stroke-dashoffset: -124;
  }
}

.circular-progress {
  width: 48px;
  height: 48px;
  animation: md-circular-progress-rotate 2s linear infinite;
}

.circular-progress circle {
  stroke: var(--md-sys-color-primary);
  stroke-width: 4;
  stroke-linecap: round;
  fill: none;
  animation: md-circular-progress-dash 1.5s var(--md-sys-motion-easing-standard) infinite;
}
```

### Linear Progress

```css
@keyframes md-linear-progress-indeterminate {
  0% {
    left: -35%;
    right: 100%;
  }
  60% {
    left: 100%;
    right: -90%;
  }
  100% {
    left: 100%;
    right: -90%;
  }
}

.linear-progress {
  height: 4px;
  background-color: var(--md-sys-color-surface-container-highest);
  border-radius: 2px;
  overflow: hidden;
  position: relative;
}

.linear-progress-bar {
  position: absolute;
  top: 0;
  bottom: 0;
  background-color: var(--md-sys-color-primary);
  border-radius: 2px;
  animation: md-linear-progress-indeterminate 2s var(--md-sys-motion-easing-standard) infinite;
}
```

## アクセシビリティ

### Reduced Motion 対応

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }

  .ripple::after {
    display: none;
  }
}
```

## ベストプラクティス

### DO（推奨）

- 意味のあるアニメーションを使用
- デュレーションとイージングを一貫して使用
- 入退場にペアのアニメーションを使用
- reduced-motion に対応

### DON'T（非推奨）

- 装飾的すぎるアニメーション
- 1秒を超えるアニメーション
- 同時に多すぎるアニメーション
- レイアウトプロパティのアニメーション
