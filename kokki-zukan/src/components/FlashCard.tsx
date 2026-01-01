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
            className="absolute inset-0 glass-card-strong flex flex-col items-center justify-center p-8 md:p-10"
            style={{ backfaceVisibility: 'hidden' }}
          >
            <span className="text-emoji-hero drop-shadow-lg">{flag.emoji}</span>
            <div className="mt-10 text-muted text-body-lg">
              タップして めくる
            </div>
          </div>

          {/* Back of card */}
          <div
            className="absolute inset-0 glass-card-strong flex flex-col items-center p-8 md:p-10"
            style={{
              backfaceVisibility: 'hidden',
              transform: 'rotateY(180deg)',
            }}
          >
            <span className="text-emoji-lg mb-6 drop-shadow-lg">{flag.emoji}</span>
            <h2 className="text-heading-lg mb-8 drop-shadow-lg">
              {displayName}
            </h2>
            <div className="w-full h-52 md:h-64 rounded-2xl overflow-hidden border border-white/20">
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
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 20 }}
            className="flex gap-6 md:gap-8"
          >
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              onClick={(e) => {
                e.stopPropagation();
                handleLearned();
              }}
              className="btn-lg btn-success rounded-2xl shadow-lg"
            >
              ⭕ おぼえた！
            </motion.button>
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
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
