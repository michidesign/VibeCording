# Spindle カラーシステム

Spindle のカラーシステムは、WCAG 2.1 達成基準 1.4.3 に基づき、十分なコントラスト比を確保するよう設計されています。

## カラーパレット

### プライマリグリーン（Primary Green）

Ameba のブランドカラーであるグリーンを基調としたカラーです。

| トークン | HEX | 用途 |
|---------|-----|------|
| `--color-primary-50` | `#41ad4f` | ホバー状態、明るいアクセント |
| `--color-primary-70` | `#298737` | メインアクション、プライマリボタン |
| `--color-primary-80` | `#237b31` | プレス状態、強調テキスト |

```css
:root {
  --color-primary-50: #41ad4f;
  --color-primary-70: #298737;
  --color-primary-80: #237b31;
}
```

### セカンダリグリーン（Secondary Green）

補助的なアクセントとして使用するグリーンのバリエーションです。

| トークン | HEX | 用途 |
|---------|-----|------|
| `--color-secondary-50` | `#82be28` | ライトアクセント、タグ |
| `--color-secondary-70` | `#5e9b15` | セカンダリアクション |
| `--color-secondary-80` | `#477d00` | 強調、アイコン |

```css
:root {
  --color-secondary-50: #82be28;
  --color-secondary-70: #5e9b15;
  --color-secondary-80: #477d00;
}
```

### グレースケール（Grayscale）

テキストや背景に使用するニュートラルカラーです。

| トークン | HEX | 用途 |
|---------|-----|------|
| `--color-gray-100` | `#08121a` | メインテキスト、見出し |
| `--color-gray-90` | `#141e25` | 本文テキスト |
| `--color-gray-80` | `#394148` | サブテキスト |
| `--color-gray-70` | `#464d53` | プレースホルダー |
| `--color-gray-60` | `#686e73` | 無効状態、補助テキスト |
| `--color-gray-50` | `#8d9196` | ボーダー、区切り線 |
| `--color-gray-40` | `#b3b6b9` | 薄いボーダー |
| `--color-gray-30` | `#d4d6d8` | 背景ホバー |
| `--color-gray-20` | `#e5e7e8` | 薄い背景 |
| `--color-gray-10` | `#eff0f0` | カード背景 |
| `--color-gray-5` | `#f5f6f6` | ページ背景 |

```css
:root {
  --color-gray-100: #08121a;
  --color-gray-90: #141e25;
  --color-gray-80: #394148;
  --color-gray-70: #464d53;
  --color-gray-60: #686e73;
  --color-gray-50: #8d9196;
  --color-gray-40: #b3b6b9;
  --color-gray-30: #d4d6d8;
  --color-gray-20: #e5e7e8;
  --color-gray-10: #eff0f0;
  --color-gray-5: #f5f6f6;
}
```

### アクセントカラー（Accent Colors）

特定の目的に使用するアクセントカラーです。

| トークン | HEX | 用途 |
|---------|-----|------|
| `--color-focus` | `#0091ff` | フォーカスリング、リンク |
| `--color-caution` | `#d91c0b` | エラー、警告、削除 |
| `--color-highlight` | `#f5e100` | ハイライト、注目 |
| `--color-info` | `#0091ff` | 情報、ヘルプ |
| `--color-success` | `#298737` | 成功、完了 |
| `--color-warning` | `#e67700` | 警告、注意 |

```css
:root {
  --color-focus: #0091ff;
  --color-caution: #d91c0b;
  --color-highlight: #f5e100;
  --color-info: #0091ff;
  --color-success: #298737;
  --color-warning: #e67700;
}
```

## セマンティックカラー

### ライトテーマ

```css
:root {
  /* 背景 */
  --color-background-primary: #ffffff;
  --color-background-secondary: #f5f6f6;
  --color-background-tertiary: #eff0f0;

  /* テキスト */
  --color-text-primary: #08121a;
  --color-text-secondary: #394148;
  --color-text-tertiary: #686e73;
  --color-text-disabled: #8d9196;

  /* ボーダー */
  --color-border-primary: #d4d6d8;
  --color-border-secondary: #e5e7e8;

  /* インタラクティブ */
  --color-interactive-primary: #298737;
  --color-interactive-primary-hover: #237b31;
  --color-interactive-primary-active: #237b31;
}
```

### ダークテーマ

```css
@media (prefers-color-scheme: dark) {
  :root {
    /* 背景 */
    --color-background-primary: #08121a;
    --color-background-secondary: #141e25;
    --color-background-tertiary: #1f2a32;

    /* テキスト */
    --color-text-primary: #f5f6f6;
    --color-text-secondary: #d4d6d8;
    --color-text-tertiary: #8d9196;
    --color-text-disabled: #686e73;

    /* ボーダー */
    --color-border-primary: #394148;
    --color-border-secondary: #464d53;

    /* インタラクティブ */
    --color-interactive-primary: #41ad4f;
    --color-interactive-primary-hover: #4fbf5d;
    --color-interactive-primary-active: #298737;
  }
}
```

## コントラスト比ガイドライン

WCAG 2.1 AA レベルに準拠するためのコントラスト比：

### テキスト

- **通常テキスト（14px以下）**: 4.5:1 以上
- **大きなテキスト（18px以上、または14px太字）**: 3:1 以上

### 推奨される組み合わせ

| 背景 | テキスト | コントラスト比 |
|------|---------|---------------|
| `#ffffff` | `#08121a` | 18.6:1 |
| `#ffffff` | `#394148` | 10.2:1 |
| `#ffffff` | `#298737` | 4.6:1 |
| `#f5f6f6` | `#08121a` | 17.3:1 |
| `#298737` | `#ffffff` | 4.6:1 |

### 避けるべき組み合わせ

- 薄いグレーの背景に薄いグレーのテキスト
- グリーンの背景に赤いテキスト
- 同系色の組み合わせ（コントラスト不足）

## 使用例

### ボタンカラー

```css
/* プライマリボタン */
.btn-primary {
  background-color: var(--color-primary-70);
  color: #ffffff;
}

.btn-primary:hover {
  background-color: var(--color-primary-80);
}

/* セカンダリボタン */
.btn-secondary {
  background-color: transparent;
  color: var(--color-primary-70);
  border: 1px solid var(--color-primary-70);
}

/* 危険ボタン */
.btn-danger {
  background-color: var(--color-caution);
  color: #ffffff;
}
```

### ステータスカラー

```css
.status-success {
  color: var(--color-success);
  background-color: rgba(41, 135, 55, 0.1);
}

.status-warning {
  color: var(--color-warning);
  background-color: rgba(230, 119, 0, 0.1);
}

.status-error {
  color: var(--color-caution);
  background-color: rgba(217, 28, 11, 0.1);
}

.status-info {
  color: var(--color-info);
  background-color: rgba(0, 145, 255, 0.1);
}
```

### フォーカスリング

```css
:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}
```
