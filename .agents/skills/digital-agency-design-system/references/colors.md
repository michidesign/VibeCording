# デジタル庁デザインシステム カラーシステム

デジタル庁デザインシステム（DADS）に基づいたカラーシステムの完全なリファレンス。

## カラーパレット

### プライマリカラー（青系）

行政サービスの信頼性と安心感を表現する青を基調としています。

```css
:root {
  --dads-primary-900: #003d78;
  --dads-primary-800: #004c96;
  --dads-primary-700: #005bb4;
  --dads-primary-600: #006bd2;
  --dads-primary-500: #0071c1;  /* メインプライマリ */
  --dads-primary-400: #3d8fd4;
  --dads-primary-300: #6aade7;
  --dads-primary-200: #a3cef2;
  --dads-primary-100: #d1e7f9;
  --dads-primary-50: #e8f3fc;
}
```

| レベル | HEX | 用途 |
|--------|-----|------|
| 900 | #003d78 | 最も濃い青、ホバー時のダーク |
| 800 | #004c96 | リンクホバー |
| 700 | #005bb4 | アクティブ状態 |
| 500 | #0071c1 | **メインプライマリ**（リンク、ボタン） |
| 100 | #d1e7f9 | 背景のハイライト |
| 50 | #e8f3fc | 薄い背景 |

### セカンダリカラー（ティール系）

補助的なアクセントとして使用します。

```css
:root {
  --dads-secondary-700: #006d75;
  --dads-secondary-600: #008a94;
  --dads-secondary-500: #00a7b3;
  --dads-secondary-400: #33b9c2;
  --dads-secondary-300: #66cbd1;
  --dads-secondary-200: #99dde0;
  --dads-secondary-100: #cceeef;
}
```

### ニュートラル（グレースケール）

テキスト、背景、ボーダーに使用します。

```css
:root {
  --dads-neutral-white: #ffffff;
  --dads-neutral-50: #f8f9fa;
  --dads-neutral-100: #f1f3f5;
  --dads-neutral-200: #e9ecef;
  --dads-neutral-300: #dee2e6;
  --dads-neutral-400: #ced4da;
  --dads-neutral-500: #adb5bd;
  --dads-neutral-600: #868e96;
  --dads-neutral-700: #495057;
  --dads-neutral-800: #343a40;
  --dads-neutral-900: #212529;
  --dads-neutral-black: #000000;
}
```

| レベル | 用途 |
|--------|------|
| white | ページ背景、カード背景 |
| 50-100 | セカンダリ背景 |
| 200-300 | ボーダー（薄い） |
| 400-500 | ボーダー（標準）、無効状態 |
| 600 | 補助テキスト |
| 700 | セカンダリテキスト |
| 900 | プライマリテキスト |

### セマンティックカラー

状態を表現するカラーです。

```css
:root {
  /* 成功（緑） */
  --dads-success-light: #d4edda;
  --dads-success: #28a745;
  --dads-success-dark: #1e7e34;

  /* エラー（赤） */
  --dads-error-light: #f8d7da;
  --dads-error: #dc3545;
  --dads-error-dark: #bd2130;

  /* 警告（黄/オレンジ） */
  --dads-warning-light: #fff3cd;
  --dads-warning: #ffc107;
  --dads-warning-dark: #d39e00;

  /* 情報（青） */
  --dads-info-light: #cce5ff;
  --dads-info: #17a2b8;
  --dads-info-dark: #117a8b;
}
```

| 状態 | 用途 |
|------|------|
| 成功 | 完了通知、成功メッセージ |
| エラー | エラーメッセージ、必須マーク、削除 |
| 警告 | 注意喚起、警告メッセージ |
| 情報 | お知らせ、ヒント |

## テキストカラー

```css
:root {
  --dads-text-primary: #212529;      /* メインテキスト */
  --dads-text-secondary: #495057;    /* 補足テキスト */
  --dads-text-muted: #6c757d;        /* 薄いテキスト */
  --dads-text-link: #0071c1;         /* リンク */
  --dads-text-link-hover: #004c96;   /* リンクホバー */
  --dads-text-link-visited: #5c3d9e; /* 訪問済みリンク */
}
```

### リンクの状態

```css
a {
  color: var(--dads-text-link);
  text-decoration: underline;
}

a:hover {
  color: var(--dads-text-link-hover);
}

a:visited {
  color: var(--dads-text-link-visited);
}

a:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
}
```

## 背景カラー

```css
:root {
  --dads-bg-primary: #ffffff;    /* メイン背景 */
  --dads-bg-secondary: #f8f9fa;  /* セカンダリ背景 */
  --dads-bg-tertiary: #e9ecef;   /* ターシャリ背景 */
}
```

## ボーダーカラー

```css
:root {
  --dads-border-light: #dee2e6;    /* 薄いボーダー */
  --dads-border-default: #ced4da;  /* 標準ボーダー */
  --dads-border-dark: #adb5bd;     /* 濃いボーダー */
}
```

## コントラスト比

WCAG 2.2 および JIS X 8341-3:2016 に準拠するためのコントラスト要件。

### 最低要件

| 要素 | 最低コントラスト比 |
|------|-------------------|
| 本文テキスト | 4.5:1 |
| 大きいテキスト（18px Bold / 24px 以上） | 3:1 |
| UIコンポーネント・グラフィック | 3:1 |

### 推奨コントラスト比（AAA）

| 要素 | 推奨コントラスト比 |
|------|-------------------|
| 本文テキスト | 7:1 |
| 大きいテキスト | 4.5:1 |

### カラー組み合わせの検証済み例

| 前景色 | 背景色 | コントラスト比 | 適合レベル |
|--------|--------|---------------|-----------|
| #212529 | #ffffff | 16.1:1 | AAA |
| #495057 | #ffffff | 9.7:1 | AAA |
| #0071c1 | #ffffff | 4.5:1 | AA |
| #ffffff | #0071c1 | 4.5:1 | AA |
| #ffffff | #dc3545 | 4.0:1 | AA（大きいテキスト） |

## カラーの使用ガイドライン

### DO（推奨）

```css
/* 適切なコントラスト */
.text-on-white {
  color: var(--dads-text-primary); /* #212529 on #ffffff = 16.1:1 */
}

/* リンクは下線で識別可能に */
a {
  color: var(--dads-text-link);
  text-decoration: underline;
}

/* エラーは色とアイコンで伝達 */
.error-message {
  color: var(--dads-error);
  display: flex;
  align-items: center;
  gap: 8px;
}

.error-message::before {
  content: "⚠";
}
```

### DON'T（非推奨）

```css
/* ❌ コントラスト不足 */
.bad-contrast {
  color: #adb5bd; /* neutral-500 on white = 2.7:1 */
  background: #ffffff;
}

/* ❌ 色だけで情報を伝達 */
.color-only-error {
  border-color: red; /* テキストやアイコンも必要 */
}

/* ❌ リンクを下線なしで表示 */
a.no-underline {
  text-decoration: none; /* 識別しづらい */
}
```

## ダークモード

行政サービスでのダークモード対応は任意ですが、対応する場合の例：

```css
@media (prefers-color-scheme: dark) {
  :root {
    --dads-text-primary: #f1f3f5;
    --dads-text-secondary: #ced4da;
    --dads-text-muted: #adb5bd;

    --dads-bg-primary: #212529;
    --dads-bg-secondary: #343a40;
    --dads-bg-tertiary: #495057;

    --dads-border-light: #495057;
    --dads-border-default: #6c757d;

    /* リンクは明るい青に */
    --dads-text-link: #6aade7;
    --dads-text-link-hover: #a3cef2;
  }
}
```

## ハイコントラストモード

Windows ハイコントラストモードへの対応：

```css
@media (forced-colors: active) {
  .btn-primary {
    border: 2px solid currentColor;
  }

  a:focus {
    outline: 3px solid currentColor;
  }
}
```

## カラーユーティリティクラス

```css
/* テキストカラー */
.text-primary { color: var(--dads-text-primary); }
.text-secondary { color: var(--dads-text-secondary); }
.text-muted { color: var(--dads-text-muted); }
.text-link { color: var(--dads-text-link); }
.text-success { color: var(--dads-success); }
.text-error { color: var(--dads-error); }
.text-warning { color: var(--dads-warning-dark); }
.text-info { color: var(--dads-info); }

/* 背景カラー */
.bg-primary { background-color: var(--dads-bg-primary); }
.bg-secondary { background-color: var(--dads-bg-secondary); }
.bg-success-light { background-color: var(--dads-success-light); }
.bg-error-light { background-color: var(--dads-error-light); }
.bg-warning-light { background-color: var(--dads-warning-light); }
.bg-info-light { background-color: var(--dads-info-light); }
```
