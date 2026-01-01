import { useState, useEffect, useMemo } from 'react';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import FlashCard from '../components/FlashCard';
import { useProgress } from '../context/ProgressContext';
import { getFlagsByGrade } from '../data/flags';
import type { Flag } from '../types';

const CARDS_PER_SESSION = 10;

function shuffleArray<T>(array: T[]): T[] {
  const newArray = [...array];
  for (let i = newArray.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [newArray[i], newArray[j]] = [newArray[j], newArray[i]];
  }
  return newArray;
}

export default function Review() {
  const navigate = useNavigate();
  const { progress, markLearned, markNotYet, getFlagProgress } = useProgress();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionFlags, setSessionFlags] = useState<Flag[]>([]);
  const [learnedInSession, setLearnedInSession] = useState<string[]>([]);
  const [notYetInSession, setNotYetInSession] = useState<string[]>([]);

  // Get learned flags for review, prioritize those not reviewed recently
  const reviewFlags = useMemo(() => {
    const gradeFlags = getFlagsByGrade(progress.grade);
    const learned = gradeFlags.filter(f => getFlagProgress(f.code).learned);

    // Sort by last review date (oldest first)
    const sorted = learned.sort((a, b) => {
      const aProgress = getFlagProgress(a.code);
      const bProgress = getFlagProgress(b.code);
      const aDate = aProgress.lastReview ? new Date(aProgress.lastReview).getTime() : 0;
      const bDate = bProgress.lastReview ? new Date(bProgress.lastReview).getTime() : 0;
      return aDate - bDate;
    });

    return shuffleArray(sorted.slice(0, CARDS_PER_SESSION));
  }, [progress.grade, getFlagProgress]);

  useEffect(() => {
    setSessionFlags(reviewFlags);
  }, [reviewFlags]);

  const currentFlag = sessionFlags[currentIndex];
  const isComplete = currentIndex >= sessionFlags.length;

  const handleLearned = () => {
    if (currentFlag) {
      markLearned(currentFlag.code);
      setLearnedInSession(prev => [...prev, currentFlag.code]);
      setCurrentIndex(prev => prev + 1);
    }
  };

  const handleNotYet = () => {
    if (currentFlag) {
      markNotYet(currentFlag.code);
      setNotYetInSession(prev => [...prev, currentFlag.code]);
      setCurrentIndex(prev => prev + 1);
    }
  };

  const handleFinish = () => {
    navigate('/result', {
      state: {
        learnedInSession,
        notYetInSession,
        mode: 'review',
      },
    });
  };

  if (sessionFlags.length === 0) {
    return (
      <div className="bg-gradient-main min-h-screen flex items-center justify-center py-12 md:py-16">
        <div className="content-container">
          <motion.div
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            className="glass-card card-padding text-center max-w-lg mx-auto"
          >
            <div className="text-emoji-lg mb-8">📚</div>
            <h2 className="text-heading-lg mb-6">
              ふくしゅうする こっきが ないよ
            </h2>
            <p className="text-body-lg text-secondary mb-10">
              まずは がくしゅうして おぼえよう！
            </p>
            <button
              onClick={() => navigate('/learning')}
              className="btn-lg glass-button text-white"
            >
              がくしゅう する
            </button>
          </motion.div>
        </div>
      </div>
    );
  }

  if (isComplete) {
    handleFinish();
    return null;
  }

  const progressPercent = (currentIndex / sessionFlags.length) * 100;

  return (
    <div className="bg-gradient-main min-h-screen py-12 md:py-16">
      <div className="content-container">
        {/* Header */}
        <div className="flex items-center justify-between section-gap py-6">
          <button
            onClick={() => navigate('/home')}
            className="glass-button btn-icon text-white text-heading-md"
          >
            ←
          </button>
          <div className="glass-card card-padding-sm flex items-center gap-3">
            <span className="text-info text-body-md">ふくしゅう</span>
            <span className="text-white text-body-lg font-bold">
              {currentIndex + 1} / {sessionFlags.length}
            </span>
          </div>
          <div className="btn-icon" />
        </div>

        {/* Progress bar */}
        <div className="section-gap">
          <div className="progress-bar-bg h-3 md:h-4">
            <motion.div
              className="progress-bar-fill-review h-full"
              initial={{ width: 0 }}
              animate={{ width: `${progressPercent}%` }}
              transition={{ duration: 0.3 }}
            />
          </div>
        </div>

        {/* Card */}
        <div className="flex justify-center section-gap">
          {currentFlag && (
            <FlashCard
              key={currentFlag.code}
              flag={currentFlag}
              onLearned={handleLearned}
              onNotYet={handleNotYet}
            />
          )}
        </div>

        {/* Session stats */}
        <div className="flex justify-center gap-8 md:gap-10">
          <div className="glass-card card-padding-sm text-center">
            <div className="text-body-sm text-secondary mb-2">おぼえてた</div>
            <div className="text-stat-md text-success">
              {learnedInSession.length}
            </div>
          </div>
          <div className="glass-card card-padding-sm text-center">
            <div className="text-body-sm text-secondary mb-2">わすれてた</div>
            <div className="text-stat-md text-muted">
              {notYetInSession.length}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
