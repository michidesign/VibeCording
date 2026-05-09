# Apple カラーシステム

Apple のデザインで使用されるカラーパレットの完全なリファレンス。

## 基本カラー

### ニュートラルカラー

| 名前 | Light Mode | Dark Mode | 用途 |
|------|------------|-----------|------|
| Label | `#1d1d1f` | `#f5f5f7` | 主要テキスト |
| Secondary Label | `#86868b` | `#a1a1a6` | 補助テキスト |
| Tertiary Label | `#d2d2d7` | `#424245` | 無効状態のテキスト |
| Background | `#ffffff` | `#000000` | ページ背景 |
| Secondary Background | `#f5f5f7` | `#1d1d1f` | カード・セクション背景 |
| Tertiary Background | `#e8e8ed` | `#2c2c2e` | 入力フィールド背景 |

### セマンティックカラー

```css
:root {
  /* ライトモード */
  --color-label: #1d1d1f;
  --color-label-secondary: #86868b;
  --color-label-tertiary: #d2d2d7;

  --color-background: #ffffff;
  --color-background-secondary: #f5f5f7;
  --color-background-tertiary: #e8e8ed;

  --color-separator: rgba(0, 0, 0, 0.1);
  --color-separator-opaque: #d2d2d7;
}

@media (prefers-color-scheme: dark) {
  :root {
    --color-label: #f5f5f7;
    --color-label-secondary: #a1a1a6;
    --color-label-tertiary: #424245;

    --color-background: #000000;
    --color-background-secondary: #1d1d1f;
    --color-background-tertiary: #2c2c2e;

    --color-separator: rgba(255, 255, 255, 0.1);
    --color-separator-opaque: #424245;
  }
}
```

## アクセントカラー

### システムカラー

| 名前 | Light Mode | Dark Mode | 用途 |
|------|------------|-----------|------|
| Blue | `#0071e3` | `#2997ff` | リンク、CTA |
| Green | `#34c759` | `#30d158` | 成功、確認 |
| Orange | `#ff9500` | `#ff9f0a` | 警告 |
| Red | `#ff3b30` | `#ff453a` | エラー、削除 |
| Purple | `#af52de` | `#bf5af2` | アクセント |
| Pink | `#ff2d55` | `#ff375f` | アクセント |
| Teal | `#5ac8fa` | `#64d2ff` | 情報 |
| Indigo | `#5856d6` | `#5e5ce6` | アクセント |

```css
:root {
  /* ライトモード */
  --color-blue: #0071e3;
  --color-blue-hover: #0077ed;
  --color-green: #34c759;
  --color-orange: #ff9500;
  --color-red: #ff3b30;
  --color-purple: #af52de;
  --color-pink: #ff2d55;
  --color-teal: #5ac8fa;
  --color-indigo: #5856d6;
}

@media (prefers-color-scheme: dark) {
  :root {
    --color-blue: #2997ff;
    --color-blue-hover: #40a9ff;
    --color-green: #30d158;
    --color-orange: #ff9f0a;
    --color-red: #ff453a;
    --color-purple: #bf5af2;
    --color-pink: #ff375f;
    --color-teal: #64d2ff;
    --color-indigo: #5e5ce6;
  }
}
```

## グラデーション

### プロダクトグラデーション

```css
/* iPhone 風グラデーション */
.gradient-iphone {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

/* Mac 風グラデーション */
.gradient-mac {
  background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
}

/* Apple Watch 風グラデーション */
.gradient-watch {
  background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
}

/* Apple TV 風グラデーション */
.gradient-tv {
  background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
}

/* メッシュグラデーション（ヒーロー背景用） */
.gradient-mesh {
  background:
    radial-gradient(at 40% 20%, #af52de 0px, transparent 50%),
    radial-gradient(at 80% 0%, #5e5ce6 0px, transparent 50%),
    radial-gradient(at 0% 50%, #2997ff 0px, transparent 50%),
    radial-gradient(at 80% 50%, #5ac8fa 0px, transparent 50%),
    radial-gradient(at 0% 100%, #34c759 0px, transparent 50%),
    radial-gradient(at 80% 100%, #ff9500 0px, transparent 50%);
  background-color: #1d1d1f;
}
```

### テキストグラデーション

```css
.text-gradient {
  background: linear-gradient(90deg, #af52de 0%, #5e5ce6 50%, #2997ff 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.text-gradient-warm {
  background: linear-gradient(90deg, #ff9500 0%, #ff2d55 50%, #af52de 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
```

## 透明度

### オーバーレイ

```css
/* ライトモード */
--overlay-light: rgba(255, 255, 255, 0.72);
--overlay-medium: rgba(255, 255, 255, 0.85);
--overlay-heavy: rgba(255, 255, 255, 0.95);

/* ダークモード */
--overlay-dark-light: rgba(29, 29, 31, 0.72);
--overlay-dark-medium: rgba(29, 29, 31, 0.85);
--overlay-dark-heavy: rgba(29, 29, 31, 0.95);
```

### ガラスエフェクト

```css
/* 標準ガラス */
.glass {
  background: var(--overlay-light);
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
}

/* 厚いガラス */
.glass-thick {
  background: var(--overlay-medium);
  backdrop-filter: saturate(180%) blur(40px);
  -webkit-backdrop-filter: saturate(180%) blur(40px);
}

/* 薄いガラス */
.glass-thin {
  background: rgba(255, 255, 255, 0.5);
  backdrop-filter: saturate(120%) blur(10px);
  -webkit-backdrop-filter: saturate(120%) blur(10px);
}
```

## カラー使用ガイドライン

### DO（推奨）

- 主要なCTAには Blue を使用
- 成功メッセージには Green を使用
- 警告には Orange、エラーには Red を使用
- テキストは Label カラーを使用
- 背景には Background カラーを使用

### DON'T（非推奨）

- 複数のアクセントカラーを同時に多用しない
- 純粋な黒（#000000）をライトモードのテキストに使用しない
- 彩度の高い色を広い面積に使用しない
- ダークモードでライトモード用の色をそのまま使用しない

## アクセシビリティ

### コントラスト比

| 組み合わせ | Light Mode | Dark Mode |
|-----------|------------|-----------|
| Label on Background | 15.8:1 | 15.8:1 |
| Secondary Label on Background | 4.5:1 | 5.0:1 |
| Blue on Background | 4.5:1 | 5.6:1 |

すべてのテキストは WCAG AA 基準（4.5:1）を満たすこと。
