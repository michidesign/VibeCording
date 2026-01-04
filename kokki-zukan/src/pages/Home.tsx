import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useProgress } from '../context/ProgressContext';
import { gradeConfigs, getFlagsByGrade } from '../data/flags';
import type { Grade } from '../types';

export default function Home() {
  const navigate = useNavigate();
  const { progress, getLearnedCount, setGrade } = useProgress();

  const currentGradeConfig = gradeConfigs.find(c => c.grade === progress.grade);
  const totalFlags = getFlagsByGrade(progress.grade).length;
  const learnedCount = getLearnedCount();
  const progressPercent = Math.round((learnedCount / totalFlags) * 100);

  const handleGradeChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setGrade(Number(e.target.value) as Grade);
  };

  const menuItems = [
    {
      label: 'がくしゅう',
      description: '新しい国旗を覚えよう',
      path: '/learning',
      icon: '📚',
      color: 'from-green-400/20 to-emerald-500/20',
    },
    {
      label: 'ふくしゅう',
      description: '覚えた国旗を確認',
      path: '/review',
      icon: '🔄',
      disabled: learnedCount === 0,
      color: 'from-blue-400/20 to-cyan-500/20',
    },
    {
      label: 'ずかん',
      description: '集めた国旗を見る',
      path: '/collection',
      icon: '📖',
      color: 'from-purple-400/20 to-pink-500/20',
    },
    {
      label: 'せってい',
      description: '学年や設定を変更',
      path: '/settings',
      icon: '⚙️',
      color: 'from-orange-400/20 to-yellow-500/20',
    },
  ];

  return (
    <div className="bg-gradient-main min-h-screen py-12 md:py-16 relative bg-pattern-waves">
      <div className="content-container relative z-10 flex flex-col items-center">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="flex items-center justify-between section-gap py-6"
        >
          <motion.h1
            className="text-display-md drop-shadow-lg"
            animate={{
              textShadow: [
                '0 0 20px rgba(255,255,255,0.3)',
                '0 0 40px rgba(255,255,255,0.5)',
                '0 0 20px rgba(255,255,255,0.3)',
              ],
            }}
            transition={{ duration: 3, repeat: Infinity }}
          >
            <span className="text-rainbow">こっきずかん</span>
          </motion.h1>
          <select
            value={progress.grade}
            onChange={handleGradeChange}
            className="glass-select font-bold"
          >
            {gradeConfigs.map((config) => (
              <option key={config.grade} value={config.grade}>
                {config.label}
              </option>
            ))}
          </select>
        </motion.div>

        {/* Progress Card */}
        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.1 }}
          className="glass-card-glow card-padding section-gap relative overflow-hidden"
        >
          {/* 背景のキラキラ */}
          <motion.div
            className="absolute top-2 right-4 text-2xl"
            animate={{
              rotate: [0, 360],
              scale: [1, 1.2, 1],
            }}
            transition={{
              rotate: { duration: 8, repeat: Infinity, ease: 'linear' },
              scale: { duration: 2, repeat: Infinity },
            }}
          >
            ✨
          </motion.div>

          <div className="flex items-center justify-between mb-8">
            <div>
              <p className="text-secondary text-body-lg mb-2">🏆 おぼえた こっき</p>
              <div className="flex items-baseline gap-3">
                <motion.span
                  className="text-stat-lg"
                  key={learnedCount}
                  initial={{ scale: 1.5, color: '#4ade80' }}
                  animate={{ scale: 1, color: '#2d3748' }}
                  transition={{ duration: 0.5 }}
                >
                  {learnedCount}
                </motion.span>
                <span className="text-body-lg text-secondary">/ {totalFlags}</span>
              </div>
            </div>
            <div className="text-right">
              <motion.div
                className="text-stat-hero"
                animate={{
                  scale: progressPercent === 100 ? [1, 1.1, 1] : 1,
                }}
                transition={{ duration: 1, repeat: progressPercent === 100 ? Infinity : 0 }}
              >
                {progressPercent}%
              </motion.div>
            </div>
          </div>
          <div className="progress-bar-bg h-4 md:h-5 relative overflow-hidden">
            <motion.div
              initial={{ width: 0 }}
              animate={{ width: `${progressPercent}%` }}
              transition={{ delay: 0.3, duration: 0.8, ease: 'easeOut' }}
              className="progress-bar-fill h-full relative"
            >
              {/* プログレスバーのキラキラ */}
              <motion.div
                className="absolute inset-0 bg-gradient-to-r from-transparent via-white/40 to-transparent"
                animate={{ x: ['-100%', '200%'] }}
                transition={{ duration: 2, repeat: Infinity, ease: 'linear' }}
              />
            </motion.div>
          </div>
          {progress.stats.currentStreak > 0 && (
            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.5 }}
              className="mt-6 flex items-center gap-3 text-secondary text-body-lg"
            >
              <motion.span
                className="text-2xl"
                animate={{ scale: [1, 1.3, 1] }}
                transition={{ duration: 0.5, repeat: Infinity }}
              >
                🔥
              </motion.span>
              <span>{progress.stats.currentStreak}日 れんぞく がくしゅうちゅう！</span>
            </motion.div>
          )}
        </motion.div>

        {/* Menu Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-8 md:gap-10 section-gap">
          {menuItems.map((item, index) => (
            <motion.button
              key={item.path}
              initial={{ opacity: 0, y: 20, rotate: -3 }}
              animate={{ opacity: 1, y: 0, rotate: 0 }}
              transition={{ delay: 0.2 + index * 0.1, type: 'spring', stiffness: 150 }}
              whileHover={{
                scale: item.disabled ? 1 : 1.05,
                rotate: item.disabled ? 0 : -2,
                boxShadow: item.disabled ? undefined : '0 20px 50px rgba(0, 0, 0, 0.2), 0 0 40px rgba(255, 255, 255, 0.3)',
              }}
              whileTap={{ scale: item.disabled ? 1 : 0.95 }}
              onClick={() => !item.disabled && navigate(item.path)}
              disabled={item.disabled}
              className={`glass-card-glow card-padding text-center transition-all relative overflow-hidden ${item.disabled ? 'opacity-40 cursor-not-allowed' : 'cursor-pointer'
                }`}
            >
              {/* カラフルなオーバーレイ */}
              <div className={`absolute inset-0 bg-gradient-to-br ${item.color} opacity-50`} />

              <div className="relative z-10">
                <motion.div
                  className="text-emoji-md mb-6"
                  animate={item.disabled ? {} : {
                    y: [0, -8, 0],
                    rotate: [0, 5, -5, 0],
                  }}
                  transition={{
                    duration: 3,
                    repeat: Infinity,
                    delay: index * 0.3,
                  }}
                >
                  {item.icon}
                </motion.div>
                <div className="text-heading-lg mb-3">{item.label}</div>
                <div className="text-body-lg text-muted">{item.description}</div>
              </div>
            </motion.button>
          ))}
        </div>

        {/* Grade info */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.6 }}
          className="text-center text-muted text-body-md flex items-center justify-center gap-2"
        >
          <span>🌟</span>
          <span>{currentGradeConfig?.label}モード: {currentGradeConfig?.flagCount}カ国</span>
          <span>🌟</span>
        </motion.div>
      </div>
    </div>
  );
}
