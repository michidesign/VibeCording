# Material Design カラーシステム

Material Design 3 (Material You) に基づいたカラーシステムの完全なリファレンス。

## カラースキーム

### ベースラインカラー

```css
:root {
  /* Primary */
  --md-sys-color-primary: #6750A4;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-primary-container: #EADDFF;
  --md-sys-color-on-primary-container: #21005D;

  /* Secondary */
  --md-sys-color-secondary: #625B71;
  --md-sys-color-on-secondary: #FFFFFF;
  --md-sys-color-secondary-container: #E8DEF8;
  --md-sys-color-on-secondary-container: #1D192B;

  /* Tertiary */
  --md-sys-color-tertiary: #7D5260;
  --md-sys-color-on-tertiary: #FFFFFF;
  --md-sys-color-tertiary-container: #FFD8E4;
  --md-sys-color-on-tertiary-container: #31111D;

  /* Error */
  --md-sys-color-error: #B3261E;
  --md-sys-color-on-error: #FFFFFF;
  --md-sys-color-error-container: #F9DEDC;
  --md-sys-color-on-error-container: #410E0B;

  /* Background & Surface */
  --md-sys-color-background: #FFFBFE;
  --md-sys-color-on-background: #1C1B1F;
  --md-sys-color-surface: #FFFBFE;
  --md-sys-color-on-surface: #1C1B1F;

  /* Surface Variants */
  --md-sys-color-surface-variant: #E7E0EC;
  --md-sys-color-on-surface-variant: #49454F;

  /* Outline */
  --md-sys-color-outline: #79747E;
  --md-sys-color-outline-variant: #CAC4D0;

  /* Inverse */
  --md-sys-color-inverse-surface: #313033;
  --md-sys-color-inverse-on-surface: #F4EFF4;
  --md-sys-color-inverse-primary: #D0BCFF;
}
```

### ダークテーマ

```css
@media (prefers-color-scheme: dark) {
  :root {
    /* Primary */
    --md-sys-color-primary: #D0BCFF;
    --md-sys-color-on-primary: #381E72;
    --md-sys-color-primary-container: #4F378B;
    --md-sys-color-on-primary-container: #EADDFF;

    /* Secondary */
    --md-sys-color-secondary: #CCC2DC;
    --md-sys-color-on-secondary: #332D41;
    --md-sys-color-secondary-container: #4A4458;
    --md-sys-color-on-secondary-container: #E8DEF8;

    /* Tertiary */
    --md-sys-color-tertiary: #EFB8C8;
    --md-sys-color-on-tertiary: #492532;
    --md-sys-color-tertiary-container: #633B48;
    --md-sys-color-on-tertiary-container: #FFD8E4;

    /* Error */
    --md-sys-color-error: #F2B8B5;
    --md-sys-color-on-error: #601410;
    --md-sys-color-error-container: #8C1D18;
    --md-sys-color-on-error-container: #F9DEDC;

    /* Background & Surface */
    --md-sys-color-background: #1C1B1F;
    --md-sys-color-on-background: #E6E1E5;
    --md-sys-color-surface: #1C1B1F;
    --md-sys-color-on-surface: #E6E1E5;

    /* Surface Variants */
    --md-sys-color-surface-variant: #49454F;
    --md-sys-color-on-surface-variant: #CAC4D0;

    /* Outline */
    --md-sys-color-outline: #938F99;
    --md-sys-color-outline-variant: #49454F;

    /* Inverse */
    --md-sys-color-inverse-surface: #E6E1E5;
    --md-sys-color-inverse-on-surface: #313033;
    --md-sys-color-inverse-primary: #6750A4;
  }
}
```

## Google ブランドカラー

```css
:root {
  /* Google Primary Colors */
  --google-blue: #4285F4;
  --google-red: #EA4335;
  --google-yellow: #FBBC05;
  --google-green: #34A853;

  /* Google Blue Palette */
  --google-blue-50: #E8F0FE;
  --google-blue-100: #D2E3FC;
  --google-blue-200: #AECBFA;
  --google-blue-300: #8AB4F8;
  --google-blue-400: #669DF6;
  --google-blue-500: #4285F4;
  --google-blue-600: #1A73E8;
  --google-blue-700: #1967D2;
  --google-blue-800: #185ABC;
  --google-blue-900: #174EA6;

  /* Gray Palette */
  --google-gray-50: #F8F9FA;
  --google-gray-100: #F1F3F4;
  --google-gray-200: #E8EAED;
  --google-gray-300: #DADCE0;
  --google-gray-400: #BDC1C6;
  --google-gray-500: #9AA0A6;
  --google-gray-600: #80868B;
  --google-gray-700: #5F6368;
  --google-gray-800: #3C4043;
  --google-gray-900: #202124;
}
```

## サーフェスエレベーション

Material Design ではエレベーション（高さ）によってサーフェスの階層を表現します。

```css
:root {
  /* Surface Tones (Elevation Overlay) */
  --md-sys-color-surface-dim: #DED8E1;
  --md-sys-color-surface-bright: #FFFBFE;

  /* Surface Container */
  --md-sys-color-surface-container-lowest: #FFFFFF;
  --md-sys-color-surface-container-low: #F7F2FA;
  --md-sys-color-surface-container: #F3EDF7;
  --md-sys-color-surface-container-high: #ECE6F0;
  --md-sys-color-surface-container-highest: #E6E0E9;
}

/* ダークモード */
@media (prefers-color-scheme: dark) {
  :root {
    --md-sys-color-surface-dim: #141218;
    --md-sys-color-surface-bright: #3B383E;

    --md-sys-color-surface-container-lowest: #0F0D13;
    --md-sys-color-surface-container-low: #1D1B20;
    --md-sys-color-surface-container: #211F26;
    --md-sys-color-surface-container-high: #2B2930;
    --md-sys-color-surface-container-highest: #36343B;
  }
}
```

## ステートレイヤー

インタラクション状態を表現するためのオーバーレイ。

```css
:root {
  /* State Layer Opacity */
  --md-sys-state-hover-opacity: 0.08;
  --md-sys-state-focus-opacity: 0.12;
  --md-sys-state-pressed-opacity: 0.12;
  --md-sys-state-dragged-opacity: 0.16;
}

/* State Layer Mixin */
.state-layer {
  position: relative;
}

.state-layer::before {
  content: '';
  position: absolute;
  inset: 0;
  background: currentColor;
  opacity: 0;
  transition: opacity 200ms cubic-bezier(0.2, 0, 0, 1);
  pointer-events: none;
  border-radius: inherit;
}

.state-layer:hover::before {
  opacity: var(--md-sys-state-hover-opacity);
}

.state-layer:focus-visible::before {
  opacity: var(--md-sys-state-focus-opacity);
}

.state-layer:active::before {
  opacity: var(--md-sys-state-pressed-opacity);
}
```

## カスタムテーマの作成

### Primary カラーからテーマを生成

```css
/* カスタムテーマ例: Blue テーマ */
:root[data-theme="blue"] {
  --md-sys-color-primary: #1A73E8;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-primary-container: #D3E3FD;
  --md-sys-color-on-primary-container: #041E49;
}

/* カスタムテーマ例: Green テーマ */
:root[data-theme="green"] {
  --md-sys-color-primary: #1E8E3E;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-primary-container: #C4EED0;
  --md-sys-color-on-primary-container: #002109;
}

/* カスタムテーマ例: Orange テーマ */
:root[data-theme="orange"] {
  --md-sys-color-primary: #E8710A;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-primary-container: #FFDCC4;
  --md-sys-color-on-primary-container: #2D1600;
}
```

## セマンティックカラーの使用

```css
/* テキストカラー */
.text-primary {
  color: var(--md-sys-color-on-background);
}

.text-secondary {
  color: var(--md-sys-color-on-surface-variant);
}

.text-disabled {
  color: var(--md-sys-color-on-surface);
  opacity: 0.38;
}

/* 背景カラー */
.bg-surface {
  background-color: var(--md-sys-color-surface);
}

.bg-surface-variant {
  background-color: var(--md-sys-color-surface-variant);
}

.bg-primary {
  background-color: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
}

/* ボーダーカラー */
.border-outline {
  border-color: var(--md-sys-color-outline);
}

.border-outline-variant {
  border-color: var(--md-sys-color-outline-variant);
}
```

## アクセシビリティ

### コントラスト比

| 組み合わせ | コントラスト比 |
|-----------|---------------|
| on-primary / primary | 4.5:1 以上 |
| on-surface / surface | 4.5:1 以上 |
| on-background / background | 4.5:1 以上 |
| on-error / error | 4.5:1 以上 |

### カラーのみに依存しない

```css
/* エラー状態の例 */
.input-error {
  border-color: var(--md-sys-color-error);
  /* アイコンやテキストでも状態を伝える */
}

.input-error::before {
  content: '⚠️';
  margin-right: 8px;
}
```

## ベストプラクティス

### DO（推奨）

- CSS変数でカラーを管理
- on-* カラーを対応するコンテナと組み合わせる
- Surface Container でエレベーションを表現
- ステートレイヤーでインタラクションを示す

### DON'T（非推奨）

- ハードコードされたカラー値
- on-* カラーを誤ったコンテナに使用
- 不十分なコントラスト比
- カラーのみで状態を伝える
