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
    },
    {
      label: 'ふくしゅう',
      description: '覚えた国旗を確認',
      path: '/review',
      icon: '🔄',
      disabled: learnedCount === 0,
    },
    {
      label: 'ずかん',
      description: '集めた国旗を見る',
      path: '/collection',
      icon: '📖',
    },
    {
      label: 'せってい',
      description: '学年や設定を変更',
      path: '/settings',
      icon: '⚙️',
    },
  ];

  return (
    <div className="bg-gradient-main min-h-screen py-12 md:py-16">
      <div className="content-container">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="flex items-center justify-between section-gap py-6"
        >
          <h1 className="text-display-md drop-shadow-lg">
            こっきずかん
          </h1>
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
          className="glass-card card-padding section-gap"
        >
          <div className="flex items-center justify-between mb-8">
            <div>
              <p className="text-secondary text-body-lg mb-2">おぼえた こっき</p>
              <div className="flex items-baseline gap-3">
                <span className="text-stat-lg">{learnedCount}</span>
                <span className="text-body-lg text-secondary">/ {totalFlags}</span>
              </div>
            </div>
            <div className="text-right">
              <div className="text-stat-hero">{progressPercent}%</div>
            </div>
          </div>
          <div className="progress-bar-bg h-4 md:h-5">
            <motion.div
              initial={{ width: 0 }}
              animate={{ width: `${progressPercent}%` }}
              transition={{ delay: 0.3, duration: 0.8, ease: 'easeOut' }}
              className="progress-bar-fill h-full"
            />
          </div>
          {progress.stats.currentStreak > 0 && (
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 0.5 }}
              className="mt-6 flex items-center gap-3 text-secondary text-body-lg"
            >
              <span className="text-2xl">🔥</span>
              <span>{progress.stats.currentStreak}日 れんぞく がくしゅうちゅう！</span>
            </motion.div>
          )}
        </motion.div>

        {/* Menu Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-8 md:gap-10 section-gap">
          {menuItems.map((item, index) => (
            <motion.button
              key={item.path}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.2 + index * 0.1 }}
              whileHover={{ scale: item.disabled ? 1 : 1.03 }}
              whileTap={{ scale: item.disabled ? 1 : 0.97 }}
              onClick={() => !item.disabled && navigate(item.path)}
              disabled={item.disabled}
              className={`glass-card card-padding text-center transition-all ${
                item.disabled ? 'opacity-40 cursor-not-allowed' : 'cursor-pointer'
              }`}
            >
              <div className="text-emoji-md mb-6">{item.icon}</div>
              <div className="text-heading-lg mb-3">{item.label}</div>
              <div className="text-body-lg text-muted">{item.description}</div>
            </motion.button>
          ))}
        </div>

        {/* Grade info */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.6 }}
          className="text-center text-muted text-body-md"
        >
          {currentGradeConfig?.label}モード: {currentGradeConfig?.flagCount}カ国
        </motion.div>
      </div>
    </div>
  );
}
