import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import type { Grade, ProgressData, FlagProgress, Stats } from '../types';

interface ProgressContextType {
  progress: ProgressData;
  setGrade: (grade: Grade) => void;
  markLearned: (flagCode: string) => void;
  markNotYet: (flagCode: string) => void;
  resetProgress: () => void;
  getFlagProgress: (flagCode: string) => FlagProgress;
  getLearnedCount: () => number;
  getLearnedCountByGrade: (grade: number) => number;
}

const STORAGE_KEY = 'kokki-zukan-progress';

const defaultStats: Stats = {
  totalLearned: 0,
  currentStreak: 0,
  lastPlayDate: undefined,
};

const defaultProgress: ProgressData = {
  grade: 1,
  flags: {},
  stats: defaultStats,
  earnedBadges: [],
};

const ProgressContext = createContext<ProgressContextType | undefined>(undefined);

function loadProgress(): ProgressData {
  try {
    const saved = localStorage.getItem(STORAGE_KEY);
    if (saved) {
      const parsed = JSON.parse(saved);
      return { ...defaultProgress, ...parsed };
    }
  } catch (e) {
    console.error('Failed to load progress:', e);
  }
  return defaultProgress;
}

function saveProgress(progress: ProgressData) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(progress));
  } catch (e) {
    console.error('Failed to save progress:', e);
  }
}

function updateStreak(stats: Stats): Stats {
  const today = new Date().toISOString().split('T')[0];
  const lastPlay = stats.lastPlayDate;

  if (!lastPlay) {
    return { ...stats, currentStreak: 1, lastPlayDate: today };
  }

  if (lastPlay === today) {
    return stats;
  }

  const lastDate = new Date(lastPlay);
  const todayDate = new Date(today);
  const diffDays = Math.floor((todayDate.getTime() - lastDate.getTime()) / (1000 * 60 * 60 * 24));

  if (diffDays === 1) {
    return { ...stats, currentStreak: stats.currentStreak + 1, lastPlayDate: today };
  } else {
    return { ...stats, currentStreak: 1, lastPlayDate: today };
  }
}

export function ProgressProvider({ children }: { children: ReactNode }) {
  const [progress, setProgress] = useState<ProgressData>(loadProgress);

  useEffect(() => {
    saveProgress(progress);
  }, [progress]);

  const setGrade = (grade: Grade) => {
    setProgress(prev => ({ ...prev, grade }));
  };

  const markLearned = (flagCode: string) => {
    const today = new Date().toISOString().split('T')[0];
    setProgress(prev => {
      const existingFlag = prev.flags[flagCode];
      const wasLearned = existingFlag?.learned || false;

      const newFlags = {
        ...prev.flags,
        [flagCode]: {
          learned: true,
          learnedDate: existingFlag?.learnedDate || today,
          reviewCount: (existingFlag?.reviewCount || 0) + 1,
          lastReview: today,
        },
      };

      const newStats = updateStreak({
        ...prev.stats,
        totalLearned: wasLearned ? prev.stats.totalLearned : prev.stats.totalLearned + 1,
      });

      return { ...prev, flags: newFlags, stats: newStats };
    });
  };

  const markNotYet = (flagCode: string) => {
    const today = new Date().toISOString().split('T')[0];
    setProgress(prev => {
      const existingFlag = prev.flags[flagCode];
      const newFlags = {
        ...prev.flags,
        [flagCode]: {
          learned: false,
          learnedDate: undefined,
          reviewCount: (existingFlag?.reviewCount || 0) + 1,
          lastReview: today,
        },
      };

      const wasLearned = existingFlag?.learned || false;
      const newStats = {
        ...prev.stats,
        totalLearned: wasLearned ? prev.stats.totalLearned - 1 : prev.stats.totalLearned,
      };

      return { ...prev, flags: newFlags, stats: newStats };
    });
  };

  const resetProgress = () => {
    setProgress(defaultProgress);
  };

  const getFlagProgress = (flagCode: string): FlagProgress => {
    return progress.flags[flagCode] || { learned: false, reviewCount: 0 };
  };

  const getLearnedCount = (): number => {
    return Object.values(progress.flags).filter(f => f.learned).length;
  };

  const getLearnedCountByGrade = (_grade: number): number => {
    // This would need access to flags data to filter by grade
    // For now, return total learned
    return getLearnedCount();
  };

  return (
    <ProgressContext.Provider
      value={{
        progress,
        setGrade,
        markLearned,
        markNotYet,
        resetProgress,
        getFlagProgress,
        getLearnedCount,
        getLearnedCountByGrade,
      }}
    >
      {children}
    </ProgressContext.Provider>
  );
}

export function useProgress() {
  const context = useContext(ProgressContext);
  if (context === undefined) {
    throw new Error('useProgress must be used within a ProgressProvider');
  }
  return context;
}
