import { useMemo } from 'react';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useProgress } from '../context/ProgressContext';
import { getFlagsByGrade, gradeConfigs } from '../data/flags';
import { useKanjiConverter } from '../hooks/useKanjiConverter';

export default function Collection() {
  const navigate = useNavigate();
  const { progress, getFlagProgress } = useProgress();
  const { convertName } = useKanjiConverter();

  const gradeFlags = useMemo(() => {
    return getFlagsByGrade(progress.grade);
  }, [progress.grade]);

  const learnedFlags = gradeFlags.filter(f => getFlagProgress(f.code).learned);
  const unlearnedFlags = gradeFlags.filter(f => !getFlagProgress(f.code).learned);

  const currentGradeConfig = gradeConfigs.find(c => c.grade === progress.grade);
  const progressPercent = Math.round((learnedFlags.length / gradeFlags.length) * 100);

  return (
    <div className="bg-gradient-main min-h-screen py-12 md:py-16 relative bg-pattern-dots">
      <div className="content-container relative z-10">
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
          <h1 className="text-heading-lg">
            📖 <span className="text-rainbow">こっき ずかん</span>
          </h1>
          <div className="btn-icon" />
        </motion.div>

        {/* Stats */}
        <motion.div
          className="section-gap"
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.1 }}
        >
          <div className="glass-card-glow card-padding relative overflow-hidden">
            <motion.div
              className="absolute top-2 right-4 text-xl"
              animate={{ rotate: [0, 360] }}
              transition={{ duration: 10, repeat: Infinity, ease: 'linear' }}
            >
              🌟
            </motion.div>
            <div className="flex items-center justify-between mb-8">
              <div>
                <div className="text-body-lg text-secondary mb-2">
                  📚 {currentGradeConfig?.label}
                </div>
                <div className="flex items-baseline gap-3">
                  <motion.span
                    className="text-stat-lg"
                    key={learnedFlags.length}
                    initial={{ scale: 1.3 }}
                    animate={{ scale: 1 }}
                  >
                    {learnedFlags.length}
                  </motion.span>
                  <span className="text-body-lg text-secondary">/ {gradeFlags.length}</span>
                </div>
              </div>
              <motion.div
                className="text-stat-lg"
                animate={progressPercent === 100 ? { scale: [1, 1.1, 1] } : {}}
                transition={{ duration: 1, repeat: progressPercent === 100 ? Infinity : 0 }}
              >
                {progressPercent}%
              </motion.div>
            </div>
            <div className="progress-bar-bg h-3 md:h-4 relative overflow-hidden">
              <motion.div
                className="progress-bar-fill h-full relative"
                initial={{ width: 0 }}
                animate={{ width: `${progressPercent}%` }}
                transition={{ duration: 0.5 }}
              >
                <motion.div
                  className="absolute inset-0 bg-gradient-to-r from-transparent via-white/40 to-transparent"
                  animate={{ x: ['-100%', '200%'] }}
                  transition={{ duration: 2, repeat: Infinity, ease: 'linear' }}
                />
              </motion.div>
            </div>
          </div>
        </motion.div>

        {/* Flags grid */}
        <div className="space-y-12 md:space-y-16">
          {/* Learned section */}
          {learnedFlags.length > 0 && (
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.2 }}
            >
              <h2 className="text-heading-md mb-8 flex items-center gap-3">
                ⭐ おぼえた こっき
              </h2>
              <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-5 lg:grid-cols-6 gap-4 md:gap-5">
                {learnedFlags.map((flag, index) => (
                  <motion.div
                    key={flag.code}
                    initial={{ opacity: 0, scale: 0.8, rotate: -10 }}
                    animate={{ opacity: 1, scale: 1, rotate: 0 }}
                    transition={{ delay: index * 0.02, type: 'spring', stiffness: 200 }}
                    whileHover={{ scale: 1.1, rotate: 5 }}
                    className="glass-card-glow card-padding-sm text-center cursor-pointer"
                  >
                    <motion.div
                      className="text-emoji-sm mb-3"
                      animate={{ y: [0, -3, 0] }}
                      transition={{ duration: 2, repeat: Infinity, delay: index * 0.1 }}
                    >
                      {flag.emoji}
                    </motion.div>
                    <div className="text-body-sm text-secondary truncate">
                      {convertName(flag.name, flag.nameKana)}
                    </div>
                  </motion.div>
                ))}
              </div>
            </motion.div>
          )}

          {/* Unlearned section */}
          {unlearnedFlags.length > 0 && (
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.3 }}
            >
              <h2 className="text-heading-md text-muted mb-8 flex items-center gap-3">
                ❓ まだの こっき
              </h2>
              <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-5 lg:grid-cols-6 gap-4 md:gap-5">
                {unlearnedFlags.map((flag, index) => (
                  <motion.div
                    key={flag.code}
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    transition={{ delay: 0.3 + index * 0.02 }}
                    whileHover={{ scale: 1.05, opacity: 0.7 }}
                    className="glass-card card-padding-sm text-center opacity-50 cursor-pointer"
                  >
                    <motion.div
                      className="text-emoji-sm mb-3"
                      animate={{ rotate: [0, 10, -10, 0] }}
                      transition={{ duration: 3, repeat: Infinity, delay: index * 0.1 }}
                    >
                      ❓
                    </motion.div>
                    <div className="text-body-sm text-muted">???</div>
                  </motion.div>
                ))}
              </div>
            </motion.div>
          )}

          {/* All learned message */}
          {unlearnedFlags.length === 0 && learnedFlags.length > 0 && (
            <motion.div
              initial={{ opacity: 0, scale: 0.9, rotate: -5 }}
              animate={{ opacity: 1, scale: 1, rotate: 0 }}
              transition={{ type: 'spring', stiffness: 150 }}
              className="glass-card-glow card-padding text-center"
            >
              <motion.div
                className="text-emoji-lg mb-8"
                animate={{
                  scale: [1, 1.2, 1],
                  rotate: [-5, 5, -5],
                }}
                transition={{ duration: 2, repeat: Infinity }}
              >
                🏆
              </motion.div>
              <h2 className="text-heading-lg">
                <span className="text-rainbow">ぜんぶ おぼえたよ！</span>
              </h2>
              <p className="text-body-lg text-secondary mt-6">
                ✨ すごい！ かんぺきだね！ ✨
              </p>
            </motion.div>
          )}
        </div>
      </div>
    </div>
  );
}

