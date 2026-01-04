import { motion } from 'framer-motion';
import { useMemo } from 'react';

interface DecorationItem {
    id: number;
    emoji: string;
    x: number;
    y: number;
    size: number;
    duration: number;
    delay: number;
}

// 子供向けの楽しい絵文字
const DECORATION_EMOJIS = ['⭐', '🌟', '✨', '🎈', '🌈', '💫', '🎉', '🎊', '⚡', '💖'];

function generateDecorations(count: number): DecorationItem[] {
    return Array.from({ length: count }, (_, i) => ({
        id: i,
        emoji: DECORATION_EMOJIS[Math.floor(Math.random() * DECORATION_EMOJIS.length)],
        x: Math.random() * 100,
        y: Math.random() * 100,
        size: 1.5 + Math.random() * 2,
        duration: 15 + Math.random() * 20,
        delay: Math.random() * 5,
    }));
}

interface FloatingDecorationsProps {
    count?: number;
}

export default function FloatingDecorations({ count = 15 }: FloatingDecorationsProps) {
    const decorations = useMemo(() => generateDecorations(count), [count]);

    return (
        <div className="fixed inset-0 pointer-events-none overflow-hidden z-0">
            {/* グラデーションオーバーレイ */}
            <div className="absolute inset-0 bg-gradient-radial opacity-30" />

            {/* シマーエフェクト */}
            <div className="absolute inset-0 shimmer-overlay" />

            {/* 浮遊する装飾 */}
            {decorations.map((item) => (
                <motion.div
                    key={item.id}
                    className="absolute"
                    style={{
                        left: `${item.x}%`,
                        top: `${item.y}%`,
                        fontSize: `${item.size}rem`,
                    }}
                    initial={{ opacity: 0, scale: 0 }}
                    animate={{
                        opacity: [0.3, 0.7, 0.3],
                        scale: [0.8, 1.2, 0.8],
                        y: [-20, 20, -20],
                        x: [-10, 10, -10],
                        rotate: [0, 10, -10, 0],
                    }}
                    transition={{
                        duration: item.duration,
                        delay: item.delay,
                        repeat: Infinity,
                        ease: 'easeInOut',
                    }}
                >
                    {item.emoji}
                </motion.div>
            ))}

            {/* 大きな装飾（コーナー用） */}
            <motion.div
                className="absolute -top-10 -left-10 text-[8rem] opacity-20"
                animate={{
                    rotate: [0, 360],
                    scale: [1, 1.1, 1],
                }}
                transition={{
                    rotate: { duration: 60, repeat: Infinity, ease: 'linear' },
                    scale: { duration: 8, repeat: Infinity, ease: 'easeInOut' },
                }}
            >
                🌍
            </motion.div>

            <motion.div
                className="absolute -bottom-10 -right-10 text-[8rem] opacity-20"
                animate={{
                    rotate: [360, 0],
                    scale: [1, 1.1, 1],
                }}
                transition={{
                    rotate: { duration: 60, repeat: Infinity, ease: 'linear' },
                    scale: { duration: 8, repeat: Infinity, ease: 'easeInOut', delay: 4 },
                }}
            >
                🌏
            </motion.div>

            {/* 虹のアーチ */}
            <motion.div
                className="absolute top-0 left-1/2 -translate-x-1/2 text-[6rem] opacity-30"
                animate={{
                    y: [-20, 0, -20],
                    scale: [1, 1.05, 1],
                }}
                transition={{
                    duration: 10,
                    repeat: Infinity,
                    ease: 'easeInOut',
                }}
            >
                🌈
            </motion.div>
        </div>
    );
}
