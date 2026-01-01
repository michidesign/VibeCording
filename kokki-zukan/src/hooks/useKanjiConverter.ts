import { useCallback } from 'react';
import { useProgress } from '../context/ProgressContext';
import { convertCountryName } from '../data/gradeKanji';

export function useKanjiConverter() {
  const { progress } = useProgress();

  const convertName = useCallback(
    (name: string, nameKana: string): string => {
      return convertCountryName(name, nameKana, progress.grade);
    },
    [progress.grade]
  );

  return { convertName, grade: progress.grade };
}
