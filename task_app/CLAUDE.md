# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

**単一ファイルのWebベースタスク管理アプリケーション**です。HTML、CSS、JavaScriptのみで構築されており、アプリケーション全体が `mytasks.html`（約3,300行）に含まれています。ビルドシステム、パッケージマネージャー、外部依存関係は不要です。

## 開発コマンド

| 操作 | 方法 |
|------|------|
| 実行 | `mytasks.html` をブラウザで直接開く |
| テスト | ブラウザでの手動テストのみ |
| デプロイ | `mytasks.html` をコピー |

## アーキテクチャ

### 単一ファイル構成
- **1-7行目**: HTMLドキュメントヘッド
- **8-1700行目以降**: CSS（ダークモードは `body.dark-mode` セレクタで実装）
- **2053-3286行目**: JavaScriptアプリケーションロジック
- **1700-2052行目**: HTML構造とテンプレート

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
