# Apple アニメーション・モーションシステム

Apple デザインにおけるアニメーションとトランジションの完全なリファレンス。

## イージング関数

### 基本イージング

```css
:root {
  /* 標準 - 汎用的なトランジション */
  --ease-default: cubic-bezier(0.25, 0.1, 0.25, 1);

  /* アウト - 要素の出現、展開 */
  --ease-out: cubic-bezier(0, 0, 0.58, 1);

  /* イン - 要素の消失、縮小 */
  --ease-in: cubic-bezier(0.42, 0, 1, 1);

  /* イン・アウト - 状態の変化 */
  --ease-in-out: cubic-bezier(0.42, 0, 0.58, 1);

  /* スプリング風 - 弾むような動き */
  --ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);

  /* ソフト - 繊細な動き */
  --ease-soft: cubic-bezier(0.4, 0, 0.2, 1);
}
```

### デュレーション

```css
:root {
  /* 瞬時 - マイクロインタラクション */
  --duration-instant: 100ms;

  /* 速い - ホバー、フォーカス */
  --duration-fast: 150ms;

  /* 標準 - 一般的なトランジション */
  --duration-normal: 300ms;

  /* 遅い - 複雑なアニメーション */
  --duration-slow: 500ms;

  /* 非常に遅い - ページ遷移、モーダル */
  --duration-slower: 700ms;
}
```

## トランジション

### 汎用トランジション

```css
/* すべてのプロパティ */
.transition-all {
  transition: all var(--duration-normal) var(--ease-out);
}

/* 色のみ */
.transition-colors {
  transition: color var(--duration-fast) var(--ease-out),
              background-color var(--duration-fast) var(--ease-out),
              border-color var(--duration-fast) var(--ease-out);
}

/* トランスフォームのみ */
.transition-transform {
  transition: transform var(--duration-normal) var(--ease-out);
}

/* 不透明度のみ */
.transition-opacity {
  transition: opacity var(--duration-normal) var(--ease-out);
}

/* シャドウのみ */
.transition-shadow {
  transition: box-shadow var(--duration-normal) var(--ease-out);
}
```

### ホバーエフェクト

```css
/* リフト - カード、ボタン */
.hover-lift {
  transition: transform var(--duration-normal) var(--ease-out),
              box-shadow var(--duration-normal) var(--ease-out);
}

.hover-lift:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.12);
}

/* スケール - 画像、サムネイル */
.hover-scale {
  transition: transform var(--duration-slow) var(--ease-out);
}

.hover-scale:hover {
  transform: scale(1.05);
}

/* グロー - アイコン、ボタン */
.hover-glow {
  transition: box-shadow var(--duration-normal) var(--ease-out);
}

.hover-glow:hover {
  box-shadow: 0 0 20px rgba(0, 113, 227, 0.4);
}

/* プレス - タッチフィードバック */
.press-effect:active {
  transform: scale(0.97);
  transition: transform var(--duration-instant) var(--ease-in);
}
```

## キーフレームアニメーション

### フェード

```css
/* フェードイン */
@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/* フェードイン + 上昇 */
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* フェードイン + 下降 */
@keyframes fade-in-down {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* フェードアウト */
@keyframes fade-out {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
```

### スケール

```css
/* スケールイン */
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

/* スケールアウト */
@keyframes scale-out {
  from {
    opacity: 1;
    transform: scale(1);
  }
  to {
    opacity: 0;
    transform: scale(0.95);
  }
}

/* ポップイン（スプリング） */
@keyframes pop-in {
  0% {
    opacity: 0;
    transform: scale(0.8);
  }
  70% {
    transform: scale(1.05);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
}
```

### スライド

```css
/* 左からスライドイン */
@keyframes slide-in-left {
  from {
    opacity: 0;
    transform: translateX(-100%);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

/* 右からスライドイン */
@keyframes slide-in-right {
  from {
    opacity: 0;
    transform: translateX(100%);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

/* 下からスライドイン（モーダル用） */
@keyframes slide-in-bottom {
  from {
    opacity: 0;
    transform: translateY(100px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

### 特殊効果

```css
/* シマー（ローディング） */
@keyframes shimmer {
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
    var(--color-background-secondary) 25%,
    var(--color-background-tertiary) 50%,
    var(--color-background-secondary) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}

/* パルス */
@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

/* スピン */
@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

/* フロート（ヒーロー画像用） */
@keyframes float {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
}
```

## スクロールアニメーション

### Intersection Observer パターン

```css
/* 初期状態 */
.scroll-reveal {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.6s var(--ease-out),
              transform 0.6s var(--ease-out);
}

/* 表示時 */
.scroll-reveal.is-visible {
  opacity: 1;
  transform: translateY(0);
}

/* 遅延バリエーション */
.scroll-reveal:nth-child(1) { transition-delay: 0ms; }
.scroll-reveal:nth-child(2) { transition-delay: 100ms; }
.scroll-reveal:nth-child(3) { transition-delay: 200ms; }
.scroll-reveal:nth-child(4) { transition-delay: 300ms; }
```

```javascript
// JavaScript 実装
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('is-visible');
    }
  });
}, observerOptions);

document.querySelectorAll('.scroll-reveal').forEach(el => {
  observer.observe(el);
});
```

### CSS スクロールドリブン（モダンブラウザ）

```css
@supports (animation-timeline: scroll()) {
  .parallax-element {
    animation: parallax linear;
    animation-timeline: scroll();
  }

  @keyframes parallax {
    from {
      transform: translateY(0);
    }
    to {
      transform: translateY(-100px);
    }
  }
}
```

## ページ遷移

### フェード遷移

```css
/* View Transitions API */
@view-transition {
  navigation: auto;
}

::view-transition-old(root) {
  animation: fade-out 0.3s var(--ease-in);
}

::view-transition-new(root) {
  animation: fade-in 0.3s var(--ease-out);
}

/* 要素固有の遷移 */
.hero-image {
  view-transition-name: hero;
}

::view-transition-old(hero),
::view-transition-new(hero) {
  animation-duration: 0.5s;
}
```

## ローディング

### スピナー

```html
<div class="spinner" aria-label="読み込み中"></div>
```

```css
.spinner {
  width: 24px;
  height: 24px;
  border: 2px solid var(--color-background-tertiary);
  border-top-color: var(--color-blue);
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

/* Apple 風スピナー（12本のバー） */
.apple-spinner {
  position: relative;
  width: 24px;
  height: 24px;
}

.apple-spinner span {
  position: absolute;
  top: 0;
  left: 50%;
  width: 2px;
  height: 6px;
  margin-left: -1px;
  background: var(--color-label);
  border-radius: 1px;
  transform-origin: center 12px;
  opacity: 0.25;
  animation: apple-spin 1s linear infinite;
}

.apple-spinner span:nth-child(1)  { transform: rotate(0deg);   animation-delay: 0s; }
.apple-spinner span:nth-child(2)  { transform: rotate(30deg);  animation-delay: 0.083s; }
.apple-spinner span:nth-child(3)  { transform: rotate(60deg);  animation-delay: 0.166s; }
.apple-spinner span:nth-child(4)  { transform: rotate(90deg);  animation-delay: 0.25s; }
.apple-spinner span:nth-child(5)  { transform: rotate(120deg); animation-delay: 0.333s; }
.apple-spinner span:nth-child(6)  { transform: rotate(150deg); animation-delay: 0.416s; }
.apple-spinner span:nth-child(7)  { transform: rotate(180deg); animation-delay: 0.5s; }
.apple-spinner span:nth-child(8)  { transform: rotate(210deg); animation-delay: 0.583s; }
.apple-spinner span:nth-child(9)  { transform: rotate(240deg); animation-delay: 0.666s; }
.apple-spinner span:nth-child(10) { transform: rotate(270deg); animation-delay: 0.75s; }
.apple-spinner span:nth-child(11) { transform: rotate(300deg); animation-delay: 0.833s; }
.apple-spinner span:nth-child(12) { transform: rotate(330deg); animation-delay: 0.916s; }

@keyframes apple-spin {
  0% { opacity: 1; }
  100% { opacity: 0.25; }
}
```

### プログレスバー

```css
.progress-bar {
  height: 4px;
  background: var(--color-background-tertiary);
  border-radius: 2px;
  overflow: hidden;
}

.progress-bar-fill {
  height: 100%;
  background: var(--color-blue);
  border-radius: 2px;
  transition: width 0.3s var(--ease-out);
}

/* 不確定プログレス */
.progress-bar-indeterminate .progress-bar-fill {
  width: 30%;
  animation: indeterminate 1.5s var(--ease-in-out) infinite;
}

@keyframes indeterminate {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(400%);
  }
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

  .scroll-reveal {
    opacity: 1;
    transform: none;
  }
}
```

## ベストプラクティス

### DO（推奨）

- 0.3秒を標準のデュレーションとして使用
- ease-out を出現アニメーションに使用
- transform と opacity のみをアニメーション（GPU 最適化）
- アニメーションには明確な目的を持たせる
- prefers-reduced-motion に対応する

### DON'T（非推奨）

- 1秒を超えるアニメーション
- レイアウトプロパティ（width, height, top, left）のアニメーション
- 過度なバウンスやスプリング効果
- 意味のないアニメーション
- 同時に多数のアニメーションを実行
