---
name: google-design
description: Google風のMaterial Designを活用したモダンでクリーンなUIを作成する。エレベーション、Ripple効果、鮮やかなカラーパレット、Robotoフォントを活用。Webサイト、アプリUI、ダッシュボードをGoogle風にデザインする際に使用。
---

# Material Design System

Google の Material Design 3 (Material You) に基づいた、モダンで表現豊かな UI を作成するためのデザインシステムです。

## このスキルを使用するタイミング

- Google風のWebサイトやダッシュボードを作成するとき
- Material Design準拠のUIが必要なとき
- Ripple効果やエレベーションを実装するとき
- 明確な視覚的階層を持つアプリUIを設計するとき
- Dynamic Colorやテーマ切り替えを実装するとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | カラースキーム、ダイナミックカラー、ステートレイヤー |
| [typography.md](references/typography.md) | Roboto/Google Sans、タイプスケール（Display〜Label） |
| [components.md](references/components.md) | ボタン、カード、テキストフィールド、チップ、ナビゲーション |
| [animations.md](references/animations.md) | イージング、デュレーション、Ripple、トランジション |
| [layout.md](references/layout.md) | レスポンシブ、12カラムグリッド、8dpグリッド、ナビゲーションパターン |

## デザイン原則

### 1. Material Metaphor（マテリアルの比喩）

- 物理的な素材のように振る舞うUI
- エレベーション（高さ）による階層表現
- 光と影で奥行きを表現

### 2. Bold, Graphic, Intentional

- 大胆なタイポグラフィ
- 意図的なカラー使用
- グリッドベースのレイアウト

### 3. Motion Provides Meaning

- アニメーションで関係性を示す
- 自然な物理法則に従う動き
- Ripple効果でフィードバックを提供

### 4. Adaptive & Responsive

- あらゆる画面サイズに対応
- ナビゲーションパターンの切り替え
- コンテンツの優先順位を維持

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* カラー */
  --md-sys-color-primary: #6750A4;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-primary-container: #EADDFF;
  --md-sys-color-surface: #FFFBFE;
  --md-sys-color-on-surface: #1C1B1F;
  --md-sys-color-outline: #79747E;

  /* タイポグラフィ */
  --md-sys-typescale-font: 'Roboto', 'Noto Sans JP', sans-serif;
  --md-sys-typescale-brand: 'Google Sans', 'Roboto', sans-serif;

  /* モーション */
  --md-sys-motion-easing-standard: cubic-bezier(0.2, 0, 0, 1);
  --md-sys-motion-duration-medium2: 300ms;

  /* Shape */
  --md-shape-medium: 12px;
  --md-shape-full: 9999px;
}
```

### Google Fonts のインポート

```html
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Noto+Sans+JP:wght@300;400;500;700&display=swap" rel="stylesheet">
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Material Design</title>
</head>
<body>
  <!-- Top App Bar -->
  <header class="md-top-app-bar">
    <h1 class="md-top-app-bar-title">Title</h1>
  </header>

  <!-- Main Content -->
  <main class="main-content">
    <div class="md-grid">
      <!-- Cards -->
      <article class="md-card md-card-elevated">
        <h2 class="headline-medium">Headline</h2>
        <p class="body-medium">Content</p>
      </article>
    </div>
  </main>

  <!-- Navigation Bar (Mobile) -->
  <nav class="md-navigation-bar">
    <!-- Nav Items -->
  </nav>
</body>
</html>
```

### Filled Button

```css
.md-filled-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 40px;
  padding: 0 24px;

  background-color: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
  border: none;
  border-radius: var(--md-shape-full);

  font-family: var(--md-sys-typescale-font);
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;

  transition: box-shadow var(--md-sys-motion-duration-medium2)
              var(--md-sys-motion-easing-standard);
}

.md-filled-button:hover {
  box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.15);
}
```

### Elevated Card

```css
.md-card-elevated {
  background-color: var(--md-sys-color-surface);
  border-radius: var(--md-shape-medium);
  padding: 16px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3),
              0 1px 3px 1px rgba(0, 0, 0, 0.15);
}
```

## ベストプラクティス

### DO（推奨）

- 8dpグリッドに従う
- on-* カラーを対応するコンテナと組み合わせる
- エレベーションで階層を表現
- Ripple効果でタッチフィードバックを提供
- レスポンシブなナビゲーションパターン

### DON'T（非推奨）

- 8dpグリッド外の任意のスペーシング
- コントラスト不足のカラー組み合わせ
- 過度なエレベーション
- 意味のないアニメーション
- 固定幅レイアウト

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- 必要なコンポーネント（ボタン、カード、ナビゲーション等）を特定
- ダークテーマ対応の有無を確認

### 2. リファレンス参照

必要に応じて詳細なリファレンスを参照：

- カラーの詳細 → [colors.md](references/colors.md)
- タイポグラフィの詳細 → [typography.md](references/typography.md)
- コンポーネントの詳細 → [components.md](references/components.md)
- アニメーションの詳細 → [animations.md](references/animations.md)
- レイアウトの詳細 → [layout.md](references/layout.md)

### 3. コード生成ルール

- CSS変数でMaterial Design 3のトークンを使用
- 8dpグリッドに従ったスペーシング
- セマンティックカラー（primary, surface, on-*）を使用
- 標準のデュレーションとイージングを適用
- レスポンシブブレークポイントを考慮

### 4. 品質チェックリスト

- [ ] 8dpグリッドに従っているか
- [ ] カラーのコントラストは十分か
- [ ] エレベーションは適切か
- [ ] インタラクションにフィードバックがあるか
- [ ] レスポンシブに対応しているか
- [ ] ダークテーマで正しく表示されるか
