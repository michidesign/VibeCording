import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useProgress } from '../context/ProgressContext';
import { gradeConfigs } from '../data/flags';
import type { Grade } from '../types';

export default function GradeSelect() {
  const navigate = useNavigate();
  const { setGrade } = useProgress();

  const handleSelectGrade = (grade: Grade) => {
    setGrade(grade);
    navigate('/home');
  };

  return (
    <div className="bg-gradient-main min-h-screen flex items-center justify-center py-12 md:py-16 relative bg-pattern-dots">
      <div className="content-container relative z-10 flex flex-col items-center">
        {/* Title */}
        <motion.div
          initial={{ opacity: 0, y: -30 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center section-gap"
        >
          <motion.h1
            className="text-display-lg mb-6 drop-shadow-lg"
            animate={{
              scale: [1, 1.02, 1],
              rotate: [-1, 1, -1],
            }}
            transition={{
              duration: 4,
              repeat: Infinity,
              ease: 'easeInOut',
            }}
          >
            <span className="text-rainbow">こっきずかん</span>
          </motion.h1>
          <motion.p
            className="text-heading-lg text-secondary"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.3 }}
          >
            🌍 学年を選んでね 🌏
          </motion.p>
        </motion.div>

        {/* Grade buttons grid */}
        <div className="grid grid-cols-2 md:grid-cols-3 gap-6 md:gap-8 max-w-3xl mx-auto">
          {gradeConfigs.map((config, index) => (
            <motion.button
              key={config.grade}
              initial={{ opacity: 0, scale: 0.8, rotate: -5 }}
              animate={{ opacity: 1, scale: 1, rotate: 0 }}
              transition={{ delay: index * 0.08, type: 'spring', stiffness: 200 }}
              whileHover={{
                scale: 1.08,
                rotate: -2,
                boxShadow: '0 16px 48px rgba(0, 0, 0, 0.15), 0 0 30px rgba(255, 255, 255, 0.3)',
              }}
              whileTap={{ scale: 0.95, rotate: 0 }}
              onClick={() => handleSelectGrade(config.grade)}
              className="glass-card-glow card-padding text-center cursor-pointer relative overflow-hidden"
            >
              <motion.div
                className="absolute inset-0 bg-gradient-to-br from-white/10 to-transparent"
                animate={{
                  opacity: [0.5, 0.8, 0.5],
                }}
                transition={{
                  duration: 2,
                  repeat: Infinity,
                  delay: index * 0.2,
                }}
              />
              <div className="relative z-10">
                <motion.div
                  className="text-heading-lg mb-4"
                  animate={{
                    y: [0, -3, 0],
                  }}
                  transition={{
                    duration: 2,
                    repeat: Infinity,
                    delay: index * 0.15,
                  }}
                >
                  {config.label}
                </motion.div>
                <div className="text-body-lg text-secondary">
                  🏳️ {config.flagCount}カ国
                </div>
              </div>
            </motion.button>
          ))}
        </div>

        {/* Info */}
        <motion.p
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.6 }}
          className="mt-14 md:mt-20 text-muted text-body-lg text-center"
        >
          ✨ あとから設定で変更できます ✨
        </motion.p>
      </div>
    </div>
  );
}
