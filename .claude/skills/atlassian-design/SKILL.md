---
name: atlassian-design
description: Atlassian風のプロフェッショナルで統一感のあるUIを作成する。Atlassian Blue（#0052CC）をプライマリカラーに、Atlassian Sans/デザイントークン、モジュラーなコンポーネントを活用。Jira、Confluence風のWebアプリ、ダッシュボード、プロジェクト管理ツールをAtlassian風にデザインする際に使用。
---

# Atlassian Design System

Atlassian のデザインシステムに基づいた、プロフェッショナルで一貫性のある UI を作成するためのガイドです。Jira、Confluence、Trello などの Atlassian 製品で使用されているデザインパターンを再現できます。

## このスキルを使用するタイミング

- Atlassian風のWebアプリやダッシュボードを作成するとき
- Jira、Confluence風のプロジェクト管理ツールを作成するとき
- チームコラボレーションツールのUIを設計するとき
- デザイントークンを活用した一貫性のあるUIが必要なとき
- アクセシビリティ（WCAG 2.1 AA）準拠のUIを作成するとき
- モジュラーなナビゲーションシステムを実装するとき

## デザインシステム構成

このスキルは以下のリファレンスドキュメントで構成されています：

| ドキュメント | 内容 |
|-------------|------|
| [colors.md](references/colors.md) | カラーパレット、デザイントークン、セマンティックカラー |
| [typography.md](references/typography.md) | Atlassian Sans、タイプスケール、フォントウェイト |
| [components.md](references/components.md) | ボタン、カード、ナビゲーション、フォーム、バッジ |
| [animations.md](references/animations.md) | トランジション、イージング、マイクロインタラクション |
| [layout.md](references/layout.md) | グリッドシステム、スペーシング、レスポンシブパターン |

## デザイン原則

### 1. 一貫性（Consistency）

- デザイントークンを使用して一貫したスタイリング
- 製品間で統一されたUIパターン
- 予測可能なユーザー体験

### 2. アクセシビリティ（Accessibility）

- WCAG 2.1 AA 準拠
- 適切なカラーコントラスト
- キーボードナビゲーション対応
- スクリーンリーダー対応

### 3. 効率性（Efficiency）

- 再利用可能なコンポーネント
- モジュラーなナビゲーションシステム
- スケーラブルなデザインパターン

### 4. 明確性（Clarity）

- 明確な視覚的階層
- 直感的なインタラクション
- 目的に応じたカラー使用

## クイックスタート

### CSS 変数の設定

```css
:root {
  /* プライマリカラー - Atlassian Blue */
  --color-brand-bold: #0052CC;
  --color-brand-boldHovered: #0065FF;
  --color-brand-boldPressed: #0747A6;

  /* ニュートラル */
  --color-text: #172B4D;
  --color-text-subtle: #6B778C;
  --color-text-subtlest: #97A0AF;
  --color-text-inverse: #FFFFFF;

  /* 背景 */
  --color-background-neutral: #F4F5F7;
  --color-background-neutral-subtle: #FAFBFC;
  --color-background-input: #FAFBFC;
  --color-background-selected: #DEEBFF;

  /* ボーダー */
  --color-border: #DFE1E6;
  --color-border-focused: #4C9AFF;

  /* ステータスカラー */
  --color-background-success: #E3FCEF;
  --color-text-success: #006644;
  --color-background-warning: #FFFAE6;
  --color-text-warning: #FF8B00;
  --color-background-danger: #FFEBE6;
  --color-text-danger: #DE350B;
  --color-background-information: #DEEBFF;
  --color-text-information: #0052CC;

  /* タイポグラフィ */
  --font-family-sans: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
  --font-family-mono: 'SFMono-Medium', 'SF Mono', 'Segoe UI Mono', 'Roboto Mono', 'Ubuntu Mono', Menlo, Consolas, Courier, monospace;

  /* スペーシング（8pxベース） */
  --space-025: 2px;
  --space-050: 4px;
  --space-100: 8px;
  --space-150: 12px;
  --space-200: 16px;
  --space-300: 24px;
  --space-400: 32px;
  --space-500: 40px;
  --space-600: 48px;

  /* ボーダーラディウス */
  --border-radius-050: 3px;
  --border-radius-100: 4px;
  --border-radius-200: 8px;
  --border-radius-round: 50%;

  /* シャドウ */
  --shadow-overflow: 0 0 0 1px rgba(9, 30, 66, 0.08), 0 2px 4px 1px rgba(9, 30, 66, 0.08);
  --shadow-raised: 0 1px 1px rgba(9, 30, 66, 0.25), 0 0 1px 1px rgba(9, 30, 66, 0.13);
  --shadow-overlay: 0 4px 8px -2px rgba(9, 30, 66, 0.25), 0 0 1px rgba(9, 30, 66, 0.31);

  /* トランジション */
  --duration-fast: 100ms;
  --duration-normal: 200ms;
  --duration-slow: 300ms;
  --easing-standard: cubic-bezier(0.2, 0, 0, 1);
}
```

### Google Fonts のインポート（フォールバック用）

```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

### 基本的なHTML構造

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Atlassian Design</title>
</head>
<body>
  <!-- Top Navigation -->
  <header class="atlassian-top-nav">
    <div class="nav-content">
      <div class="nav-left">
        <button class="nav-button">
          <span class="icon-menu"></span>
        </button>
        <a href="/" class="nav-logo">Product</a>
      </div>
      <div class="nav-right">
        <button class="nav-button">
          <span class="icon-search"></span>
        </button>
        <button class="nav-button">
          <span class="icon-notifications"></span>
        </button>
      </div>
    </div>
  </header>

  <!-- Side Navigation -->
  <aside class="side-nav">
    <nav class="side-nav-content">
      <a href="#" class="nav-item active">Dashboard</a>
      <a href="#" class="nav-item">Projects</a>
      <a href="#" class="nav-item">Settings</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="main-content">
    <div class="page-header">
      <h1 class="page-title">Page Title</h1>
    </div>
    <div class="content-area">
      <!-- Cards -->
      <div class="card">
        <h2 class="card-title">Card Title</h2>
        <p class="card-description">Card description text goes here.</p>
        <div class="card-actions">
          <button class="btn btn-primary">Primary</button>
          <button class="btn btn-subtle">Subtle</button>
        </div>
      </div>
    </div>
  </main>
</body>
</html>
```

### Primary Button

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 32px;
  padding: 0 12px;

  background-color: var(--color-brand-bold);
  color: var(--color-text-inverse);
  border: none;
  border-radius: var(--border-radius-050);

  font-family: var(--font-family-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 1;
  cursor: pointer;

  transition: background-color var(--duration-fast) var(--easing-standard);
}

.btn-primary:hover {
  background-color: var(--color-brand-boldHovered);
}

.btn-primary:active {
  background-color: var(--color-brand-boldPressed);
}

.btn-primary:focus-visible {
  outline: 2px solid var(--color-border-focused);
  outline-offset: 2px;
}
```

### Card Component

```css
.card {
  background-color: #FFFFFF;
  border-radius: var(--border-radius-050);
  box-shadow: var(--shadow-raised);
  padding: var(--space-200);
}

.card-title {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-text);
  margin: 0 0 var(--space-100) 0;
}

.card-description {
  font-size: 14px;
  color: var(--color-text-subtle);
  margin: 0 0 var(--space-200) 0;
  line-height: 1.5;
}

.card-actions {
  display: flex;
  gap: var(--space-100);
}
```

### Badge / Lozenge

```css
.lozenge {
  display: inline-flex;
  align-items: center;
  height: 16px;
  padding: 0 4px;

  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
  border-radius: var(--border-radius-050);
}

.lozenge-success {
  background-color: var(--color-background-success);
  color: var(--color-text-success);
}

.lozenge-warning {
  background-color: var(--color-background-warning);
  color: var(--color-text-warning);
}

.lozenge-danger {
  background-color: var(--color-background-danger);
  color: var(--color-text-danger);
}

.lozenge-information {
  background-color: var(--color-background-information);
  color: var(--color-text-information);
}
```

## ベストプラクティス

### DO（推奨）

- デザイントークン（CSS変数）を使用する
- 8pxベースのスペーシングシステムに従う
- 適切なカラーコントラストを確保（WCAG AA）
- フォーカス状態を明確に表示
- セマンティックHTMLを使用
- 一貫したコンポーネントパターンを使用

### DON'T（非推奨）

- ハードコードされた色値の使用
- 任意のスペーシング値
- コントラスト不足のテキスト
- フォーカスインジケータの非表示
- 過度に装飾的なスタイル
- 一貫性のないボタンスタイル

## AI アシスタント向け指示

このスキルが呼び出されたとき：

### 1. 要件確認

- 作成するページ/コンポーネントの種類を確認
- 必要なコンポーネント（ボタン、カード、ナビゲーション等）を特定
- ダークテーマ対応の有無を確認
- アクセシビリティ要件を確認

### 2. リファレンス参照

必要に応じて詳細なリファレンスを参照：

- カラーの詳細 → [colors.md](references/colors.md)
- タイポグラフィの詳細 → [typography.md](references/typography.md)
- コンポーネントの詳細 → [components.md](references/components.md)
- アニメーションの詳細 → [animations.md](references/animations.md)
- レイアウトの詳細 → [layout.md](references/layout.md)

### 3. コード生成ルール

- CSS変数でAtlassianデザイントークンを使用
- 8pxベースのスペーシングシステム
- セマンティックカラー（brand, text, background）を使用
- 標準のトランジションを適用
- レスポンシブブレークポイントを考慮
- アクセシビリティ属性（aria-*）を適切に設定

### 4. 品質チェックリスト

- [ ] デザイントークンを使用しているか
- [ ] 8pxグリッドに従っているか
- [ ] カラーのコントラストは十分か（4.5:1以上）
- [ ] フォーカス状態が明確か
- [ ] キーボードナビゲーション対応か
- [ ] レスポンシブに対応しているか
- [ ] ダークテーマで正しく表示されるか（必要な場合）

## 参考リンク

- [Atlassian Design System](https://atlassian.design/)
- [Color Foundation](https://atlassian.design/foundations/color/)
- [Typography](https://atlassian.design/foundations/typography/)
- [Components](https://atlassian.design/components/)
