# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

Photo Selectorは、子供の写真を自動評価し7段階の品質ティアに分類する写真選定ツール。アルバム作成の補助を目的とし、macOS上でローカル処理を行う（インターネットへのアップロードなし）。

## コマンド

### 初回セットアップ
```bash
/opt/homebrew/bin/python3.12 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install "numpy<2"
```

### GUI起動
```bash
source venv/bin/activate && python src/photo_selector_gui.py
```
または `Photo Selector.command` をダブルクリック

### CLI実行
```bash
source venv/bin/activate
python src/photo_selector.py --input <フォルダ> --output <フォルダ> [--batch-size 500]
```

## アーキテクチャ

### 主要クラス

**PhotoEvaluator** (`src/photo_selector.py`): OpenCV Haar Cascadeによる画像分析
- 顔/目/笑顔の検出
- シャープネス（ラプラシアン分散）、露出（ヒストグラム）、コントラスト（標準偏差）のスコアリング
- 三分割法による顔構図分析

**PhotoSelector** (`src/photo_selector.py`): ワークフロー管理
- ファイル探索、評価、分類、ファイルコピー
- `.processed.txt`による中断・再開機能
- 日本語ヘッダー付きCSV結果出力

**PhotoSelectorGUI** (`src/photo_selector_gui.py`): CustomTkinterダークモードUI
- マルチスレッドでUI固まり防止
- リアルタイム進捗・ログ表示

### スコアリングアルゴリズム

顔あり写真: 構図30% + 笑顔25% + シャープネス20% + 目15% + 露出5% + 顔サイズ5%

顔なし写真: シャープネス40% + 露出35% + コントラスト25%

### 出力カテゴリ（7段階）
```
1_最高/         (75点以上)
2_とても良い/   (65-74点)
3_良い/         (55-64点)
4_普通/         (45-54点)
5_やや悪い/     (35-44点)
6_悪い/         (25-34点)
7_非常に悪い/   (25点未満)
```

## 実装上の重要ポイント

- 全処理がローカル完結（プライバシー重視設計）
- JPG/JPEG/PNGに対応、再帰的ディレクトリスキャン
- EXIF日時を抽出、取得不可時はファイル更新日時にフォールバック
- 出力ファイル名形式: `YYYYMMDD_HHMMSS_元ファイル名.拡張子`
- 閾値は`PhotoSelector.__init__()`にハードコード (75/65/55/45/35/25)
