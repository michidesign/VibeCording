# PayPay カラーシステム

## ブランドカラー

### PayPay レッド

PayPayのプライマリブランドカラー。信頼性と活力を表現。

| 名前 | Hex | RGB | 用途 |
|------|-----|-----|------|
| PayPay Red | `#FF0033` | 255, 0, 51 | プライマリアクション、アクセント |
| PayPay Red Light | `#FF3366` | 255, 51, 102 | ホバー状態、薄いアクセント |
| PayPay Red Dark | `#CC0029` | 204, 0, 41 | プレス状態、強調 |

```css
:root {
  --paypay-red: #FF0033;
  --paypay-red-light: #FF3366;
  --paypay-red-dark: #CC0029;
}
```

## 背景色

クリーンで信頼感のある白ベースの背景。

| 名前 | Hex | 用途 |
|------|-----|------|
| Background | `#FFFFFF` | メイン背景 |
| Background Secondary | `#F5F5F5` | セクション背景、区切り |
| Background Card | `#FFFFFF` | カード背景 |
| Background Overlay | `rgba(0,0,0,0.5)` | モーダル背景 |

```css
:root {
  --color-background: #FFFFFF;
  --color-background-secondary: #F5F5F5;
  --color-background-card: #FFFFFF;
  --color-background-overlay: rgba(0, 0, 0, 0.5);
}
```

## テキストカラー

視認性と可読性を重視したテキストカラー階層。

| 名前 | Hex | コントラスト比 | 用途 |
|------|-----|---------------|------|
| Primary | `#333333` | 12.6:1 | 見出し、本文、金額 |
| Secondary | `#666666` | 5.7:1 | 補助テキスト、説明文 |
| Tertiary | `#999999` | 3.0:1 | プレースホルダー、注釈 |
| Inverse | `#FFFFFF` | - | 赤背景上のテキスト |

```css
:root {
  --color-text-primary: #333333;
  --color-text-secondary: #666666;
  --color-text-tertiary: #999999;
  --color-text-inverse: #FFFFFF;
}
```

## セマンティックカラー

機能的な意味を持つカラー。

| 名前 | Hex | 用途 |
|------|-----|------|
| Success | `#00C853` | 成功、完了、入金 |
| Warning | `#FFB300` | 警告、注意 |
| Error | `#FF3B30` | エラー、失敗、出金 |
| Info | `#007AFF` | 情報、リンク |

```css
:root {
  --color-success: #00C853;
  --color-warning: #FFB300;
  --color-error: #FF3B30;
  --color-info: #007AFF;
}
```

### セマンティックカラーの使用例

```css
/* 成功メッセージ */
.message-success {
  background: rgba(0, 200, 83, 0.1);
  color: var(--color-success);
  border-left: 3px solid var(--color-success);
}

/* エラーメッセージ */
.message-error {
  background: rgba(255, 59, 48, 0.1);
  color: var(--color-error);
  border-left: 3px solid var(--color-error);
}

/* 入金表示 */
.amount-in {
  color: var(--color-success);
}

/* 出金表示 */
.amount-out {
  color: var(--color-error);
}
```

## グレースケール

UIの構造を表現するグレー。

| 名前 | Hex | 用途 |
|------|-----|------|
| Gray 100 | `#F5F5F5` | 背景、区切り |
| Gray 200 | `#EEEEEE` | ボーダー、分割線 |
| Gray 300 | `#DDDDDD` | 非アクティブ |
| Gray 400 | `#CCCCCC` | 薄いボーダー |
| Gray 500 | `#999999` | 非活性テキスト |

```css
:root {
  --color-gray-100: #F5F5F5;
  --color-gray-200: #EEEEEE;
  --color-gray-300: #DDDDDD;
  --color-gray-400: #CCCCCC;
  --color-gray-500: #999999;
}
```

## グラデーション

アクセント要素で使用するグラデーション。

```css
/* PayPayグラデーション（キャンペーンバナー等） */
.gradient-paypay {
  background: linear-gradient(135deg, #FF0033 0%, #FF3366 100%);
}

/* ゴールドグラデーション（特典、プレミアム） */
.gradient-gold {
  background: linear-gradient(135deg, #FFB300 0%, #FFC107 100%);
}

/* クールグラデーション（情報系） */
.gradient-cool {
  background: linear-gradient(135deg, #007AFF 0%, #5AC8FA 100%);
}
```

## 色の使用ガイドライン

### PayPayレッドの使用量

- **アクセントとして限定使用**: 全体の5-10%程度
- **主要アクションのみ**: 「支払う」「チャージ」などの主要ボタン
- **ナビのアクティブ状態**: ボトムナビの選択中アイコン
- **強調表示**: 重要な金額、キャンペーン告知

### 避けるべき使用

- 背景全体を赤にする
- 複数の赤要素を近くに配置
- テキスト本文を赤にする
- エラー表示と混同される使い方

## アクセシビリティ

### コントラスト比（WCAG AA準拠）

| 組み合わせ | コントラスト比 | 判定 |
|-----------|---------------|------|
| #333333 on #FFFFFF | 12.6:1 | 合格 |
| #666666 on #FFFFFF | 5.7:1 | 合格 |
| #FFFFFF on #FF0033 | 4.5:1 | 合格 |
| #999999 on #FFFFFF | 3.0:1 | 大文字のみ |

### カラーブラインドへの配慮

```css
/* 色だけでなくアイコンも併用 */
.status-success::before {
  content: '✓';
  margin-right: 4px;
}

.status-error::before {
  content: '✕';
  margin-right: 4px;
}
```
