---
name: spindle-design
description: Ameba風のSpindleデザインシステムに基づいたUIを作成する。プライマリグリーン(#298737)をアクセントに、WCAG 2.1準拠のアクセシブルなカラーシステム、Meiryo/Ameba Sansタイポグラフィを活用。Amebaブログ、Webアプリ、コンテンツサービスをSpindle風にデザインする際に使用。
---

# Spindle Design System

Ameba のデザインシステム「Spindle」に基づいた、一貫性のあるアクセシブルな UI を作成するためのデザインシステムです。

## このスキルを使用するタイミング

- Ameba風のWebサイトやアプリを作成するとき
- Spindle風のUIデザインが必要なとき
- グリーンをアクセントにした親しみやすいデザインを作成するとき
- アクセシビリティ（WCAG 2.1）を重視したUIが必要なとき
- ブログサービスやコンテンツプラットフォームを設計するとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | プライマリグリーン、セカンダリカラー、グレースケール、アクセントカラー |
| [typography.md](references/typography.md) | フォントファミリー、タイプスケール、行間設定 |
| [components.md](references/components.md) | ボタン、チェックボックス、テキストフィールド、モーダル、リスト |
| [animations.md](references/animations.md) | イージング、デュレーション、アニメーションタイプ |
| [layout.md](references/layout.md) | グリッドシステム、スペーシング、ブレークポイント |

## デザイン原則

### 1. 約束事としての原則（Principles as Promises）

- 原則は厳格なルールではなく、ユーザーとの信頼関係を築くための「約束事」
- Amebaらしさを一貫して届けるための指針
- すべてのタッチポイントで統一された体験を提供

### 2. アクセシビリティ（Accessibility First）

- WCAG 2.1 達成基準 1.4.3 に基づくコントラスト比の確保
- 誰もが「いつでも書いて、読んで、応えられる」状態を目指す
- 環境や状況を問わず利用可能なデザイン

### 3. パフォーマンス（Performance）

- ユーザーが求めるものを素早く届ける
- 軽量で効率的なUI実装
- コンテンツの到達性を高める

### 4. 一貫性（Consistency）

- 再利用可能なコンポーネントによる統一感
- パターンの活用で直感的な操作を実現
- Amebaのサービス全体で共通の体験

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* プライマリカラー */
  --color-primary-50: #41ad4f;
  --color-primary-70: #298737;
  --color-primary-80: #237b31;

  /* セカンダリカラー */
  --color-secondary-50: #82be28;
  --color-secondary-70: #5e9b15;
  --color-secondary-80: #477d00;

  /* グレースケール */
  --color-gray-100: #08121a;
  --color-gray-90: #141e25;
  --color-gray-80: #394148;
  --color-gray-70: #464d53;
  --color-gray-60: #686e73;
  --color-gray-5: #f5f6f6;

  /* アクセントカラー */
  --color-focus: #0091ff;
  --color-caution: #d91c0b;
  --color-highlight: #f5e100;

  /* 背景 */
  --color-background: #ffffff;
  --color-background-secondary: #f5f6f6;

  /* タイポグラフィ */
  --font-family-base: 'Meiryo', 'Yu Gothic Medium', system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
  --font-family-en: system-ui, -apple-system, BlinkMacSystemFont, sans-serif;

  /* アニメーション */
  --duration-fast: 150ms;
  --duration-neutral: 350ms;
  --duration-slow: 500ms;
  --ease-out: cubic-bezier(0.33, 1, 0.68, 1);
  --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);

  /* スペーシング */
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;

  /* ボーダー */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-full: 9999px;
}
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Spindle Design</title>
</head>
<body>
  <!-- ヘッダー -->
  <header class="header">
    <nav class="nav-global">
      <div class="nav-logo">Ameba</div>
      <ul class="nav-menu">
        <li><a href="#">ブログ</a></li>
        <li><a href="#">マンガ</a></li>
        <li><a href="#">ニュース</a></li>
      </ul>
    </nav>
  </header>

  <!-- ヒーローセクション -->
  <section class="hero">
    <h1 class="hero-title">つながる、ひろがる。</h1>
    <p class="hero-subtitle">あなたの想いを、みんなに届けよう。</p>
    <div class="hero-cta">
      <a href="#" class="btn-primary">はじめる</a>
    </div>
  </section>

  <!-- コンテンツセクション -->
  <main class="main">
    <div class="container">
      <div class="card-grid">...</div>
    </div>
  </main>
</body>
</html>
```

### ボタンスタイル

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 12px 24px;
  background-color: var(--color-primary-70);
  color: #ffffff;
  font-weight: bold;
  font-size: 1rem;
  line-height: 1.3;
  border: none;
  border-radius: var(--radius-md);
  cursor: pointer;
  transition: background-color var(--duration-fast) var(--ease-out);
}

.btn-primary:hover {
  background-color: var(--color-primary-80);
}

.btn-primary:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}
```

### カードコンポーネント

```css
.card {
  background: var(--color-background);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
  box-shadow: 0 2px 8px rgba(8, 18, 26, 0.08);
  transition: box-shadow var(--duration-neutral) var(--ease-out);
}

.card:hover {
  box-shadow: 0 4px 16px rgba(8, 18, 26, 0.12);
}
```

## ベストプラクティス

### DO（推奨）

- グリーンをアクセントに - プライマリグリーン(#298737)を効果的に使用
- コントラストを確保 - WCAG 2.1 AAレベルのコントラスト比（4.5:1以上）
- 一貫したスペーシング - 8pxベースのグリッドシステム
- フォーカス表示を明確に - フォーカスブルー(#0091ff)で視認性確保
- 日本語フォント最適化 - Meiryo、Yu Gothicを適切に使用
- アニメーションは自然に - ease-outイージングで物理的な動きを表現

### DON'T（非推奨）

- コントラストが不十分なカラーの組み合わせ
- グリーン以外のアクセントカラーの多用
- フォーカス表示の省略や不明確な実装
- 過度なアニメーションやエフェクト
- グリッドシステムを無視した不規則なスペーシング

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- Amebaサービス（ブログ、マンガ、ニュース等）の文脈を把握
- アクセシビリティ要件を確認

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
- WCAG 2.1 AAレベルのアクセシビリティを確保
- 日本語コンテンツに最適化されたタイポグラフィ
- prefers-reduced-motion でアニメーション制御
- モバイルファーストでレスポンシブ対応

### 4. 品質チェックリスト

- [ ] カラーコントラスト比は4.5:1以上か
- [ ] フォーカス表示は明確か
- [ ] スペーシングは8pxグリッドに沿っているか
- [ ] プライマリグリーンが効果的に使われているか
- [ ] 日本語フォントが正しく設定されているか
- [ ] アニメーションは自然で控えめか
- [ ] モバイルで正しく表示されるか

## 関連リソース

- [Spindle 公式ドキュメント](https://spindle.ameba.design/)
- [Web Component Catalog (Storybook)](https://ameba-spindle.web.app/)
