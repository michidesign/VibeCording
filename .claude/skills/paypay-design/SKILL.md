---
name: paypay-design
description: PayPay風のモダンで親しみやすい決済アプリUIデザインを作成する。PayPayレッド(#FF0033)をアクセントに、クリーンな白背景、丸みのあるカード、Hiragino Sans/Graphikフォントを活用。決済アプリ、フィンテックUI、キャッシュレスアプリをPayPay風にデザインする際に使用。
---

# PayPay Design System

PayPay の親しみやすく信頼感のあるデザイン哲学に基づいた、モダンでユーザーフレンドリーな決済アプリ UI を作成するためのデザインシステムです。

## このスキルを使用するタイミング

- PayPay風の決済アプリUIを作成するとき
- フィンテック・キャッシュレスアプリのデザインが必要なとき
- 赤をアクセントカラーとした親しみやすいUIを設計するとき
- カード型レイアウトを多用したモバイルアプリを作成するとき
- QRコード決済やポイント機能を含むアプリUIを設計するとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | カラーパレット、PayPayレッド、セマンティックカラー、背景色 |
| [typography.md](references/typography.md) | Hiragino Sans、Graphik、タイプスケール、数字表示 |
| [components.md](references/components.md) | ボタン、カード、バナー、ボトムナビ、QRコード |
| [layout.md](references/layout.md) | グリッドシステム、スペーシング、カードレイアウト |

## デザイン原則

### 1. 親しみやすさ（Approachability）

- 丸みのある要素（角丸ボタン、カード）
- 温かみのある赤をアクセントに使用
- 直感的でシンプルな操作性
- 分かりやすいアイコンと文言

### 2. 視認性・可読性（Visibility）

- 白を基調としたクリーンな背景
- 十分なコントラストを確保
- 大きく読みやすい金額表示
- 情報の優先度を明確にした階層構造

### 3. 信頼感（Trust）

- 一貫したブランドカラーの使用
- 安定感のあるレイアウト
- 明確なフィードバック（成功/エラー）
- セキュリティを感じさせるデザイン

### 4. スピード感（Speed）

- ワンタップで完結する操作
- 最小限のステップ数
- 素早いレスポンスフィードバック
- スムーズなトランジション

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* PayPay カラー */
  --paypay-red: #FF0033;
  --paypay-red-light: #FF3366;
  --paypay-red-dark: #CC0029;

  /* 背景色 */
  --color-background: #FFFFFF;
  --color-background-secondary: #F5F5F5;
  --color-background-card: #FFFFFF;

  /* テキストカラー */
  --color-text-primary: #333333;
  --color-text-secondary: #666666;
  --color-text-tertiary: #999999;
  --color-text-inverse: #FFFFFF;

  /* セマンティックカラー */
  --color-success: #00C853;
  --color-warning: #FFB300;
  --color-error: #FF3B30;
  --color-info: #007AFF;

  /* グレースケール */
  --color-gray-100: #F5F5F5;
  --color-gray-200: #EEEEEE;
  --color-gray-300: #DDDDDD;
  --color-gray-400: #CCCCCC;
  --color-gray-500: #999999;

  /* タイポグラフィ */
  --font-ja: 'Hiragino Sans', 'Hiragino Kaku Gothic ProN', 'Noto Sans JP', sans-serif;
  --font-en: 'Graphik', -apple-system, BlinkMacSystemFont, sans-serif;
  --font-number: 'Graphik', 'SF Pro Display', -apple-system, sans-serif;

  /* スペーシング */
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;

  /* 角丸 */
  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 24px;
  --radius-full: 9999px;

  /* シャドウ */
  --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.08);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.12);

  /* アニメーション */
  --ease-out: cubic-bezier(0.25, 0.46, 0.45, 0.94);
  --duration-fast: 150ms;
  --duration-normal: 250ms;
}
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
  <title>PayPay風アプリ</title>
</head>
<body>
  <!-- ヘッダー -->
  <header class="header">
    <div class="header-balance">
      <span class="balance-label">PayPay残高</span>
      <span class="balance-amount">¥12,345</span>
    </div>
  </header>

  <!-- メインコンテンツ -->
  <main class="main">
    <!-- アクションボタン -->
    <section class="action-buttons">
      <button class="action-btn action-btn--primary">
        <span class="action-icon">📱</span>
        <span class="action-label">支払う</span>
      </button>
      <button class="action-btn">
        <span class="action-icon">💰</span>
        <span class="action-label">チャージ</span>
      </button>
      <button class="action-btn">
        <span class="action-icon">📤</span>
        <span class="action-label">送る</span>
      </button>
    </section>

    <!-- カードセクション -->
    <section class="card-section">
      <div class="card">
        <h3 class="card-title">キャンペーン</h3>
        <p class="card-description">最大20%還元</p>
      </div>
    </section>
  </main>

  <!-- ボトムナビゲーション -->
  <nav class="bottom-nav">
    <a href="#" class="nav-item nav-item--active">
      <span class="nav-icon">🏠</span>
      <span class="nav-label">ホーム</span>
    </a>
    <a href="#" class="nav-item">
      <span class="nav-icon">💳</span>
      <span class="nav-label">支払い</span>
    </a>
    <a href="#" class="nav-item">
      <span class="nav-icon">📋</span>
      <span class="nav-label">履歴</span>
    </a>
    <a href="#" class="nav-item">
      <span class="nav-icon">👤</span>
      <span class="nav-label">アカウント</span>
    </a>
  </nav>
</body>
</html>
```

### 金額表示スタイル

```css
.balance-amount {
  font-family: var(--font-number);
  font-size: 32px;
  font-weight: 700;
  color: var(--color-text-primary);
  letter-spacing: -0.5px;
}

.balance-amount::before {
  content: '¥';
  font-size: 20px;
  font-weight: 500;
  margin-right: 2px;
}
```

### プライマリボタン

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 14px 32px;
  background: var(--paypay-red);
  color: var(--color-text-inverse);
  font-family: var(--font-ja);
  font-size: 16px;
  font-weight: 600;
  border: none;
  border-radius: var(--radius-full);
  cursor: pointer;
  transition: all var(--duration-fast) var(--ease-out);
}

.btn-primary:hover {
  background: var(--paypay-red-dark);
  transform: scale(1.02);
}

.btn-primary:active {
  transform: scale(0.98);
}
```

### カードコンポーネント

```css
.card {
  background: var(--color-background-card);
  border-radius: var(--radius-lg);
  padding: var(--spacing-md);
  box-shadow: var(--shadow-sm);
  transition: box-shadow var(--duration-normal) var(--ease-out);
}

.card:hover {
  box-shadow: var(--shadow-md);
}
```

## ベストプラクティス

### DO（推奨）

- PayPayレッド(#FF0033)はアクセントとして控えめに使用
- 白ベースのクリーンな背景を維持
- 金額表示には Graphik フォントで数字を強調
- 角丸(16px以上)で親しみやすさを表現
- ボトムナビのアクティブ状態は赤で明示
- タップターゲットは最低44x44pxを確保
- カード間には十分なスペーシングを確保

### DON'T（非推奨）

- 赤を全面的に使いすぎない（圧迫感）
- 角ばったデザイン（冷たい印象）
- 小さすぎるフォントや金額表示
- 複雑な操作フロー
- 情報の詰め込みすぎ

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- 決済機能の有無を特定
- 必要な要素（残高表示、QRコード、履歴等）を確認

### 2. リファレンス参照

必要に応じて詳細なリファレンスを参照：

- カラーの詳細 → [colors.md](references/colors.md)
- タイポグラフィの詳細 → [typography.md](references/typography.md)
- コンポーネントの詳細 → [components.md](references/components.md)
- レイアウトの詳細 → [layout.md](references/layout.md)

### 3. コード生成ルール

- CSS変数を使用してテーマを管理
- モバイルファーストでレスポンシブ設計
- 金額表示は数字専用フォント(Graphik)を使用
- ボタンは十分なサイズとタッチエリアを確保
- アクティブ状態は必ずPayPayレッドで表現
- セーフエリア(safe-area-inset)を考慮

### 4. 品質チェックリスト

- [ ] PayPayレッドがアクセントとして適切に使用されているか
- [ ] 金額表示は大きく読みやすいか
- [ ] カードの角丸は16px以上か
- [ ] タップターゲットは44x44px以上か
- [ ] 情報の階層構造は明確か
- [ ] モバイルで正しく表示されるか
