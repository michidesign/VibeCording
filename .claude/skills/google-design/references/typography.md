# Material Design タイポグラフィシステム

Material Design 3 に基づいたタイポグラフィシステムの完全なリファレンス。

## フォントファミリー

### Google Fonts

```css
/* Google Fonts のインポート */
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Google+Sans:wght@400;500;700&family=Noto+Sans+JP:wght@300;400;500;700&display=swap');

:root {
  /* プライマリフォント */
  --md-sys-typescale-font: 'Roboto', 'Noto Sans JP', sans-serif;

  /* ブランドフォント（見出し用） */
  --md-sys-typescale-brand: 'Google Sans', 'Roboto', 'Noto Sans JP', sans-serif;

  /* 等幅フォント */
  --md-sys-typescale-mono: 'Roboto Mono', 'Noto Sans Mono', monospace;
}
```

### フォントスタック

```css
body {
  font-family: var(--md-sys-typescale-font);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

## タイプスケール

Material Design 3 の公式タイプスケール。

### Display

大きな短いテキスト（ヒーロー、プロモーション）向け。

```css
:root {
  /* Display Large */
  --md-sys-typescale-display-large-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-display-large-size: 57px;
  --md-sys-typescale-display-large-line-height: 64px;
  --md-sys-typescale-display-large-weight: 400;
  --md-sys-typescale-display-large-tracking: -0.25px;

  /* Display Medium */
  --md-sys-typescale-display-medium-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-display-medium-size: 45px;
  --md-sys-typescale-display-medium-line-height: 52px;
  --md-sys-typescale-display-medium-weight: 400;
  --md-sys-typescale-display-medium-tracking: 0px;

  /* Display Small */
  --md-sys-typescale-display-small-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-display-small-size: 36px;
  --md-sys-typescale-display-small-line-height: 44px;
  --md-sys-typescale-display-small-weight: 400;
  --md-sys-typescale-display-small-tracking: 0px;
}

.display-large {
  font-family: var(--md-sys-typescale-display-large-font);
  font-size: var(--md-sys-typescale-display-large-size);
  line-height: var(--md-sys-typescale-display-large-line-height);
  font-weight: var(--md-sys-typescale-display-large-weight);
  letter-spacing: var(--md-sys-typescale-display-large-tracking);
}

.display-medium {
  font-family: var(--md-sys-typescale-display-medium-font);
  font-size: var(--md-sys-typescale-display-medium-size);
  line-height: var(--md-sys-typescale-display-medium-line-height);
  font-weight: var(--md-sys-typescale-display-medium-weight);
  letter-spacing: var(--md-sys-typescale-display-medium-tracking);
}

.display-small {
  font-family: var(--md-sys-typescale-display-small-font);
  font-size: var(--md-sys-typescale-display-small-size);
  line-height: var(--md-sys-typescale-display-small-line-height);
  font-weight: var(--md-sys-typescale-display-small-weight);
  letter-spacing: var(--md-sys-typescale-display-small-tracking);
}
```

### Headline

ページセクションの見出し向け。

```css
:root {
  /* Headline Large */
  --md-sys-typescale-headline-large-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-headline-large-size: 32px;
  --md-sys-typescale-headline-large-line-height: 40px;
  --md-sys-typescale-headline-large-weight: 400;
  --md-sys-typescale-headline-large-tracking: 0px;

  /* Headline Medium */
  --md-sys-typescale-headline-medium-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-headline-medium-size: 28px;
  --md-sys-typescale-headline-medium-line-height: 36px;
  --md-sys-typescale-headline-medium-weight: 400;
  --md-sys-typescale-headline-medium-tracking: 0px;

  /* Headline Small */
  --md-sys-typescale-headline-small-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-headline-small-size: 24px;
  --md-sys-typescale-headline-small-line-height: 32px;
  --md-sys-typescale-headline-small-weight: 400;
  --md-sys-typescale-headline-small-tracking: 0px;
}

.headline-large {
  font-family: var(--md-sys-typescale-headline-large-font);
  font-size: var(--md-sys-typescale-headline-large-size);
  line-height: var(--md-sys-typescale-headline-large-line-height);
  font-weight: var(--md-sys-typescale-headline-large-weight);
  letter-spacing: var(--md-sys-typescale-headline-large-tracking);
}

.headline-medium {
  font-family: var(--md-sys-typescale-headline-medium-font);
  font-size: var(--md-sys-typescale-headline-medium-size);
  line-height: var(--md-sys-typescale-headline-medium-line-height);
  font-weight: var(--md-sys-typescale-headline-medium-weight);
  letter-spacing: var(--md-sys-typescale-headline-medium-tracking);
}

.headline-small {
  font-family: var(--md-sys-typescale-headline-small-font);
  font-size: var(--md-sys-typescale-headline-small-size);
  line-height: var(--md-sys-typescale-headline-small-line-height);
  font-weight: var(--md-sys-typescale-headline-small-weight);
  letter-spacing: var(--md-sys-typescale-headline-small-tracking);
}
```

### Title

カード、ダイアログなどのコンポーネント見出し向け。

```css
:root {
  /* Title Large */
  --md-sys-typescale-title-large-font: var(--md-sys-typescale-brand);
  --md-sys-typescale-title-large-size: 22px;
  --md-sys-typescale-title-large-line-height: 28px;
  --md-sys-typescale-title-large-weight: 400;
  --md-sys-typescale-title-large-tracking: 0px;

  /* Title Medium */
  --md-sys-typescale-title-medium-font: var(--md-sys-typescale-font);
  --md-sys-typescale-title-medium-size: 16px;
  --md-sys-typescale-title-medium-line-height: 24px;
  --md-sys-typescale-title-medium-weight: 500;
  --md-sys-typescale-title-medium-tracking: 0.15px;

  /* Title Small */
  --md-sys-typescale-title-small-font: var(--md-sys-typescale-font);
  --md-sys-typescale-title-small-size: 14px;
  --md-sys-typescale-title-small-line-height: 20px;
  --md-sys-typescale-title-small-weight: 500;
  --md-sys-typescale-title-small-tracking: 0.1px;
}

.title-large {
  font-family: var(--md-sys-typescale-title-large-font);
  font-size: var(--md-sys-typescale-title-large-size);
  line-height: var(--md-sys-typescale-title-large-line-height);
  font-weight: var(--md-sys-typescale-title-large-weight);
  letter-spacing: var(--md-sys-typescale-title-large-tracking);
}

.title-medium {
  font-family: var(--md-sys-typescale-title-medium-font);
  font-size: var(--md-sys-typescale-title-medium-size);
  line-height: var(--md-sys-typescale-title-medium-line-height);
  font-weight: var(--md-sys-typescale-title-medium-weight);
  letter-spacing: var(--md-sys-typescale-title-medium-tracking);
}

.title-small {
  font-family: var(--md-sys-typescale-title-small-font);
  font-size: var(--md-sys-typescale-title-small-size);
  line-height: var(--md-sys-typescale-title-small-line-height);
  font-weight: var(--md-sys-typescale-title-small-weight);
  letter-spacing: var(--md-sys-typescale-title-small-tracking);
}
```

### Body

本文テキスト向け。

```css
:root {
  /* Body Large */
  --md-sys-typescale-body-large-font: var(--md-sys-typescale-font);
  --md-sys-typescale-body-large-size: 16px;
  --md-sys-typescale-body-large-line-height: 24px;
  --md-sys-typescale-body-large-weight: 400;
  --md-sys-typescale-body-large-tracking: 0.5px;

  /* Body Medium */
  --md-sys-typescale-body-medium-font: var(--md-sys-typescale-font);
  --md-sys-typescale-body-medium-size: 14px;
  --md-sys-typescale-body-medium-line-height: 20px;
  --md-sys-typescale-body-medium-weight: 400;
  --md-sys-typescale-body-medium-tracking: 0.25px;

  /* Body Small */
  --md-sys-typescale-body-small-font: var(--md-sys-typescale-font);
  --md-sys-typescale-body-small-size: 12px;
  --md-sys-typescale-body-small-line-height: 16px;
  --md-sys-typescale-body-small-weight: 400;
  --md-sys-typescale-body-small-tracking: 0.4px;
}

.body-large {
  font-family: var(--md-sys-typescale-body-large-font);
  font-size: var(--md-sys-typescale-body-large-size);
  line-height: var(--md-sys-typescale-body-large-line-height);
  font-weight: var(--md-sys-typescale-body-large-weight);
  letter-spacing: var(--md-sys-typescale-body-large-tracking);
}

.body-medium {
  font-family: var(--md-sys-typescale-body-medium-font);
  font-size: var(--md-sys-typescale-body-medium-size);
  line-height: var(--md-sys-typescale-body-medium-line-height);
  font-weight: var(--md-sys-typescale-body-medium-weight);
  letter-spacing: var(--md-sys-typescale-body-medium-tracking);
}

.body-small {
  font-family: var(--md-sys-typescale-body-small-font);
  font-size: var(--md-sys-typescale-body-small-size);
  line-height: var(--md-sys-typescale-body-small-line-height);
  font-weight: var(--md-sys-typescale-body-small-weight);
  letter-spacing: var(--md-sys-typescale-body-small-tracking);
}
```

### Label

ボタン、チップ、入力フィールドなどのUI要素向け。

```css
:root {
  /* Label Large */
  --md-sys-typescale-label-large-font: var(--md-sys-typescale-font);
  --md-sys-typescale-label-large-size: 14px;
  --md-sys-typescale-label-large-line-height: 20px;
  --md-sys-typescale-label-large-weight: 500;
  --md-sys-typescale-label-large-tracking: 0.1px;

  /* Label Medium */
  --md-sys-typescale-label-medium-font: var(--md-sys-typescale-font);
  --md-sys-typescale-label-medium-size: 12px;
  --md-sys-typescale-label-medium-line-height: 16px;
  --md-sys-typescale-label-medium-weight: 500;
  --md-sys-typescale-label-medium-tracking: 0.5px;

  /* Label Small */
  --md-sys-typescale-label-small-font: var(--md-sys-typescale-font);
  --md-sys-typescale-label-small-size: 11px;
  --md-sys-typescale-label-small-line-height: 16px;
  --md-sys-typescale-label-small-weight: 500;
  --md-sys-typescale-label-small-tracking: 0.5px;
}

.label-large {
  font-family: var(--md-sys-typescale-label-large-font);
  font-size: var(--md-sys-typescale-label-large-size);
  line-height: var(--md-sys-typescale-label-large-line-height);
  font-weight: var(--md-sys-typescale-label-large-weight);
  letter-spacing: var(--md-sys-typescale-label-large-tracking);
}

.label-medium {
  font-family: var(--md-sys-typescale-label-medium-font);
  font-size: var(--md-sys-typescale-label-medium-size);
  line-height: var(--md-sys-typescale-label-medium-line-height);
  font-weight: var(--md-sys-typescale-label-medium-weight);
  letter-spacing: var(--md-sys-typescale-label-medium-tracking);
}

.label-small {
  font-family: var(--md-sys-typescale-label-small-font);
  font-size: var(--md-sys-typescale-label-small-size);
  line-height: var(--md-sys-typescale-label-small-line-height);
  font-weight: var(--md-sys-typescale-label-small-weight);
  letter-spacing: var(--md-sys-typescale-label-small-tracking);
}
```

## レスポンシブタイポグラフィ

```css
/* モバイル（600px未満） */
@media (max-width: 599px) {
  .display-large {
    font-size: 36px;
    line-height: 44px;
  }

  .display-medium {
    font-size: 32px;
    line-height: 40px;
  }

  .headline-large {
    font-size: 28px;
    line-height: 36px;
  }
}

/* タブレット（600px〜904px） */
@media (min-width: 600px) and (max-width: 904px) {
  .display-large {
    font-size: 45px;
    line-height: 52px;
  }
}
```

## 日本語対応

```css
/* 日本語フォントの調整 */
:lang(ja) {
  font-feature-settings: "palt" 1;
}

:lang(ja) .body-large,
:lang(ja) .body-medium {
  line-height: 1.75;
}

:lang(ja) .headline-large,
:lang(ja) .headline-medium,
:lang(ja) .headline-small {
  line-height: 1.4;
}
```

## ベストプラクティス

### DO（推奨）

- タイプスケールの役割に合った使い方をする
- letter-spacing を適切に設定
- line-height でリーダビリティを確保
- ウェイトでコントラストを作る

### DON'T（非推奨）

- タイプスケール以外のサイズを使用
- 過度に細い/太いウェイト
- 狭すぎる行間
- 長すぎる行（60〜80文字が理想）
