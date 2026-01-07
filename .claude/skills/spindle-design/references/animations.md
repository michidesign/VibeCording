# Spindle アニメーション

Spindle のアニメーションシステムは、連続した動きや物理的な加速を UI に反映させ、親しみやすさとユーザー体験の向上を目指しています。

## デュレーション（Duration）

| トークン | 値 | 用途 |
|---------|-----|------|
| `--duration-fast` | 150ms | ホバー、フォーカス、小さな変化 |
| `--duration-neutral` | 350ms | 標準的なトランジション |
| `--duration-slow` | 500ms | 大きな変化、モーダル表示 |

```css
:root {
  --duration-fast: 150ms;
  --duration-neutral: 350ms;
  --duration-slow: 500ms;
}
```

## イージング（Easing）

| トークン | 値 | 用途 |
|---------|-----|------|
| `--ease-out` | `cubic-bezier(0.33, 1, 0.68, 1)` | 要素の表示、展開 |
| `--ease-in` | `cubic-bezier(0.32, 0, 0.67, 0)` | 要素の非表示、収縮 |
| `--ease-in-out` | `cubic-bezier(0.65, 0, 0.35, 1)` | 状態の切り替え |
| `--ease-linear` | `linear` | 連続的な変化 |

```css
:root {
  --ease-out: cubic-bezier(0.33, 1, 0.68, 1);
  --ease-in: cubic-bezier(0.32, 0, 0.67, 0);
  --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);
  --ease-linear: linear;
}
```

## アニメーションタイプ

### フェード（Fade）

要素の表示/非表示に使用します。

```css
/* フェードイン */
.fade-in {
  animation: fadeIn var(--duration-neutral) var(--ease-out);
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/* フェードアウト */
.fade-out {
  animation: fadeOut var(--duration-neutral) var(--ease-in);
}

@keyframes fadeOut {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
```

### スライド（Slide）

要素のスライドイン/アウトに使用します。

```css
/* 下からスライドイン */
.slide-up {
  animation: slideUp var(--duration-neutral) var(--ease-out);
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(16px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* 上からスライドイン */
.slide-down {
  animation: slideDown var(--duration-neutral) var(--ease-out);
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-16px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* 左からスライドイン */
.slide-right {
  animation: slideRight var(--duration-neutral) var(--ease-out);
}

@keyframes slideRight {
  from {
    opacity: 0;
    transform: translateX(-16px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}
```

### スケール（Scale）

要素の拡大/縮小に使用します。

```css
/* スケールイン */
.scale-in {
  animation: scaleIn var(--duration-neutral) var(--ease-out);
}

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

/* スケールアウト */
.scale-out {
  animation: scaleOut var(--duration-neutral) var(--ease-in);
}

@keyframes scaleOut {
  from {
    opacity: 1;
    transform: scale(1);
  }
  to {
    opacity: 0;
    transform: scale(0.95);
  }
}
```

## トランジション

### ボタントランジション

```css
.btn {
  transition:
    background-color var(--duration-fast) var(--ease-out),
    box-shadow var(--duration-fast) var(--ease-out),
    transform var(--duration-fast) var(--ease-out);
}

.btn:hover {
  transform: translateY(-1px);
}

.btn:active {
  transform: translateY(0);
}
```

### カードトランジション

```css
.card {
  transition:
    box-shadow var(--duration-neutral) var(--ease-out),
    transform var(--duration-neutral) var(--ease-out);
}

.card:hover {
  box-shadow: 0 8px 24px rgba(8, 18, 26, 0.12);
  transform: translateY(-2px);
}
```

### リンクトランジション

```css
.link {
  transition: color var(--duration-fast) var(--ease-out);
}

.link::after {
  transition: transform var(--duration-fast) var(--ease-out);
}
```

### インプットトランジション

```css
.input {
  transition:
    border-color var(--duration-fast) var(--ease-out),
    box-shadow var(--duration-fast) var(--ease-out);
}
```

## モーダルアニメーション

### モーダル表示

```css
/* オーバーレイ */
.modal-overlay {
  animation: fadeIn var(--duration-neutral) var(--ease-out);
}

/* モーダル本体 */
.modal {
  animation: modalIn var(--duration-neutral) var(--ease-out);
}

@keyframes modalIn {
  from {
    opacity: 0;
    transform: scale(0.95) translateY(16px);
  }
  to {
    opacity: 1;
    transform: scale(1) translateY(0);
  }
}
```

### モーダル非表示

```css
.modal-overlay.is-closing {
  animation: fadeOut var(--duration-neutral) var(--ease-in);
}

.modal.is-closing {
  animation: modalOut var(--duration-neutral) var(--ease-in);
}

@keyframes modalOut {
  from {
    opacity: 1;
    transform: scale(1) translateY(0);
  }
  to {
    opacity: 0;
    transform: scale(0.95) translateY(16px);
  }
}
```

## ドロップダウンアニメーション

```css
.dropdown-menu {
  animation: dropdownIn var(--duration-fast) var(--ease-out);
  transform-origin: top center;
}

@keyframes dropdownIn {
  from {
    opacity: 0;
    transform: scaleY(0.9);
  }
  to {
    opacity: 1;
    transform: scaleY(1);
  }
}
```

## スケルトンローディング

```css
.skeleton {
  background: linear-gradient(
    90deg,
    var(--color-gray-10) 0%,
    var(--color-gray-5) 50%,
    var(--color-gray-10) 100%
  );
  background-size: 200% 100%;
  animation: skeleton var(--duration-slow) var(--ease-linear) infinite;
}

@keyframes skeleton {
  0% {
    background-position: 200% 0;
  }
  100% {
    background-position: -200% 0;
  }
}
```

## スピナー

```css
.spinner {
  width: 24px;
  height: 24px;
  border: 2px solid var(--color-gray-20);
  border-top-color: var(--color-primary-70);
  border-radius: 50%;
  animation: spin 800ms var(--ease-linear) infinite;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}
```

## アクセシビリティ対応

### モーション軽減

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

### 代替スタイル

```css
@media (prefers-reduced-motion: reduce) {
  .card:hover {
    transform: none;
    box-shadow: 0 0 0 2px var(--color-primary-70);
  }

  .btn:hover {
    transform: none;
  }
}
```

## ベストプラクティス

### DO（推奨）

- **物理的な動きを意識**: ease-out でスムーズな減速を表現
- **適切なデュレーション**: 小さな変化は150ms、大きな変化は350-500ms
- **opacity と transform を使用**: パフォーマンスに優れたプロパティ
- **アクセシビリティ対応**: prefers-reduced-motion に対応

### DON'T（非推奨）

- **レイアウトプロパティのアニメーション**: width, height, margin, padding などは避ける
- **過度に長いアニメーション**: 500ms を超えるアニメーションは控える
- **突然の動き**: イージングなしの linear は連続的な動きのみに使用
- **派手なアニメーション**: 過度なバウンスやスプリング効果

## 使用例

### インタラクティブカード

```css
.interactive-card {
  transition:
    box-shadow var(--duration-neutral) var(--ease-out),
    transform var(--duration-neutral) var(--ease-out);
}

.interactive-card:hover {
  box-shadow: 0 8px 24px rgba(8, 18, 26, 0.12);
  transform: translateY(-4px);
}

.interactive-card:active {
  transform: translateY(-2px);
  transition-duration: var(--duration-fast);
}
```

### トグルスイッチ

```css
.toggle-track {
  transition: background-color var(--duration-fast) var(--ease-out);
}

.toggle-thumb {
  transition: transform var(--duration-fast) var(--ease-out);
}

.toggle.is-checked .toggle-thumb {
  transform: translateX(20px);
}
```
