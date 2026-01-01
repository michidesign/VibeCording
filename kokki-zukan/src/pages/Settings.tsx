import { useState } from 'react';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useProgress } from '../context/ProgressContext';
import { gradeConfigs } from '../data/flags';
import type { Grade } from '../types';

export default function Settings() {
  const navigate = useNavigate();
  const { progress, setGrade, resetProgress } = useProgress();
  const [showResetConfirm, setShowResetConfirm] = useState(false);

  const handleGradeChange = (grade: Grade) => {
    setGrade(grade);
  };

  const handleReset = () => {
    resetProgress();
    setShowResetConfirm(false);
    navigate('/');
  };

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
          <h1 className="text-heading-lg">せってい</h1>
          <div className="btn-icon" />
        </div>

        <div className="space-y-10 md:space-y-12">
          {/* Grade selection */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="glass-card card-padding"
          >
            <h2 className="text-heading-md mb-8">
              がくねん
            </h2>
            <div className="grid grid-cols-2 md:grid-cols-3 gap-5 md:gap-6">
              {gradeConfigs.map((config) => (
                <motion.button
                  key={config.grade}
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                  onClick={() => handleGradeChange(config.grade)}
                  className={`card-padding-sm rounded-2xl text-left transition-all ${
                    progress.grade === config.grade
                      ? 'bg-white/30 border-2 border-white/50'
                      : 'bg-white/10 border-2 border-transparent'
                  }`}
                >
                  <div className="text-body-lg font-bold text-white">{config.label}</div>
                  <div className="text-body-md text-secondary mt-2">{config.flagCount}カ国</div>
                </motion.button>
              ))}
            </div>
          </motion.div>

          {/* Stats */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="glass-card card-padding"
          >
            <h2 className="text-heading-md mb-8">
              がくしゅう きろく
            </h2>
            <div className="space-y-6 md:space-y-7">
              <div className="flex justify-between items-center">
                <span className="text-body-lg text-secondary">おぼえた こっき</span>
                <span className="text-body-lg font-bold text-white">
                  {progress.stats.totalLearned} こ
                </span>
              </div>
              <div className="flex justify-between items-center">
                <span className="text-body-lg text-secondary">れんぞく がくしゅう</span>
                <span className="text-body-lg font-bold text-white">
                  {progress.stats.currentStreak} にち
                </span>
              </div>
              {progress.stats.lastPlayDate && (
                <div className="flex justify-between items-center">
                  <span className="text-body-lg text-secondary">さいごに あそんだ ひ</span>
                  <span className="text-body-lg font-bold text-white">
                    {new Date(progress.stats.lastPlayDate).toLocaleDateString('ja-JP')}
                  </span>
                </div>
              )}
            </div>
          </motion.div>

          {/* Reset button */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="glass-card card-padding"
          >
            <h2 className="text-heading-md mb-8">
              データ
            </h2>
            <button
              onClick={() => setShowResetConfirm(true)}
              className="w-full btn-lg bg-danger-soft text-danger hover:bg-red-500/40 rounded-2xl transition-colors"
            >
              データを リセット
            </button>
            <p className="text-body-md text-muted mt-5 text-center">
              すべての がくしゅう きろくが けされます
            </p>
          </motion.div>
        </div>

        {/* Reset confirmation modal */}
        {showResetConfirm && (
          <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-6 z-50">
            <motion.div
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              className="glass-card-strong card-padding max-w-md w-full"
            >
              <div className="text-center mb-10">
                <div className="text-emoji-lg mb-6">⚠️</div>
                <h3 className="text-heading-lg">
                  ほんとうに リセット する？
                </h3>
                <p className="text-body-lg text-secondary mt-5">
                  おぼえた こっきの きろくが ぜんぶ きえるよ
                </p>
              </div>
              <div className="flex gap-5">
                <button
                  onClick={() => setShowResetConfirm(false)}
                  className="flex-1 btn-md glass-button text-white"
                >
                  やめる
                </button>
                <button
                  onClick={handleReset}
                  className="flex-1 btn-md btn-danger rounded-2xl"
                >
                  リセット
                </button>
              </div>
            </motion.div>
          </div>
        )}
      </div>
    </div>
  );
}
