import { useCallback, useRef, useEffect } from 'react';

type SoundType = 'correct' | 'wrong' | 'flip' | 'fanfare';

const soundFiles: Record<SoundType, string> = {
  correct: '/sounds/correct.mp3',
  wrong: '/sounds/wrong.mp3',
  flip: '/sounds/flip.mp3',
  fanfare: '/sounds/fanfare.mp3',
};

export function useSound() {
  const audioRefs = useRef<Record<SoundType, HTMLAudioElement | null>>({
    correct: null,
    wrong: null,
    flip: null,
    fanfare: null,
  });

  useEffect(() => {
    // Preload sounds
    Object.entries(soundFiles).forEach(([type, src]) => {
      const audio = new Audio(src);
      audio.preload = 'auto';
      audioRefs.current[type as SoundType] = audio;
    });

    return () => {
      // Cleanup
      Object.values(audioRefs.current).forEach(audio => {
        if (audio) {
          audio.pause();
          audio.src = '';
        }
      });
    };
  }, []);

  const play = useCallback((type: SoundType) => {
    const audio = audioRefs.current[type];
    if (audio) {
      audio.currentTime = 0;
      audio.play().catch(e => {
        console.log('Audio play failed:', e);
      });
    }
  }, []);

  return { play };
}
