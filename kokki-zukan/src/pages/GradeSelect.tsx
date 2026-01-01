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
    <div className="bg-gradient-main min-h-screen flex items-center justify-center py-12 md:py-16">
      <div className="content-container">
        {/* Title */}
        <motion.div
          initial={{ opacity: 0, y: -30 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center section-gap"
        >
          <h1 className="text-display-lg mb-6 drop-shadow-lg">
            こっきずかん
          </h1>
          <p className="text-heading-lg text-secondary">
            学年を選んでね
          </p>
        </motion.div>

        {/* Grade buttons grid */}
        <div className="grid grid-cols-2 md:grid-cols-3 gap-6 md:gap-8 max-w-3xl mx-auto">
          {gradeConfigs.map((config, index) => (
            <motion.button
              key={config.grade}
              initial={{ opacity: 0, scale: 0.8 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: index * 0.08 }}
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              onClick={() => handleSelectGrade(config.grade)}
              className="glass-card card-padding text-center cursor-pointer"
            >
              <div className="text-heading-lg mb-4">
                {config.label}
              </div>
              <div className="text-body-lg text-secondary">
                {config.flagCount}カ国
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
          あとから設定で変更できます
        </motion.p>
      </div>
    </div>
  );
}
