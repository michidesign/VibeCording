# デジタル庁デザインシステム アクセシビリティ

デジタル庁デザインシステム（DADS）に基づいたアクセシビリティ対応の完全なリファレンス。

## 準拠規格

- **WCAG 2.2**（Web Content Accessibility Guidelines）
- **JIS X 8341-3:2016**（日本工業規格）
- **目標レベル**: AA（一部 AAA）

## 知覚可能（Perceivable）

### 1.1 代替テキスト

```html
<!-- 意味のある画像 -->
<img src="chart.png" alt="2023年度申請件数の推移グラフ。4月から12月にかけて右肩上がりで増加">

<!-- 装飾的な画像 -->
<img src="decoration.png" alt="" role="presentation">

<!-- 複雑な画像（グラフなど） -->
<figure>
  <img src="complex-chart.png" alt="地域別人口分布">
  <figcaption>
    <details>
      <summary>グラフの詳細説明</summary>
      <p>関東地方が全体の35%を占め...</p>
    </details>
  </figcaption>
</figure>

<!-- アイコン付きボタン -->
<button>
  <svg aria-hidden="true"><!-- icon --></svg>
  <span>検索</span>
</button>

<!-- アイコンのみのボタン -->
<button aria-label="メニューを開く">
  <svg aria-hidden="true"><!-- hamburger icon --></svg>
</button>
```

### 1.3 適応可能

```html
<!-- 正しい見出し階層 -->
<h1>ページタイトル</h1>
  <h2>セクション1</h2>
    <h3>サブセクション1-1</h3>
  <h2>セクション2</h2>

<!-- ランドマーク -->
<header role="banner">...</header>
<nav role="navigation" aria-label="メインメニュー">...</nav>
<main role="main">...</main>
<aside role="complementary">...</aside>
<footer role="contentinfo">...</footer>

<!-- リスト -->
<ul>
  <li>項目1</li>
  <li>項目2</li>
</ul>

<!-- テーブル -->
<table>
  <caption>申請状況一覧</caption>
  <thead>
    <tr>
      <th scope="col">申請番号</th>
      <th scope="col">状況</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2024-001</td>
      <td>審査中</td>
    </tr>
  </tbody>
</table>
```

### 1.4 判別可能

#### コントラスト比

```css
/* 本文テキスト: 4.5:1 以上 */
.text-on-white {
  color: #212529; /* on #ffffff = 16.1:1 ✓ */
}

/* 大きいテキスト (18px Bold / 24px): 3:1 以上 */
.large-text-on-white {
  color: #495057; /* on #ffffff = 9.7:1 ✓ */
}

/* UIコンポーネント: 3:1 以上 */
.button-border {
  border: 2px solid #0071c1; /* on #ffffff = 4.5:1 ✓ */
}
```

#### テキストのリサイズ

```css
/* 200%まで拡大しても問題なく表示 */
html {
  font-size: 100%;
}

body {
  font-size: 1rem; /* 16px */
  line-height: 1.5;
}

/* 固定幅を避ける */
.container {
  max-width: 1200px;
  width: 100%;
}

/* オーバーフローを防ぐ */
.content {
  overflow-wrap: break-word;
}
```

#### 色だけに依存しない

```html
<!-- ❌ 色だけでエラーを示す -->
<input style="border-color: red;">

<!-- ✓ 色 + アイコン + テキスト -->
<div class="form-group has-error">
  <label for="email">メールアドレス</label>
  <input id="email" aria-invalid="true" aria-describedby="email-error">
  <p id="email-error" class="form-error">
    <span aria-hidden="true">⚠</span>
    正しいメールアドレスを入力してください
  </p>
</div>
```

```css
/* 必須項目のマーク */
.required::after {
  content: "*必須";
  color: var(--dads-error);
  margin-left: 4px;
}

/* リンクは下線で識別 */
a {
  color: var(--dads-text-link);
  text-decoration: underline;
}
```

## 操作可能（Operable）

### 2.1 キーボード操作

```css
/* フォーカス可視化 */
:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
}

/* フォーカスを消さない */
:focus {
  /* outline: none; は禁止 */
}

/* カスタムフォーカス */
.btn:focus-visible {
  outline: 3px solid var(--dads-primary-500);
  outline-offset: 2px;
  box-shadow: 0 0 0 6px rgba(0, 113, 193, 0.2);
}
```

```html
<!-- スキップリンク -->
<a href="#main-content" class="skip-link">
  本文へスキップ
</a>

<header>...</header>
<main id="main-content" tabindex="-1">
  ...
</main>
```

```css
.skip-link {
  position: absolute;
  top: -100%;
  left: 0;
  padding: 12px 16px;
  background: var(--dads-primary-500);
  color: var(--dads-neutral-white);
  text-decoration: none;
  z-index: 9999;
}

.skip-link:focus {
  top: 0;
}
```

### 2.2 十分な時間

```html
<!-- セッションタイムアウト警告 -->
<div role="alertdialog" aria-labelledby="timeout-title">
  <h2 id="timeout-title">セッションがまもなく終了します</h2>
  <p>5分後に自動的にログアウトされます。</p>
  <button>セッションを延長する</button>
  <button>ログアウトする</button>
</div>
```

```css
/* 自動再生を避ける、または制御可能にする */
video {
  /* autoplay は使用しない */
}

/* アニメーションの制御 */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### 2.4 ナビゲーション可能

```html
<!-- ページタイトル -->
<title>申請フォーム - サービス名 | デジタル庁</title>

<!-- パンくずリスト -->
<nav aria-label="パンくずリスト">
  <ol>
    <li><a href="/">ホーム</a></li>
    <li><a href="/services">サービス一覧</a></li>
    <li aria-current="page">申請フォーム</li>
  </ol>
</nav>

<!-- 意味のあるリンクテキスト -->
<!-- ❌ -->
<a href="/details">こちら</a>

<!-- ✓ -->
<a href="/details">申請方法の詳細を確認する</a>
```

### 2.5 入力モダリティ

```css
/* タッチターゲット: 最低 44x44px、推奨 48x48px */
.btn {
  min-height: 48px;
  min-width: 48px;
  padding: 12px 24px;
}

.form-checkbox,
.form-radio {
  width: 24px;
  height: 24px;
}

/* ターゲット間のスペース */
.nav-list {
  gap: 16px;
}

.btn + .btn {
  margin-left: 8px;
}
```

## 理解可能（Understandable）

### 3.1 可読性

```html
<!-- 言語の指定 -->
<html lang="ja">

<!-- 言語の変更 -->
<p>この機能は<span lang="en">Accessibility</span>に配慮しています。</p>
```

### 3.2 予測可能

```html
<!-- フォーカス時に予期しない変更を起こさない -->
<select onchange="..."><!-- 選択時に即座にページ遷移しない --></select>

<!-- 送信ボタンで明示的にアクション -->
<form>
  <select name="category">...</select>
  <button type="submit">検索</button>
</form>

<!-- 一貫したナビゲーション -->
<header>
  <nav aria-label="メインメニュー">
    <!-- すべてのページで同じ順序 -->
  </nav>
</header>
```

### 3.3 入力支援

```html
<!-- エラーの特定 -->
<div class="form-group has-error">
  <label for="email">メールアドレス</label>
  <input type="email" id="email"
         aria-invalid="true"
         aria-describedby="email-error">
  <p id="email-error" class="form-error" role="alert">
    正しいメールアドレスの形式で入力してください（例: name@example.com）
  </p>
</div>

<!-- ラベルと説明 -->
<div class="form-group">
  <label for="phone">電話番号</label>
  <input type="tel" id="phone"
         aria-describedby="phone-hint"
         pattern="[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}">
  <p id="phone-hint" class="form-hint">
    ハイフンを含めて入力してください（例: 03-1234-5678）
  </p>
</div>

<!-- 入力形式の指定 -->
<label for="date">
  申請日
  <span class="form-format">（YYYY/MM/DD形式）</span>
</label>
<input type="text" id="date" placeholder="2024/01/15">
```

## 堅牢（Robust）

### 4.1 互換性

```html
<!-- 正しいHTMLの使用 -->
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ページタイトル</title>
</head>
<body>
  <!-- 有効なHTML -->
</body>
</html>

<!-- WAI-ARIAの適切な使用 -->
<button aria-expanded="false" aria-controls="menu">
  メニュー
</button>
<div id="menu" hidden>
  ...
</div>

<!-- ライブリージョン -->
<div aria-live="polite" aria-atomic="true">
  <!-- 動的に更新されるコンテンツ -->
</div>

<div role="alert">
  <!-- 重要な通知 -->
</div>
```

## フォームのアクセシビリティ

### 必須項目

```html
<label for="name">
  お名前
  <span class="required" aria-label="必須">*</span>
</label>
<input type="text" id="name" required aria-required="true">
```

### グループ化

```html
<fieldset>
  <legend>お届け先住所</legend>

  <div class="form-group">
    <label for="zip">郵便番号</label>
    <input type="text" id="zip">
  </div>

  <div class="form-group">
    <label for="address">住所</label>
    <input type="text" id="address">
  </div>
</fieldset>
```

### 自動補完

```html
<label for="name">氏名</label>
<input type="text" id="name" autocomplete="name">

<label for="email">メールアドレス</label>
<input type="email" id="email" autocomplete="email">

<label for="tel">電話番号</label>
<input type="tel" id="tel" autocomplete="tel">
```

## スクリーンリーダー専用テキスト

```css
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}
```

```html
<!-- 視覚的には非表示だがスクリーンリーダーで読み上げ -->
<a href="/pdf/guide.pdf">
  利用ガイド
  <span class="visually-hidden">（PDFファイル、2.5MB）</span>
</a>

<!-- アイコンボタンのラベル -->
<button>
  <svg aria-hidden="true">...</svg>
  <span class="visually-hidden">検索</span>
</button>
```

## チェックリスト

### 基本チェック

- [ ] `<html lang="ja">` を設定
- [ ] ページタイトルが適切
- [ ] 見出し階層が正しい（h1から順番）
- [ ] すべての画像に alt 属性
- [ ] リンクテキストが意味を持つ
- [ ] フォームにラベルが関連付け
- [ ] エラーメッセージがテキストで表示

### キーボード操作

- [ ] Tab キーですべての操作可能要素にアクセス
- [ ] フォーカスが見える
- [ ] フォーカストラップがない
- [ ] スキップリンクがある
- [ ] モーダル内でフォーカスが維持

### カラー・コントラスト

- [ ] テキストのコントラスト比 4.5:1 以上
- [ ] UIコンポーネントのコントラスト比 3:1 以上
- [ ] 色だけで情報を伝えていない
- [ ] リンクが識別可能

### フォーム

- [ ] 必須項目がテキストでも示される
- [ ] エラー内容と修正方法が明確
- [ ] 入力形式のヒントがある
- [ ] グループ化されている（fieldset/legend）
