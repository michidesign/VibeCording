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

export default function Learning() {
  const navigate = useNavigate();
  const { progress, markLearned, markNotYet, getFlagProgress } = useProgress();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sessionFlags, setSessionFlags] = useState<Flag[]>([]);
  const [learnedInSession, setLearnedInSession] = useState<string[]>([]);
  const [notYetInSession, setNotYetInSession] = useState<string[]>([]);

  // Get flags for current grade and prioritize unlearned ones
  const availableFlags = useMemo(() => {
    const gradeFlags = getFlagsByGrade(progress.grade);
    const unlearned = gradeFlags.filter(f => !getFlagProgress(f.code).learned);
    const learned = gradeFlags.filter(f => getFlagProgress(f.code).learned);

    // Prioritize unlearned, then add some learned for review
    const prioritized = [...shuffleArray(unlearned), ...shuffleArray(learned)];
    return prioritized.slice(0, CARDS_PER_SESSION);
  }, [progress.grade, getFlagProgress]);

  useEffect(() => {
    setSessionFlags(availableFlags);
  }, [availableFlags]);

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
        mode: 'learning',
      },
    });
  };

  if (sessionFlags.length === 0) {
    return (
      <div className="bg-gradient-main min-h-screen flex items-center justify-center py-12 md:py-16 relative bg-pattern-dots">
        <div className="content-container relative z-10">
          <motion.div
            initial={{ opacity: 0, scale: 0.9, rotate: -5 }}
            animate={{ opacity: 1, scale: 1, rotate: 0 }}
            transition={{ type: 'spring', stiffness: 150 }}
            className="glass-card-glow card-padding text-center max-w-lg mx-auto"
          >
            <motion.div
              className="text-emoji-lg mb-8"
              animate={{
                scale: [1, 1.2, 1],
                rotate: [-10, 10, -10],
              }}
              transition={{ duration: 2, repeat: Infinity }}
            >
              🎉
            </motion.div>
            <h2 className="text-heading-lg mb-6">
              <span className="text-rainbow">すごい！</span>
            </h2>
            <p className="text-body-lg text-secondary mb-10">
              ✨ ぜんぶ おぼえたね！ ✨
            </p>
            <motion.button
              onClick={() => navigate('/home')}
              className="btn-lg glass-button text-white"
              whileHover={{ scale: 1.05, rotate: -2 }}
              whileTap={{ scale: 0.95 }}
            >
              🏠 ホームにもどる
            </motion.button>
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
    <div className="bg-gradient-main min-h-screen py-12 md:py-16 pb-24 relative bg-pattern-dots">
      <div className="content-container relative z-10 flex flex-col items-center">
        {/* Header */}
        <motion.div
          className="flex items-center justify-between section-gap py-6"
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
        >
          <motion.button
            onClick={() => navigate('/home')}
            className="glass-button btn-icon text-white text-heading-md"
            whileHover={{ scale: 1.1, rotate: -5 }}
            whileTap={{ scale: 0.9 }}
          >
            ←
          </motion.button>
          <motion.div
            className="glass-card-glow card-padding-sm"
            animate={{
              boxShadow: [
                '0 8px 32px rgba(0, 0, 0, 0.1)',
                '0 8px 32px rgba(0, 0, 0, 0.2)',
                '0 8px 32px rgba(0, 0, 0, 0.1)',
              ],
            }}
            transition={{ duration: 2, repeat: Infinity }}
          >
            <span className="text-body-lg font-bold">
              📚 {currentIndex + 1} / {sessionFlags.length}
            </span>
          </motion.div>
          <div className="btn-icon" />
        </motion.div>

        {/* Progress bar */}
        <div className="section-gap">
          <div className="progress-bar-bg h-3 md:h-4 relative overflow-hidden">
            <motion.div
              className="progress-bar-fill h-full relative"
              initial={{ width: 0 }}
              animate={{ width: `${progressPercent}%` }}
              transition={{ duration: 0.3 }}
            >
              <motion.div
                className="absolute inset-0 bg-gradient-to-r from-transparent via-white/40 to-transparent"
                animate={{ x: ['-100%', '200%'] }}
                transition={{ duration: 1.5, repeat: Infinity, ease: 'linear' }}
              />
            </motion.div>
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
          <motion.div
            className="glass-card-glow card-padding-sm text-center"
            whileHover={{ scale: 1.05 }}
          >
            <div className="text-body-sm text-secondary mb-2">⭕ おぼえた</div>
            <motion.div
              className="text-stat-md text-success"
              key={learnedInSession.length}
              initial={{ scale: 1.5 }}
              animate={{ scale: 1 }}
              transition={{ type: 'spring' }}
            >
              {learnedInSession.length}
            </motion.div>
          </motion.div>
          <motion.div
            className="glass-card-glow card-padding-sm text-center"
            whileHover={{ scale: 1.05 }}
          >
            <div className="text-body-sm text-secondary mb-2">❌ まだ</div>
            <motion.div
              className="text-stat-md text-muted"
              key={notYetInSession.length}
              initial={{ scale: 1.3 }}
              animate={{ scale: 1 }}
              transition={{ type: 'spring' }}
            >
              {notYetInSession.length}
            </motion.div>
          </motion.div>
        </div>
      </div>
    </div>
  );
}
