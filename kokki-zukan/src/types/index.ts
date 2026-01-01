// 国旗データの型
export interface Flag {
  code: string;        // 国コード（ISO 3166-1 alpha-2）
  emoji: string;       // 国旗絵文字
  name: string;        // 漢字表記の国名
  nameKana: string;    // ひらがな読み
  lat: number;         // 緯度
  lng: number;         // 経度
  grade: number;       // 出題学年（1-6）
}

// 学年型
export type Grade = 1 | 2 | 3 | 4 | 5 | 6;

// 進捗データの型
export interface FlagProgress {
  learned: boolean;        // 覚えたか
  learnedDate?: string;    // 覚えた日
  reviewCount: number;     // 復習回数
  lastReview?: string;     // 最後の復習日
}

// 統計情報
export interface Stats {
  totalLearned: number;    // 総学習済み数
  currentStreak: number;   // 連続学習日数
  lastPlayDate?: string;   // 最終プレイ日
}

// バッジの型
export interface Badge {
  id: string;
  name: string;
  icon: string;
  description: string;
  condition: (progress: ProgressData) => boolean;
}

// 進捗データ全体
export interface ProgressData {
  grade: Grade;
  flags: Record<string, FlagProgress>;
  stats: Stats;
  earnedBadges: string[];
}

// 学年ごとの設定
export interface GradeConfig {
  grade: Grade;
  label: string;
  labelKana: string;
  flagCount: number;
  color: string;
}

// 学習セッションの状態
export interface LearningSession {
  flags: Flag[];
  currentIndex: number;
  learnedInSession: string[];  // このセッションで覚えた国コード
  notYetInSession: string[];   // このセッションでまだの国コード
}
