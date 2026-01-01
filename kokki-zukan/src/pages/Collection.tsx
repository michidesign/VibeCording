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
          <h1 className="text-heading-lg">こっき ずかん</h1>
          <div className="btn-icon" />
        </div>

        {/* Stats */}
        <div className="section-gap">
          <div className="glass-card card-padding">
            <div className="flex items-center justify-between mb-8">
              <div>
                <div className="text-body-lg text-secondary mb-2">
                  {currentGradeConfig?.label}
                </div>
                <div className="flex items-baseline gap-3">
                  <span className="text-stat-lg">{learnedFlags.length}</span>
                  <span className="text-body-lg text-secondary">/ {gradeFlags.length}</span>
                </div>
              </div>
              <div className="text-stat-lg">{progressPercent}%</div>
            </div>
            <div className="progress-bar-bg h-3 md:h-4">
              <motion.div
                className="progress-bar-fill h-full"
                initial={{ width: 0 }}
                animate={{ width: `${progressPercent}%` }}
                transition={{ duration: 0.5 }}
              />
            </div>
          </div>
        </div>

        {/* Flags grid */}
        <div className="space-y-12 md:space-y-16">
          {/* Learned section */}
          {learnedFlags.length > 0 && (
            <div>
              <h2 className="text-heading-md mb-8 flex items-center gap-3">
                ⭐ おぼえた こっき
              </h2>
              <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-5 lg:grid-cols-6 gap-4 md:gap-5">
                {learnedFlags.map((flag, index) => (
                  <motion.div
                    key={flag.code}
                    initial={{ opacity: 0, scale: 0.8 }}
                    animate={{ opacity: 1, scale: 1 }}
                    transition={{ delay: index * 0.02 }}
                    className="glass-card card-padding-sm text-center"
                  >
                    <div className="text-emoji-sm mb-3">{flag.emoji}</div>
                    <div className="text-body-sm text-secondary truncate">
                      {convertName(flag.name, flag.nameKana)}
                    </div>
                  </motion.div>
                ))}
              </div>
            </div>
          )}

          {/* Unlearned section */}
          {unlearnedFlags.length > 0 && (
            <div>
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
                    className="glass-card card-padding-sm text-center opacity-50"
                  >
                    <div className="text-emoji-sm mb-3">❓</div>
                    <div className="text-body-sm text-muted">???</div>
                  </motion.div>
                ))}
              </div>
            </div>
          )}

          {/* All learned message */}
          {unlearnedFlags.length === 0 && learnedFlags.length > 0 && (
            <motion.div
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              className="glass-card card-padding text-center"
            >
              <div className="text-emoji-lg mb-8">🏆</div>
              <h2 className="text-heading-lg">
                ぜんぶ おぼえたよ！
              </h2>
              <p className="text-body-lg text-secondary mt-6">
                すごい！ かんぺきだね！
              </p>
            </motion.div>
          )}
        </div>
      </div>
    </div>
  );
}
