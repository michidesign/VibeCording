# Atlassian アニメーション

Atlassian Design System のモーション・アニメーションガイドラインです。

## デザイン原則

### 1. 目的を持ったモーション

- アニメーションは意味を伝えるために使用
- 装飾的なモーションは避ける
- ユーザーの注意を適切に誘導

### 2. 控えめで自然

- 素早く完了するアニメーション
- 自然な物理法則に従う動き
- 過度な演出は避ける

### 3. パフォーマンス重視

- GPU最適化されたプロパティを使用
- 不要なアニメーションは省略
- reduced-motion を尊重

## デュレーション

| トークン | 値 | 用途 |
|---------|-----|------|
| Duration Fast | 100ms | ホバー、フォーカス |
| Duration Normal | 200ms | 標準トランジション |
| Duration Slow | 300ms | 複雑なトランジション |
| Duration Slower | 400ms | 大きな変化、モーダル |

```css
:root {
  --duration-fast: 100ms;
  --duration-normal: 200ms;
  --duration-slow: 300ms;
  --duration-slower: 400ms;
}
```

## イージング

| トークン | 値 | 用途 |
|---------|-----|------|
| Ease Standard | cubic-bezier(0.2, 0, 0, 1) | 標準トランジション |
| Ease Entrance | cubic-bezier(0, 0, 0.2, 1) | 要素の出現 |
| Ease Exit | cubic-bezier(0.4, 0, 1, 1) | 要素の退出 |

```css
:root {
  --easing-standard: cubic-bezier(0.2, 0, 0, 1);
  --easing-entrance: cubic-bezier(0, 0, 0.2, 1);
  --easing-exit: cubic-bezier(0.4, 0, 1, 1);
}
```

## 基本トランジション

### ホバートランジション

```css
.btn {
  transition: background-color var(--duration-fast) var(--easing-standard);
}

.btn:hover {
  background-color: var(--color-background-neutral);
}
```

### フォーカストランジション

```css
.input {
  transition: border-color var(--duration-fast) var(--easing-standard),
              box-shadow var(--duration-fast) var(--easing-standard);
}

.input:focus {
  border-color: var(--color-border-focused);
  box-shadow: 0 0 0 2px rgba(76, 154, 255, 0.2);
}
```

### カラートランジション

```css
.link {
  transition: color var(--duration-fast) var(--easing-standard);
}

.link:hover {
  color: var(--color-brand-boldHovered);
}
```

## 出現アニメーション

### フェードイン

```css
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.fade-in {
  animation: fadeIn var(--duration-normal) var(--easing-entrance);
}
```

### スライドイン（上から）

```css
@keyframes slideInDown {
  from {
    opacity: 0;
    transform: translateY(-8px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.slide-in-down {
  animation: slideInDown var(--duration-normal) var(--easing-entrance);
}
```

### スライドイン（下から）

```css
@keyframes slideInUp {
  from {
    opacity: 0;
    transform: translateY(8px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.slide-in-up {
  animation: slideInUp var(--duration-normal) var(--easing-entrance);
}
```

### スケールイン

```css
@keyframes scaleIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.scale-in {
  animation: scaleIn var(--duration-normal) var(--easing-entrance);
}
```

## 退出アニメーション

### フェードアウト

```css
@keyframes fadeOut {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}

.fade-out {
  animation: fadeOut var(--duration-fast) var(--easing-exit);
}
```

### スライドアウト（上へ）

```css
@keyframes slideOutUp {
  from {
    opacity: 1;
    transform: translateY(0);
  }
  to {
    opacity: 0;
    transform: translateY(-8px);
  }
}

.slide-out-up {
  animation: slideOutUp var(--duration-fast) var(--easing-exit);
}
```

## コンポーネント別アニメーション

### モーダル

```css
/* オーバーレイ */
@keyframes modalOverlayIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.modal-overlay {
  animation: modalOverlayIn var(--duration-normal) var(--easing-standard);
}

/* モーダルコンテンツ */
@keyframes modalContentIn {
  from {
    opacity: 0;
    transform: translateY(-20px) scale(0.98);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

.modal-content {
  animation: modalContentIn var(--duration-slow) var(--easing-entrance);
}
```

### ドロップダウン

```css
@keyframes dropdownIn {
  from {
    opacity: 0;
    transform: translateY(-4px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.dropdown-menu {
  animation: dropdownIn var(--duration-fast) var(--easing-entrance);
  transform-origin: top center;
}
```

### ツールチップ

```css
@keyframes tooltipIn {
  from {
    opacity: 0;
    transform: translateY(4px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.tooltip-content {
  animation: tooltipIn var(--duration-fast) var(--easing-entrance);
}
```

### トースト / スナックバー

```css
@keyframes toastIn {
  from {
    opacity: 0;
    transform: translateY(100%);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes toastOut {
  from {
    opacity: 1;
    transform: translateY(0);
  }
  to {
    opacity: 0;
    transform: translateY(100%);
  }
}

.toast {
  animation: toastIn var(--duration-slow) var(--easing-entrance);
}

.toast.exiting {
  animation: toastOut var(--duration-normal) var(--easing-exit);
}
```

### アコーディオン

```css
.accordion-content {
  overflow: hidden;
  transition: max-height var(--duration-normal) var(--easing-standard);
}

.accordion-content.collapsed {
  max-height: 0;
}

.accordion-content.expanded {
  max-height: 500px; /* 適切な値に調整 */
}
```

### サイドバー展開

```css
.sidebar {
  width: 240px;
  transition: width var(--duration-slow) var(--easing-standard);
}

.sidebar.collapsed {
  width: 56px;
}

.sidebar-content {
  opacity: 1;
  transition: opacity var(--duration-fast) var(--easing-standard);
}

.sidebar.collapsed .sidebar-content {
  opacity: 0;
}
```

## ローディングアニメーション

### スピナー

```css
@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.spinner {
  animation: spin 600ms linear infinite;
}
```

### パルス

```css
@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

.skeleton {
  animation: pulse 1.5s ease-in-out infinite;
  background-color: var(--color-background-neutral);
}
```

### ドット

```css
@keyframes dotPulse {
  0%, 80%, 100% {
    transform: scale(0);
    opacity: 0;
  }
  40% {
    transform: scale(1);
    opacity: 1;
  }
}

.loading-dots span {
  display: inline-block;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background-color: var(--color-brand-bold);
  animation: dotPulse 1.4s ease-in-out infinite;
}

.loading-dots span:nth-child(1) { animation-delay: 0s; }
.loading-dots span:nth-child(2) { animation-delay: 0.16s; }
.loading-dots span:nth-child(3) { animation-delay: 0.32s; }
```

## インタラクションフィードバック

### ボタンプレス

```css
.btn {
  transition: transform var(--duration-fast) var(--easing-standard);
}

.btn:active {
  transform: scale(0.98);
}
```

### カードホバー

```css
.card-interactive {
  transition: transform var(--duration-normal) var(--easing-standard),
              box-shadow var(--duration-normal) var(--easing-standard);
}

.card-interactive:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-overlay);
}

.card-interactive:active {
  transform: translateY(0);
  box-shadow: var(--shadow-raised);
}
```

### チェックボックス

```css
.checkbox-input {
  transition: background-color var(--duration-fast) var(--easing-standard),
              border-color var(--duration-fast) var(--easing-standard);
}

.checkbox-checkmark {
  transform: scale(0);
  transition: transform var(--duration-fast) var(--easing-entrance);
}

.checkbox-input:checked .checkbox-checkmark {
  transform: scale(1);
}
```

## アクセシビリティ

### Reduced Motion

```css
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

### 特定要素のreduced-motion対応

```css
.modal-content {
  animation: modalContentIn var(--duration-slow) var(--easing-entrance);
}

@media (prefers-reduced-motion: reduce) {
  .modal-content {
    animation: none;
    opacity: 1;
    transform: none;
  }
}
```

## ベストプラクティス

### DO（推奨）

- `transform` と `opacity` を優先的に使用（GPU最適化）
- 100〜400msのデュレーションを使用
- `prefers-reduced-motion` を尊重
- 目的を持ったアニメーションのみ使用
- 一貫したイージングカーブを使用

### DON'T（非推奨）

- `width`, `height`, `top`, `left` のアニメーション（パフォーマンス低下）
- 500ms以上の長いアニメーション
- 装飾的なアニメーションの多用
- 複数のアニメーションの同時実行
- 無限ループアニメーション（ローディング除く）

## パフォーマンス最適化

### GPUアクセラレーション

```css
/* GPUで処理されるプロパティ */
.optimized {
  transform: translateZ(0); /* GPUレイヤー作成 */
  will-change: transform, opacity; /* 事前にブラウザに通知 */
}

/* 注意: will-changeは必要な要素にのみ使用 */
```

### コンポジットレイヤー

```css
/* 良い例: transform, opacity のみアニメーション */
.good {
  transition: transform 200ms ease, opacity 200ms ease;
}

/* 避けるべき例: レイアウトプロパティのアニメーション */
.avoid {
  transition: width 200ms ease, height 200ms ease;
}
```
