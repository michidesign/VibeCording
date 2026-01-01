import { useEffect } from 'react';
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
      return { emoji: '🏆', text: 'かんぺき！すごい！' };
    } else if (percentage >= 70) {
      return { emoji: '🎉', text: 'よく がんばったね！' };
    } else if (percentage >= 50) {
      return { emoji: '😊', text: 'いいちょうし！' };
    } else {
      return { emoji: '💪', text: 'つぎは もっと がんばろう！' };
    }
  };

  const message = getMessage();

  return (
    <div className="bg-gradient-main min-h-screen py-12 md:py-16">
      <div className="content-container">
        {/* Confetti animation */}
        {learnedInSession.length > 0 && (
          <div className="fixed inset-0 pointer-events-none overflow-hidden">
            {[...Array(20)].map((_, i) => (
              <motion.div
                key={i}
                className="absolute text-3xl md:text-4xl"
                initial={{
                  x: Math.random() * (typeof window !== 'undefined' ? window.innerWidth : 400),
                  y: -50,
                  rotate: 0,
                }}
                animate={{
                  y: (typeof window !== 'undefined' ? window.innerHeight : 800) + 50,
                  rotate: 360 * (Math.random() > 0.5 ? 1 : -1),
                }}
                transition={{
                  duration: 2 + Math.random() * 2,
                  delay: Math.random() * 0.5,
                  repeat: 0,
                }}
              >
                {['⭐', '🌟', '✨', '🎊'][Math.floor(Math.random() * 4)]}
              </motion.div>
            ))}
          </div>
        )}

        {/* Result header */}
        <motion.div
          initial={{ opacity: 0, scale: 0.5 }}
          animate={{ opacity: 1, scale: 1 }}
          className="text-center mt-10 md:mt-14 section-gap"
        >
          <div className="text-emoji-hero mb-8">{message.emoji}</div>
          <h1 className="text-heading-lg drop-shadow-lg">
            けっか はっぴょう！
          </h1>
          <p className="text-heading-md text-secondary mt-6">{message.text}</p>
        </motion.div>

        {/* Stats */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3 }}
          className="glass-card card-padding max-w-lg mx-auto section-gap"
        >
          <div className="flex justify-around text-center">
            <div>
              <div className="text-body-sm text-secondary mb-2">おぼえた</div>
              <div className="text-stat-lg text-success">
                {learnedInSession.length}
              </div>
            </div>
            <div className="w-px bg-white/20" />
            <div>
              <div className="text-body-sm text-secondary mb-2">まだ</div>
              <div className="text-stat-lg text-muted">
                {notYetInSession.length}
              </div>
            </div>
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
            <h2 className="text-heading-md mb-8 text-center">
              きょう おぼえた こっき
            </h2>
            <div className="glass-card card-padding">
              <div className="flex flex-wrap gap-5 md:gap-6 justify-center">
                {learnedFlags.map((flag) => (
                  <motion.div
                    key={flag!.code}
                    initial={{ opacity: 0, scale: 0 }}
                    animate={{ opacity: 1, scale: 1 }}
                    className="flex flex-col items-center p-4"
                  >
                    <span className="text-emoji-sm">{flag!.emoji}</span>
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
          <button
            onClick={() => navigate(mode === 'learning' ? '/learning' : '/review')}
            className="w-full btn-lg btn-success rounded-2xl shadow-lg"
          >
            つづけて {mode === 'learning' ? 'がくしゅう' : 'ふくしゅう'}
          </button>
          <button
            onClick={() => navigate('/home')}
            className="w-full btn-lg glass-button text-white"
          >
            ホームにもどる
          </button>
        </motion.div>
      </div>
    </div>
  );
}
