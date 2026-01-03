# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

**単一ファイルのWebベースタスク管理アプリケーション**です。HTML、CSS、JavaScriptのみで構築されており、アプリケーション全体が `mytasks.html`（約3,300行）に含まれています。ビルドシステム、パッケージマネージャー、外部依存関係は不要です。

**デザインシステム**: Apple Design System（apple-design skill）に準拠した洗練されたUIを採用。

## 開発コマンド

| 操作 | 方法 |
|------|------|
| 実行 | `mytasks.html` をブラウザで直接開く |
| テスト | ブラウザでの手動テストのみ |
| デプロイ | `mytasks.html` をコピー |

## アーキテクチャ

### 単一ファイル構成
- **1-7行目**: HTMLドキュメントヘッド
- **8-1930行目**: CSS（Apple Design System準拠）
- **1931-2150行目**: HTML構造とテンプレート
- **2150行目以降**: JavaScriptアプリケーションロジック

### 状態管理
グローバル `appData` オブジェクトをlocalStorageに保存（キー: `task_app_data_v25_ux`）:
```javascript
appData = {
  tasks: [{
    id, name, status, category, deadline, memo,
    isArchived, isDeleted, createdAt, updatedAt, archivedAt,
    subtasks: [{ id, name, status, memo, deadline, isArchived }]
  }],
  globalMemo: "",
  settings: {
    categories: [{ id, name }],
    statuses: [{ id, name, color }]
  }
}
```

### 主要なJavaScript関数
| 関数 | 目的 |
|------|------|
| `loadData()` / `saveData()` | localStorage永続化 |
| `renderApp()` / `renderTasks()` | DOM描画 |
| `addTask()` / `updateTask()` / `deleteTask()` | タスクCRUD |
| `toggleComplete()` | タスクのアーカイブ/復元 |
| `importData()` / `exportData()` | JSONファイル入出力 |
| `handleDragStart/Over/Drop/End` | ドラッグ&ドロップ並び替え |

### 表示モード
`currentView` 変数で制御される3つのビュー:
- **Active**: `isArchived=false` かつ `isDeleted=false` のタスク
- **Archived**: 完了したタスク（`isArchived=true`）
- **Trash**: 削除されたタスク（`isDeleted=true`）

## デザインシステム（Apple Design System）

CSSは `.claude/skills/apple-design` に定義されたApple Design Systemに準拠しています。

### CSS変数（主要）
```css
:root {
  /* カラー */
  --color-label: #1d1d1f;
  --color-label-secondary: #86868b;
  --color-background: #ffffff;
  --color-background-secondary: #f5f5f7;
  --color-blue: #0071e3;
  --color-green: #34c759;
  --color-red: #ff3b30;

  /* タイポグラフィ */
  --font-display: -apple-system, BlinkMacSystemFont, 'SF Pro Display', ...;
  --font-text: -apple-system, BlinkMacSystemFont, 'SF Pro Text', ...;

  /* アニメーション */
  --ease-out: cubic-bezier(0, 0, 0.58, 1);
  --duration-normal: 300ms;

  /* Border Radius */
  --radius-sm: 12px;
  --radius-md: 18px;
  --radius-pill: 980px;
}
```

### ダークモード
`body.dark-mode` クラスでCSS変数をオーバーライド:
- 背景: `#000000`（純黒）
- テキスト: `#f5f5f7`
- アクセント青: `#2997ff`

### レスポンシブブレークポイント
| ブレークポイント | 対象デバイス |
|-----------------|-------------|
| 〜734px | モバイル |
| 735px〜1068px | タブレット |
| 1069px〜 | デスクトップ |

### アクセシビリティ対応
- `prefers-reduced-motion`: アニメーション無効化
- `prefers-contrast: high`: 高コントラストモード
- `focus-visible`: キーボードフォーカス表示

### デザイン変更時の注意
- CSS変数を使用して色・サイズを変更
- 既存のクラス名を維持（JavaScript連携のため）
- apple-design skillのリファレンスを参照

## 重要な注意点

- **日付形式**: `YYYY/MM/DD HH:MM`
- **データバックアップ**: `_json/` ディレクトリにJSONファイルとして保存（形式: `mytasks_backup_YYYYMMDDHHMM.json`）
- **参照データ**: データ構造とサンプル内容は `sample_data.json` を参照

## ファイル構成

```
task_app/
├── mytasks.html          # メインアプリケーション（自己完結型）
├── sample_data.json      # データ構造のリファレンス
├── _json/                # JSONバックアップファイル
├── _capture/             # ドキュメント用スクリーンショット
└── _old/                 # バージョン履歴（v1.0 - v2.3）
```
