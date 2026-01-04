import { useEffect, useState } from 'react';
import { motion } from 'framer-motion';
import { useNavigate, useLocation } from 'react-router-dom';
import { getFlagByCode } from '../data/flags';
import { useSound } from '../hooks/useSound';
import { useKanjiConverter } from '../hooks/useKanjiConverter';

interface LocationState {
  learnedInSession: string[];
  notYetInSession: string[];
  mode: 'learning' | 'review';
}

// コンフェッティ用の絵文字とカラー
const CONFETTI_ITEMS = ['⭐', '🌟', '✨', '🎊', '🎉', '💫', '🌈', '🏆', '🎈', '💖', '🔥', '⚡'];

function Confetti() {
  const [particles, setParticles] = useState<Array<{
    id: number;
    emoji: string;
    left: number;
    delay: number;
    duration: number;
    size: number;
  }>>([]);

  useEffect(() => {
    const newParticles = Array.from({ length: 40 }, (_, i) => ({
      id: i,
      emoji: CONFETTI_ITEMS[Math.floor(Math.random() * CONFETTI_ITEMS.length)],
      left: Math.random() * 100,
      delay: Math.random() * 2,
      duration: 2 + Math.random() * 3,
      size: 1.5 + Math.random() * 2,
    }));
    setParticles(newParticles);
  }, []);

  return (
    <div className="fixed inset-0 pointer-events-none overflow-hidden z-50">
      {particles.map((particle) => (
        <motion.div
          key={particle.id}
          className="absolute"
          style={{
            left: `${particle.left}%`,
            fontSize: `${particle.size}rem`,
          }}
          initial={{
            y: -50,
            rotate: 0,
            opacity: 1,
          }}
          animate={{
            y: typeof window !== 'undefined' ? window.innerHeight + 100 : 900,
            rotate: 360 * (Math.random() > 0.5 ? 1 : -1) * 2,
            opacity: [1, 1, 0],
          }}
          transition={{
            duration: particle.duration,
            delay: particle.delay,
            ease: 'linear',
          }}
        >
          {particle.emoji}
        </motion.div>
      ))}
    </div>
  );
}

export default function Result() {
  const navigate = useNavigate();
  const location = useLocation();
  const { play } = useSound();
  const { convertName } = useKanjiConverter();

  const state = location.state as LocationState | undefined;
  const learnedInSession = state?.learnedInSession || [];
  const notYetInSession = state?.notYetInSession || [];
  const mode = state?.mode || 'learning';

  const learnedFlags = learnedInSession.map(code => getFlagByCode(code)).filter(Boolean);

  useEffect(() => {
    if (learnedInSession.length > 0) {
      play('fanfare');
    }
  }, [learnedInSession.length, play]);

  const getMessage = () => {
    const total = learnedInSession.length + notYetInSession.length;
    const percentage = total > 0 ? (learnedInSession.length / total) * 100 : 0;

    if (percentage === 100) {
      return { emoji: '🏆', text: 'かんぺき！すごい！', color: 'text-yellow-300' };
    } else if (percentage >= 70) {
      return { emoji: '🎉', text: 'よく がんばったね！', color: 'text-green-300' };
    } else if (percentage >= 50) {
      return { emoji: '😊', text: 'いいちょうし！', color: 'text-blue-300' };
    } else {
      return { emoji: '💪', text: 'つぎは もっと がんばろう！', color: 'text-pink-300' };
    }
  };

  const message = getMessage();

  return (
    <div className="bg-gradient-main min-h-screen py-12 md:py-16 relative bg-pattern-dots">
      {/* 強化されたコンフェッティ */}
      {learnedInSession.length > 0 && <Confetti />}

      <div className="content-container relative z-10">
        {/* Result header */}
        <motion.div
          initial={{ opacity: 0, scale: 0.5, rotate: -10 }}
          animate={{ opacity: 1, scale: 1, rotate: 0 }}
          transition={{ type: 'spring', stiffness: 150, damping: 15 }}
          className="text-center mt-10 md:mt-14 section-gap"
        >
          <motion.div
            className="text-emoji-hero mb-8"
            animate={{
              scale: [1, 1.2, 1],
              rotate: [-5, 5, -5],
            }}
            transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut' }}
          >
            {message.emoji}
          </motion.div>
          <motion.h1
            className="text-heading-lg drop-shadow-lg"
            initial={{ y: 50, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.3 }}
          >
            🎊 <span className="text-rainbow">けっか はっぴょう！</span> 🎊
          </motion.h1>
          <motion.p
            className={`text-heading-md mt-6 ${message.color}`}
            initial={{ y: 30, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.5 }}
          >
            ✨ {message.text} ✨
          </motion.p>
        </motion.div>

        {/* Stats */}
        <motion.div
          initial={{ opacity: 0, y: 20, scale: 0.9 }}
          animate={{ opacity: 1, y: 0, scale: 1 }}
          transition={{ delay: 0.3 }}
          className="glass-card-glow card-padding max-w-lg mx-auto section-gap relative overflow-hidden"
        >
          {/* 背景のキラキラ */}
          <motion.div
            className="absolute top-2 left-2 text-xl"
            animate={{ rotate: [0, 360] }}
            transition={{ duration: 8, repeat: Infinity, ease: 'linear' }}
          >
            🌟
          </motion.div>
          <motion.div
            className="absolute top-2 right-2 text-xl"
            animate={{ rotate: [360, 0] }}
            transition={{ duration: 8, repeat: Infinity, ease: 'linear' }}
          >
            ⭐
          </motion.div>

          <div className="flex justify-around text-center">
            <motion.div
              initial={{ scale: 0 }}
              animate={{ scale: 1 }}
              transition={{ delay: 0.5, type: 'spring' }}
            >
              <div className="text-body-sm text-secondary mb-2">🎯 おぼえた</div>
              <motion.div
                className="text-stat-lg text-success"
                animate={{ scale: [1, 1.1, 1] }}
                transition={{ duration: 1, repeat: 3 }}
              >
                {learnedInSession.length}
              </motion.div>
            </motion.div>
            <div className="w-px bg-white/20" />
            <motion.div
              initial={{ scale: 0 }}
              animate={{ scale: 1 }}
              transition={{ delay: 0.6, type: 'spring' }}
            >
              <div className="text-body-sm text-secondary mb-2">📝 まだ</div>
              <div className="text-stat-lg text-muted">
                {notYetInSession.length}
              </div>
            </motion.div>
          </div>
        </motion.div>

        {/* Learned flags */}
        {learnedFlags.length > 0 && (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.5 }}
            className="max-w-lg mx-auto section-gap"
          >
            <motion.h2
              className="text-heading-md mb-8 text-center"
              animate={{ scale: [1, 1.02, 1] }}
              transition={{ duration: 2, repeat: Infinity }}
            >
              🌍 きょう おぼえた こっき 🌏
            </motion.h2>
            <div className="glass-card-glow card-padding">
              <div className="flex flex-wrap gap-5 md:gap-6 justify-center">
                {learnedFlags.map((flag, index) => (
                  <motion.div
                    key={flag!.code}
                    initial={{ opacity: 0, scale: 0, rotate: -180 }}
                    animate={{ opacity: 1, scale: 1, rotate: 0 }}
                    transition={{
                      delay: 0.7 + index * 0.1,
                      type: 'spring',
                      stiffness: 200,
                    }}
                    whileHover={{ scale: 1.2, rotate: 10 }}
                    className="flex flex-col items-center p-4 cursor-pointer"
                  >
                    <motion.span
                      className="text-emoji-sm"
                      animate={{ y: [0, -5, 0] }}
                      transition={{ duration: 2, repeat: Infinity, delay: index * 0.2 }}
                    >
                      {flag!.emoji}
                    </motion.span>
                    <span className="text-body-sm text-secondary mt-3">
                      {convertName(flag!.name, flag!.nameKana)}
                    </span>
                  </motion.div>
                ))}
              </div>
            </div>
          </motion.div>
        )}

        {/* Action buttons */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.7 }}
          className="flex flex-col gap-6 max-w-lg mx-auto"
        >
          <motion.button
            onClick={() => navigate(mode === 'learning' ? '/learning' : '/review')}
            className="w-full btn-lg btn-success rounded-2xl shadow-lg relative overflow-hidden"
            whileHover={{ scale: 1.03, rotate: -1 }}
            whileTap={{ scale: 0.97 }}
            animate={{
              boxShadow: [
                '0 0 20px rgba(74, 222, 128, 0.4)',
                '0 0 40px rgba(74, 222, 128, 0.8)',
                '0 0 20px rgba(74, 222, 128, 0.4)',
              ],
            }}
            transition={{
              boxShadow: { duration: 1.5, repeat: Infinity },
            }}
          >
            <motion.span
              className="absolute inset-0 bg-gradient-to-r from-transparent via-white/30 to-transparent"
              animate={{ x: ['-100%', '200%'] }}
              transition={{ duration: 2, repeat: Infinity }}
            />
            <span className="relative z-10">
              🚀 つづけて {mode === 'learning' ? 'がくしゅう' : 'ふくしゅう'}
            </span>
          </motion.button>
          <motion.button
            onClick={() => navigate('/home')}
            className="w-full btn-lg glass-button text-white"
            whileHover={{ scale: 1.03, rotate: 1 }}
            whileTap={{ scale: 0.97 }}
          >
            🏠 ホームにもどる
          </motion.button>
        </motion.div>
      </div>
    </div>
  );
}
