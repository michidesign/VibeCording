import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { MapContainer, TileLayer, Marker, useMap } from 'react-leaflet';
import { Icon } from 'leaflet';
import 'leaflet/dist/leaflet.css';
import type { Flag } from '../types';
import { useKanjiConverter } from '../hooks/useKanjiConverter';
import { useSound } from '../hooks/useSound';

interface FlashCardProps {
  flag: Flag;
  onLearned: () => void;
  onNotYet: () => void;
  showButtons?: boolean;
}

// Map center updater component
function MapUpdater({ lat, lng }: { lat: number; lng: number }) {
  const map = useMap();
  map.setView([lat, lng], 4);
  return null;
}

// Custom marker icon
const markerIcon = new Icon({
  iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
  iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
});

export default function FlashCard({ flag, onLearned, onNotYet, showButtons = true }: FlashCardProps) {
  const [isFlipped, setIsFlipped] = useState(false);
  const { convertName } = useKanjiConverter();
  const { play } = useSound();

  const displayName = convertName(flag.name, flag.nameKana);

  const handleFlip = () => {
    if (!isFlipped) {
      play('flip');
      setIsFlipped(true);
    }
  };

  const handleLearned = () => {
    play('correct');
    onLearned();
    setIsFlipped(false);
  };

  const handleNotYet = () => {
    play('wrong');
    onNotYet();
    setIsFlipped(false);
  };

  return (
    <div className="flex flex-col items-center gap-10 md:gap-12 w-full max-w-md md:max-w-lg mx-auto">
      {/* Card */}
      <div
        className="relative w-full h-[32rem] md:h-[36rem] cursor-pointer"
        style={{ perspective: '1000px' }}
        onClick={handleFlip}
      >
        <motion.div
          className="w-full h-full relative"
          initial={false}
          animate={{ rotateY: isFlipped ? 180 : 0 }}
          transition={{ duration: 0.6, type: 'spring', stiffness: 100 }}
          style={{ transformStyle: 'preserve-3d' }}
        >
          {/* Front of card */}
          <div
            className="absolute inset-0 glass-card-glow flex flex-col items-center justify-center p-8 md:p-10 relative overflow-hidden"
            style={{ backfaceVisibility: 'hidden' }}
          >
            {/* 装飾的なキラキラ */}
            <motion.div
              className="absolute top-4 left-4 text-2xl"
              animate={{
                scale: [1, 1.3, 1],
                rotate: [0, 180, 360],
              }}
              transition={{ duration: 3, repeat: Infinity }}
            >
              ✨
            </motion.div>
            <motion.div
              className="absolute top-4 right-4 text-2xl"
              animate={{
                scale: [1.3, 1, 1.3],
                rotate: [360, 180, 0],
              }}
              transition={{ duration: 3, repeat: Infinity }}
            >
              ⭐
            </motion.div>
            <motion.div
              className="absolute bottom-4 left-4 text-2xl"
              animate={{
                scale: [1, 1.2, 1],
              }}
              transition={{ duration: 2, repeat: Infinity }}
            >
              🌟
            </motion.div>
            <motion.div
              className="absolute bottom-4 right-4 text-2xl"
              animate={{
                scale: [1.2, 1, 1.2],
              }}
              transition={{ duration: 2, repeat: Infinity, delay: 0.5 }}
            >
              💫
            </motion.div>

            <motion.span
              className="text-emoji-hero drop-shadow-lg"
              animate={{
                y: [0, -10, 0],
                rotate: [-2, 2, -2],
              }}
              transition={{ duration: 3, repeat: Infinity, ease: 'easeInOut' }}
            >
              {flag.emoji}
            </motion.span>
            <motion.div
              className="mt-10 text-muted text-body-lg"
              animate={{ opacity: [0.6, 1, 0.6] }}
              transition={{ duration: 2, repeat: Infinity }}
            >
              👆 タップして めくる
            </motion.div>
          </div>

          {/* Back of card */}
          <div
            className="absolute inset-0 glass-card-glow flex flex-col items-center p-8 md:p-10 relative overflow-hidden"
            style={{
              backfaceVisibility: 'hidden',
              transform: 'rotateY(180deg)',
            }}
          >
            {/* 成功のキラキラ */}
            <motion.div
              className="absolute top-3 right-3 text-xl"
              animate={{
                rotate: [0, 360],
                scale: [1, 1.2, 1],
              }}
              transition={{ duration: 4, repeat: Infinity, ease: 'linear' }}
            >
              🎉
            </motion.div>

            <motion.span
              className="text-emoji-lg mb-6 drop-shadow-lg"
              initial={{ scale: 0, rotate: -180 }}
              animate={{ scale: 1, rotate: 0 }}
              transition={{ type: 'spring', stiffness: 200, delay: 0.3 }}
            >
              {flag.emoji}
            </motion.span>
            <motion.h2
              className="text-heading-lg mb-8 drop-shadow-lg text-center"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4 }}
            >
              <span className="text-rainbow">{displayName}</span>
            </motion.h2>
            <div className="w-full h-52 md:h-64 rounded-2xl overflow-hidden border-2 border-white/30 shadow-lg">
              {isFlipped && (
                <MapContainer
                  center={[flag.lat, flag.lng]}
                  zoom={4}
                  scrollWheelZoom={false}
                  dragging={false}
                  zoomControl={false}
                  className="w-full h-full"
                >
                  <TileLayer
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                  />
                  <Marker position={[flag.lat, flag.lng]} icon={markerIcon} />
                  <MapUpdater lat={flag.lat} lng={flag.lng} />
                </MapContainer>
              )}
            </div>
          </div>
        </motion.div>
      </div>

      {/* Buttons */}
      <AnimatePresence>
        {isFlipped && showButtons && (
          <motion.div
            initial={{ opacity: 0, y: 20, scale: 0.9 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 20, scale: 0.9 }}
            className="flex gap-6 md:gap-8"
          >
            <motion.button
              whileHover={{ scale: 1.1, rotate: -3 }}
              whileTap={{ scale: 0.9 }}
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
              onClick={(e) => {
                e.stopPropagation();
                handleLearned();
              }}
              className="btn-lg btn-success rounded-2xl shadow-lg relative overflow-hidden"
            >
              <motion.span
                className="absolute inset-0 bg-gradient-to-r from-transparent via-white/30 to-transparent"
                animate={{ x: ['-100%', '200%'] }}
                transition={{ duration: 2, repeat: Infinity }}
              />
              <span className="relative z-10">⭕ おぼえた！</span>
            </motion.button>
            <motion.button
              whileHover={{ scale: 1.1, rotate: 3 }}
              whileTap={{ scale: 0.9 }}
              onClick={(e) => {
                e.stopPropagation();
                handleNotYet();
              }}
              className="btn-lg glass-button text-white"
            >
              ❌ まだ...
            </motion.button>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
