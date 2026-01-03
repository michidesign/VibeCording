---
name: apple-design
description: Apple風のミニマルで洗練されたUIデザインを作成する。ガラスモーフィズム、SF Pro風タイポグラフィ、滑らかなアニメーション、大胆な余白を活用。Webサイト、アプリUI、ランディングページをApple風にデザインする際に使用。
---

# Apple Design System

Apple の洗練されたデザイン哲学に基づいた、ミニマルで美しい UI を作成するためのデザインシステムです。

## このスキルを使用するタイミング

- Apple風のWebサイトやランディングページを作成するとき
- ミニマルで洗練されたUIデザインが必要なとき
- ガラスモーフィズム（すりガラス効果）を実装するとき
- 高級感のあるプロダクトページを作成するとき
- モダンでクリーンなアプリUIを設計するとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | カラーパレット、セマンティックカラー、グラデーション、ダークモード |
| [typography.md](references/typography.md) | フォントスタック、タイプスケール、レスポンシブタイポグラフィ |
| [components.md](references/components.md) | ボタン、カード、ナビゲーション、フォーム、モーダル |
| [animations.md](references/animations.md) | イージング、トランジション、キーフレーム、スクロールアニメーション |
| [layout.md](references/layout.md) | グリッドシステム、ブレークポイント、スペーシング、レイアウトパターン |

## デザイン原則

### 1. ミニマリズム（Less is More）

- 不要な要素を徹底的に排除
- 1画面1メッセージの原則
- 機能美を追求し、装飾的要素は最小限に

### 2. 大胆な余白（Negative Space）

- 要素間に十分なスペースを確保
- 余白は「空き」ではなく「デザイン要素」
- コンテンツに呼吸する空間を与える

### 3. 上品なモーション

- 滑らかで控えめなアニメーション
- 0.3秒を基準としたトランジション
- ease-out イージングで自然な動きを実現

### 4. 視覚的階層

- 大胆な見出しと繊細な本文のコントラスト
- カラーは最小限、アクセントは1色
- シャドウと余白で奥行きを表現

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* カラー */
  --color-label: #1d1d1f;
  --color-label-secondary: #86868b;
  --color-background: #ffffff;
  --color-background-secondary: #f5f5f7;
  --color-blue: #0071e3;

  /* タイポグラフィ */
  --font-display: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Helvetica Neue', sans-serif;
  --font-text: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;

  /* アニメーション */
  --ease-out: cubic-bezier(0, 0, 0.58, 1);
  --duration-normal: 300ms;

  /* レイアウト */
  --container-max: 980px;
  --radius-lg: 18px;
}
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Apple Design</title>
</head>
<body>
  <!-- ナビゲーション -->
  <nav class="nav-global">...</nav>

  <!-- ヒーローセクション -->
  <section class="hero">
    <h1 class="hero-title">革新を、その手に。</h1>
    <p class="hero-subtitle">これまでにない体験が、あなたを待っています。</p>
    <div class="hero-cta">
      <a href="#" class="btn-primary">詳しく見る</a>
    </div>
  </section>

  <!-- フィーチャーセクション -->
  <section class="section">
    <div class="container">
      <div class="grid-features">...</div>
    </div>
  </section>
</body>
</html>
```

### ガラスモーフィズム

```css
.glass {
  background: rgba(255, 255, 255, 0.72);
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
  border-radius: var(--radius-lg);
}
```

## ベストプラクティス

### DO（推奨）

- 余白を惜しまない - 要素間には十分なスペース
- 色は控えめに - 黒、白、グレー基調、アクセントは最小限
- フォントサイズに緩急 - 見出しは大胆に、本文は読みやすく
- アニメーションは上品に - 0.3秒、ease-out を基準
- 高解像度画像 - Retina対応必須
- モバイルファースト - レスポンシブを前提に設計

### DON'T（非推奨）

- 過度な装飾や派手なグラデーション
- 複数のアクセントカラーを同時使用
- 角ばったデザイン（border-radius: 0）
- 急激なアニメーション（0.1秒以下）
- レイアウトプロパティのアニメーション

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- 必要な要素（ナビ、ヒーロー、カード等）を特定
- ダークモード対応の有無を確認

### 2. リファレンス参照

必要に応じて詳細なリファレンスを参照：

- カラーの詳細 → [colors.md](references/colors.md)
- タイポグラフィの詳細 → [typography.md](references/typography.md)
- コンポーネントの詳細 → [components.md](references/components.md)
- アニメーションの詳細 → [animations.md](references/animations.md)
- レイアウトの詳細 → [layout.md](references/layout.md)

### 3. コード生成ルール

- CSS変数を使用してテーマを管理
- セマンティックHTMLを使用
- モバイルレスポンシブを考慮
- アクセシビリティ（WCAG AA）を確保
- prefers-color-scheme でダークモード対応
- prefers-reduced-motion でアニメーション制御

### 4. 品質チェックリスト

- [ ] 余白は十分か
- [ ] カラーは統一されているか
- [ ] フォントサイズの階層は明確か
- [ ] アニメーションは滑らかか
- [ ] モバイルで正しく表示されるか
- [ ] ダークモードで正しく表示されるか
