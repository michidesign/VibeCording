# Atlassian カラーシステム

Atlassian のカラーパレットは、製品全体で一貫した色使用を実現するために設計されています。WCAG 2.1 AA に準拠し、適切なコントラストを確保しています。

## カラーパレット

### Blue（プライマリ）

認証、接続、進行状況を示すために使用されます。ボタン、リンク、ナビゲーション、プログレストラッカーに使用。

| トークン | HEX | 用途 |
|---------|-----|------|
| B50 | `#DEEBFF` | 背景（選択状態） |
| B75 | `#B3D4FF` | 背景（ホバー） |
| B100 | `#4C9AFF` | フォーカスリング |
| B200 | `#2684FF` | リンク（ホバー） |
| B300 | `#0065FF` | ボタン（ホバー） |
| B400 | `#0052CC` | **プライマリカラー** |
| B500 | `#0747A6` | ボタン（プレス） |
| B600 | `#0A3D7C` | ダーク |
| B700 | `#0D2B5C` | 最ダーク |

### Neutral

テキスト、背景、ボーダーに使用される基本カラー。

| トークン | HEX | 用途 |
|---------|-----|------|
| N0 | `#FFFFFF` | ページ背景 |
| N10 | `#FAFBFC` | サブ背景、入力フィールド |
| N20 | `#F4F5F7` | UI背景 |
| N30 | `#EBECF0` | ボーダー（ライト） |
| N40 | `#DFE1E6` | ボーダー |
| N50 | `#C1C7D0` | ボーダー（ダーク） |
| N60 | `#B3BAC5` | プレースホルダー |
| N70 | `#A5ADBA` | 無効テキスト |
| N80 | `#97A0AF` | テキスト（最薄） |
| N90 | `#8993A4` | テキスト（薄） |
| N100 | `#7A869A` | テキスト（サブ） |
| N200 | `#6B778C` | テキスト（セカンダリ） |
| N300 | `#5E6C84` | テキスト |
| N400 | `#505F79` | テキスト |
| N500 | `#42526E` | テキスト |
| N600 | `#344563` | テキスト |
| N700 | `#253858` | テキスト |
| N800 | `#172B4D` | **メインテキスト** |
| N900 | `#091E42` | 見出し |

### Green（成功）

成功、完了、承認を示すために使用。

| トークン | HEX | 用途 |
|---------|-----|------|
| G50 | `#E3FCEF` | 背景 |
| G75 | `#ABF5D1` | 背景（強調） |
| G100 | `#79F2C0` | アイコン |
| G200 | `#57D9A3` | バッジ |
| G300 | `#36B37E` | テキスト（ライト） |
| G400 | `#00875A` | **成功カラー** |
| G500 | `#006644` | テキスト |

### Yellow（警告）

注意、警告を示すために使用。

| トークン | HEX | 用途 |
|---------|-----|------|
| Y50 | `#FFFAE6` | 背景 |
| Y75 | `#FFF0B3` | 背景（強調） |
| Y100 | `#FFE380` | アイコン |
| Y200 | `#FFC400` | バッジ |
| Y300 | `#FFAB00` | テキスト（ライト） |
| Y400 | `#FF991F` | **警告カラー** |
| Y500 | `#FF8B00` | テキスト |

### Red（危険/エラー）

エラー、削除、危険を示すために使用。

| トークン | HEX | 用途 |
|---------|-----|------|
| R50 | `#FFEBE6` | 背景 |
| R75 | `#FFBDAD` | 背景（強調） |
| R100 | `#FF8F73` | アイコン |
| R200 | `#FF7452` | バッジ |
| R300 | `#FF5630` | テキスト（ライト） |
| R400 | `#DE350B` | **エラーカラー** |
| R500 | `#BF2600` | テキスト |

### Teal（情報）

情報、新機能を示すために使用。

| トークン | HEX | 用途 |
|---------|-----|------|
| T50 | `#E6FCFF` | 背景 |
| T75 | `#B3F5FF` | 背景（強調） |
| T100 | `#79E2F2` | アイコン |
| T200 | `#00C7E6` | バッジ |
| T300 | `#00B8D9` | テキスト（ライト） |
| T400 | `#00A3BF` | **情報カラー** |
| T500 | `#008DA6` | テキスト |

### Purple（新規/発見）

新機能、発見を示すために使用。

| トークン | HEX | 用途 |
|---------|-----|------|
| P50 | `#EAE6FF` | 背景 |
| P75 | `#C0B6F2` | 背景（強調） |
| P100 | `#998DD9` | アイコン |
| P200 | `#8777D9` | バッジ |
| P300 | `#6554C0` | テキスト（ライト） |
| P400 | `#5243AA` | **パープルカラー** |
| P500 | `#403294` | テキスト |

## セマンティックカラートークン

### テキストカラー

```css
--color-text: #172B4D;              /* メインテキスト */
--color-text-subtle: #6B778C;       /* セカンダリテキスト */
--color-text-subtlest: #97A0AF;     /* 補助テキスト */
--color-text-disabled: #A5ADBA;     /* 無効テキスト */
--color-text-inverse: #FFFFFF;      /* 反転テキスト */
--color-text-brand: #0052CC;        /* ブランドテキスト */
--color-text-selected: #0052CC;     /* 選択テキスト */
--color-text-success: #006644;      /* 成功テキスト */
--color-text-warning: #FF8B00;      /* 警告テキスト */
--color-text-danger: #DE350B;       /* 危険テキスト */
--color-text-information: #0052CC;  /* 情報テキスト */
```

### 背景カラー

```css
--color-background-neutral: #F4F5F7;           /* 中立背景 */
--color-background-neutral-subtle: #FAFBFC;    /* 薄い中立背景 */
--color-background-neutral-bold: #DFE1E6;      /* 強い中立背景 */
--color-background-selected: #DEEBFF;          /* 選択背景 */
--color-background-selected-bold: #0052CC;     /* 強い選択背景 */
--color-background-brand-bold: #0052CC;        /* ブランド背景 */
--color-background-success: #E3FCEF;           /* 成功背景 */
--color-background-success-bold: #00875A;      /* 強い成功背景 */
--color-background-warning: #FFFAE6;           /* 警告背景 */
--color-background-warning-bold: #FF991F;      /* 強い警告背景 */
--color-background-danger: #FFEBE6;            /* 危険背景 */
--color-background-danger-bold: #DE350B;       /* 強い危険背景 */
--color-background-information: #DEEBFF;       /* 情報背景 */
--color-background-input: #FAFBFC;             /* 入力背景 */
--color-background-input-hovered: #EBECF0;     /* 入力背景（ホバー） */
```

### ボーダーカラー

```css
--color-border: #DFE1E6;               /* 標準ボーダー */
--color-border-bold: #97A0AF;          /* 強いボーダー */
--color-border-focused: #4C9AFF;       /* フォーカスボーダー */
--color-border-selected: #0052CC;      /* 選択ボーダー */
--color-border-success: #00875A;       /* 成功ボーダー */
--color-border-warning: #FF991F;       /* 警告ボーダー */
--color-border-danger: #DE350B;        /* 危険ボーダー */
--color-border-disabled: #F4F5F7;      /* 無効ボーダー */
```

### インタラクションカラー

```css
--color-interaction-hovered: rgba(9, 30, 66, 0.04);  /* ホバー */
--color-interaction-pressed: rgba(9, 30, 66, 0.08);  /* プレス */
--color-brand-bold: #0052CC;                          /* プライマリ */
--color-brand-boldHovered: #0065FF;                   /* プライマリ（ホバー） */
--color-brand-boldPressed: #0747A6;                   /* プライマリ（プレス） */
```

## ダークモード対応

```css
@media (prefers-color-scheme: dark) {
  :root {
    /* テキスト */
    --color-text: #B6C2CF;
    --color-text-subtle: #9FADBC;
    --color-text-subtlest: #8C9BAB;
    --color-text-inverse: #1D2125;

    /* 背景 */
    --color-background-neutral: #22272B;
    --color-background-neutral-subtle: #1D2125;
    --color-background-selected: #1C2B41;

    /* ボーダー */
    --color-border: #A6C5E229;
    --color-border-bold: #738496;

    /* ブランド */
    --color-brand-bold: #579DFF;
    --color-brand-boldHovered: #85B8FF;
    --color-brand-boldPressed: #388BFF;
  }
}
```

## 使用例

### ステータスバッジ

```css
.status-badge {
  display: inline-flex;
  align-items: center;
  padding: 2px 8px;
  border-radius: 3px;
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
}

.status-badge--success {
  background-color: var(--color-background-success);
  color: var(--color-text-success);
}

.status-badge--warning {
  background-color: var(--color-background-warning);
  color: var(--color-text-warning);
}

.status-badge--danger {
  background-color: var(--color-background-danger);
  color: var(--color-text-danger);
}

.status-badge--info {
  background-color: var(--color-background-information);
  color: var(--color-text-information);
}
```

### フォーカスリング

```css
.focusable:focus-visible {
  outline: 2px solid var(--color-border-focused);
  outline-offset: 2px;
}
```

## アクセシビリティガイドライン

### 最小コントラスト比

| 要素 | 最小比率 |
|------|---------|
| 通常テキスト（14px未満） | 4.5:1 |
| 大きいテキスト（14px以上太字、18px以上） | 3:1 |
| アイコン・グラフィック | 3:1 |
| フォーカスインジケータ | 3:1 |

### 推奨の組み合わせ

| 背景 | テキスト | コントラスト比 |
|------|---------|---------------|
| N0 (#FFFFFF) | N800 (#172B4D) | 12.6:1 |
| N0 (#FFFFFF) | N200 (#6B778C) | 4.9:1 |
| B400 (#0052CC) | N0 (#FFFFFF) | 7.4:1 |
| G400 (#00875A) | N0 (#FFFFFF) | 4.5:1 |
| R400 (#DE350B) | N0 (#FFFFFF) | 4.5:1 |
