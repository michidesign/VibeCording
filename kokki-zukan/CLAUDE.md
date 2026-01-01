# こっきずかん - CLAUDE.md

## プロジェクト概要
小学生向けの国旗フラッシュカード学習アプリ。学年を選択すると難易度と漢字表示が自動調整される。

## 技術スタック
- **フレームワーク**: React 18 + Vite + TypeScript
- **スタイリング**: Tailwind CSS
- **地図**: react-leaflet + Leaflet.js
- **アニメーション**: Framer Motion
- **状態管理**: React Context + localStorage
- **ルーティング**: React Router DOM

## ディレクトリ構成
```
kokki-zukan/
├── src/
│   ├── components/       # 再利用可能なコンポーネント
│   │   └── FlashCard.tsx # 3Dフリップカード
│   ├── pages/            # ページコンポーネント
│   │   ├── GradeSelect.tsx  # 学年選択
│   │   ├── Home.tsx         # ホーム
│   │   ├── Learning.tsx     # 学習モード
│   │   ├── Review.tsx       # 復習モード
│   │   ├── Collection.tsx   # 図鑑
│   │   ├── Result.tsx       # 結果画面
│   │   └── Settings.tsx     # 設定
│   ├── data/
│   │   ├── flags.ts         # 国旗データ（200カ国）
│   │   └── gradeKanji.ts    # 学年別教育漢字
│   ├── hooks/               # カスタムフック
│   ├── context/             # React Context
│   └── types/               # TypeScript型定義
└── public/sounds/           # 効果音
```

## セットアップ方法
```bash
cd kokki-zukan
npm install
npm run dev
```

## 主要機能
1. **学年別難易度**: 1〜6年生の6段階、学年に応じて出題国数が増加
2. **漢字自動変換**: 学年に応じて未習得の漢字をひらがなに変換
3. **フラッシュカード学習**: 3Dフリップアニメーション、地図表示
4. **進捗管理**: localStorageで学習履歴を保存
5. **図鑑機能**: 覚えた国旗をコレクション表示

## 開発時の注意事項
- 国旗データは`src/data/flags.ts`で管理
- 学年別漢字変換ロジックは`src/data/gradeKanji.ts`と`src/hooks/useKanjiConverter.ts`
- 進捗データはlocalStorageに`kokki-zukan-progress`キーで保存
