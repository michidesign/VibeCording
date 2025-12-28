#!/usr/bin/env python3
"""
Photo Selector - 写真自動選定ツール
大量の写真を品質評価し、「最高」から「非常に悪い」まで7段階に分類します。
"""

import argparse
import csv
import os
import shutil
import sys
from datetime import datetime
from pathlib import Path
from typing import Optional, List, Tuple

import cv2
import numpy as np
from PIL import Image
from PIL.ExifTags import TAGS
from tqdm import tqdm


class PhotoEvaluator:
    """写真の品質を評価するクラス"""

    def __init__(self):
        self.supported_extensions = {'.jpg', '.jpeg', '.png', '.JPG', '.JPEG', '.PNG'}

        # OpenCVの顔検出器（Haar Cascade）
        self.face_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
        )
        self.eye_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_eye.xml'
        )
        self.smile_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_smile.xml'
        )

    def evaluate_sharpness(self, image: np.ndarray) -> float:
        """
        シャープさを評価（Laplacian分散）
        Returns: 0-100のスコア
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        laplacian_var = cv2.Laplacian(gray, cv2.CV_64F).var()

        # Laplacian分散値を0-100にスケーリング
        # 経験則: 100以下はブレ、500以上はシャープ
        if laplacian_var < 100:
            return (laplacian_var / 100) * 30
        elif laplacian_var < 500:
            return 30 + ((laplacian_var - 100) / 400) * 50
        else:
            return min(100, 80 + ((laplacian_var - 500) / 500) * 20)

    def evaluate_exposure(self, image: np.ndarray) -> float:
        """
        露出を評価（ヒストグラム分析）
        Returns: 0-100のスコア
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        hist = cv2.calcHist([gray], [0], None, [256], [0, 256])
        hist = hist.flatten() / hist.sum()

        # 白飛び・黒つぶれの検出
        dark_ratio = hist[:20].sum()  # 暗すぎるピクセルの割合
        bright_ratio = hist[235:].sum()  # 明るすぎるピクセルの割合

        # 中間調の分布
        mid_ratio = hist[50:200].sum()

        score = 100

        # 白飛びペナルティ
        if bright_ratio > 0.1:
            score -= min(40, (bright_ratio - 0.1) * 200)

        # 黒つぶれペナルティ
        if dark_ratio > 0.1:
            score -= min(40, (dark_ratio - 0.1) * 200)

        # 中間調が少ないとペナルティ
        if mid_ratio < 0.5:
            score -= (0.5 - mid_ratio) * 40

        return max(0, score)

    def evaluate_contrast(self, image: np.ndarray) -> float:
        """
        コントラストを評価
        Returns: 0-100のスコア
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        contrast = gray.std()

        # 標準偏差が40-80程度が理想的
        if contrast < 20:
            return (contrast / 20) * 40
        elif contrast < 40:
            return 40 + ((contrast - 20) / 20) * 30
        elif contrast < 80:
            return 70 + ((contrast - 40) / 40) * 30
        else:
            # コントラストが高すぎる場合は少し減点
            return max(70, 100 - ((contrast - 80) / 40) * 20)

    def detect_faces(self, image: np.ndarray) -> List[Tuple[int, int, int, int]]:
        """
        顔を検出（OpenCV Haar Cascade使用）
        Returns: 顔の位置リスト [(x, y, w, h), ...]
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        # 顔検出
        faces = self.face_cascade.detectMultiScale(
            gray,
            scaleFactor=1.1,
            minNeighbors=5,
            minSize=(30, 30)
        )

        return list(faces) if len(faces) > 0 else []

    def detect_eyes_in_face(self, image: np.ndarray, face: Tuple[int, int, int, int]) -> int:
        """
        顔領域内の目を検出
        Returns: 検出された目の数
        """
        x, y, w, h = face
        roi_gray = cv2.cvtColor(image[y:y+h, x:x+w], cv2.COLOR_BGR2GRAY)

        # 上半分のみで目を検出（顔の上半分に目がある）
        roi_upper = roi_gray[0:int(h*0.6), :]

        eyes = self.eye_cascade.detectMultiScale(
            roi_upper,
            scaleFactor=1.1,
            minNeighbors=3,
            minSize=(20, 20)
        )

        return len(eyes)

    def detect_smile_in_face(self, image: np.ndarray, face: Tuple[int, int, int, int]) -> bool:
        """
        顔領域内の笑顔を検出
        Returns: 笑顔が検出されたかどうか
        """
        x, y, w, h = face
        roi_gray = cv2.cvtColor(image[y:y+h, x:x+w], cv2.COLOR_BGR2GRAY)

        # 下半分で笑顔を検出（口は顔の下半分にある）
        roi_lower = roi_gray[int(h*0.5):, :]

        smiles = self.smile_cascade.detectMultiScale(
            roi_lower,
            scaleFactor=1.5,
            minNeighbors=15,
            minSize=(25, 25)
        )

        return len(smiles) > 0

    def evaluate_eyes_open(self, image: np.ndarray, faces: List[Tuple[int, int, int, int]]) -> float:
        """
        目が開いているかを評価
        Returns: 0-100のスコア
        """
        if not faces:
            return 50  # 顔がない場合は中間値

        total_score = 0
        for face in faces:
            eyes_count = self.detect_eyes_in_face(image, face)

            if eyes_count >= 2:
                total_score += 100  # 両目検出
            elif eyes_count == 1:
                total_score += 60   # 片目のみ
            else:
                total_score += 20   # 目が検出されない（閉じている可能性）

        return total_score / len(faces)

    def evaluate_smile(self, image: np.ndarray, faces: List[Tuple[int, int, int, int]]) -> float:
        """
        笑顔度を評価
        Returns: 0-100のスコア
        """
        if not faces:
            return 50  # 顔がない場合は中間値

        total_score = 0
        for face in faces:
            if self.detect_smile_in_face(image, face):
                total_score += 100
            else:
                total_score += 40  # 笑顔でなくても悪くはない

        return total_score / len(faces)

    def evaluate_face_composition(self, image: np.ndarray, faces: List[Tuple[int, int, int, int]]) -> float:
        """
        顔の構図を評価（位置とサイズ）
        Returns: 0-100のスコア
        """
        if not faces:
            return 50  # 顔がない場合は中間値

        height, width = image.shape[:2]
        image_area = height * width

        total_score = 0
        for (x, y, w, h) in faces:
            face_center_x = x + w / 2
            face_center_y = y + h / 2
            face_area = w * h

            # 位置スコア: 中央または三分割点に近いほど高スコア
            x_ratio = face_center_x / width
            y_ratio = face_center_y / height

            # 三分割点（1/3, 2/3）または中央（1/2）に近いか
            x_positions = [1/3, 1/2, 2/3]
            y_positions = [1/3, 1/2, 2/3]

            min_x_dist = min(abs(x_ratio - p) for p in x_positions)
            min_y_dist = min(abs(y_ratio - p) for p in y_positions)

            position_score = 100 - (min_x_dist + min_y_dist) * 200
            position_score = max(0, min(100, position_score))

            # サイズスコア: 顔が画像の5-30%程度が理想
            face_ratio = face_area / image_area
            if face_ratio < 0.01:
                size_score = 30  # 顔が小さすぎる
            elif face_ratio < 0.05:
                size_score = 50 + (face_ratio - 0.01) / 0.04 * 30
            elif face_ratio < 0.30:
                size_score = 80 + (face_ratio - 0.05) / 0.25 * 20
            else:
                size_score = max(60, 100 - (face_ratio - 0.30) * 100)  # 顔が大きすぎる

            total_score += (position_score + size_score) / 2

        return total_score / len(faces)

    def evaluate_face_size(self, image: np.ndarray, faces: List[Tuple[int, int, int, int]]) -> float:
        """
        顔のサイズが適切かを評価
        Returns: 0-100のスコア
        """
        if not faces:
            return 0  # 顔がない

        height, width = image.shape[:2]
        image_area = height * width

        max_face_ratio = 0
        for (x, y, w, h) in faces:
            face_area = w * h
            face_ratio = face_area / image_area
            max_face_ratio = max(max_face_ratio, face_ratio)

        # 顔が画像の3-25%程度が理想
        if max_face_ratio < 0.01:
            return 30
        elif max_face_ratio < 0.03:
            return 30 + (max_face_ratio - 0.01) / 0.02 * 30
        elif max_face_ratio < 0.25:
            return 60 + (max_face_ratio - 0.03) / 0.22 * 40
        else:
            return max(50, 100 - (max_face_ratio - 0.25) * 100)


class PhotoSelector:
    """写真を選定・分類するメインクラス"""

    def __init__(self, input_dir: str, output_dir: str, batch_size: int = 500):
        self.input_dir = Path(input_dir)
        self.output_dir = Path(output_dir)
        self.batch_size = batch_size
        self.evaluator = PhotoEvaluator()
        self.processed_file = self.output_dir / '.processed.txt'
        self.results = []

        # 7段階分類の閾値
        self.tier1_threshold = 75  # 最高
        self.tier2_threshold = 65  # とても良い
        self.tier3_threshold = 55  # 良い
        self.tier4_threshold = 45  # 普通
        self.tier5_threshold = 35  # やや悪い
        self.tier6_threshold = 25  # 悪い
        # 25未満は「非常に悪い」

    def setup_output_dirs(self):
        """出力ディレクトリを作成（7段階）"""
        (self.output_dir / '1_最高').mkdir(parents=True, exist_ok=True)
        (self.output_dir / '2_とても良い').mkdir(parents=True, exist_ok=True)
        (self.output_dir / '3_良い').mkdir(parents=True, exist_ok=True)
        (self.output_dir / '4_普通').mkdir(parents=True, exist_ok=True)
        (self.output_dir / '5_やや悪い').mkdir(parents=True, exist_ok=True)
        (self.output_dir / '6_悪い').mkdir(parents=True, exist_ok=True)
        (self.output_dir / '7_非常に悪い').mkdir(parents=True, exist_ok=True)

    def get_image_files(self) -> list:
        """対象の画像ファイルを取得"""
        extensions = {'.jpg', '.jpeg', '.png', '.JPG', '.JPEG', '.PNG'}
        files = []
        for ext in extensions:
            files.extend(self.input_dir.rglob(f'*{ext}'))
        return sorted(files)

    def get_processed_files(self) -> set:
        """処理済みファイルのセットを取得"""
        if not self.processed_file.exists():
            return set()

        with open(self.processed_file, 'r', encoding='utf-8') as f:
            return set(line.strip() for line in f)

    def mark_as_processed(self, file_path: str):
        """ファイルを処理済みとしてマーク"""
        with open(self.processed_file, 'a', encoding='utf-8') as f:
            f.write(f'{file_path}\n')

    def get_photo_datetime(self, file_path: Path) -> Optional[datetime]:
        """写真の撮影日時を取得（EXIF優先、なければファイル更新日時）"""
        try:
            with Image.open(file_path) as img:
                exif_data = img._getexif()
                if exif_data:
                    for tag_id, value in exif_data.items():
                        tag = TAGS.get(tag_id, tag_id)
                        if tag == 'DateTimeOriginal' or tag == 'DateTime':
                            try:
                                return datetime.strptime(value, '%Y:%m:%d %H:%M:%S')
                            except ValueError:
                                continue
        except Exception:
            pass

        # EXIFがない場合はファイルの更新日時を使用
        try:
            mtime = os.path.getmtime(file_path)
            return datetime.fromtimestamp(mtime)
        except Exception:
            return datetime.now()

    def generate_output_filename(self, file_path: Path, photo_datetime: datetime) -> str:
        """出力ファイル名を生成（撮影日時_元ファイル名）"""
        datetime_prefix = photo_datetime.strftime('%Y%m%d_%H%M%S')
        return f'{datetime_prefix}_{file_path.name}'

    def evaluate_photo(self, file_path: Path) -> dict:
        """写真を評価してスコアを返す"""
        result = {
            'file_path': str(file_path),
            'filename': file_path.name,
            'photo_datetime': None,
            'has_face': False,
            'sharpness': 0,
            'exposure': 0,
            'contrast': 0,
            'face_score': 0,
            'eyes_open': 0,
            'smile': 0,
            'composition': 0,
            'total_score': 0,
            'category': 'poor'
        }

        try:
            # 画像読み込み
            image = cv2.imread(str(file_path))
            if image is None:
                return result

            # 撮影日時取得
            photo_datetime = self.get_photo_datetime(file_path)
            result['photo_datetime'] = photo_datetime

            # 基本品質評価
            result['sharpness'] = self.evaluator.evaluate_sharpness(image)
            result['exposure'] = self.evaluator.evaluate_exposure(image)
            result['contrast'] = self.evaluator.evaluate_contrast(image)

            # 顔検出（OpenCV使用）
            faces = self.evaluator.detect_faces(image)
            result['has_face'] = len(faces) > 0

            if result['has_face']:
                # 顔あり写真の評価
                result['face_score'] = self.evaluator.evaluate_face_size(image, faces)
                result['eyes_open'] = self.evaluator.evaluate_eyes_open(image, faces)
                result['smile'] = self.evaluator.evaluate_smile(image, faces)
                result['composition'] = self.evaluator.evaluate_face_composition(image, faces)

                # 顔あり写真のスコア計算（100点満点）
                # シャープさ20点、露出5点、顔サイズ5点、目の開閉15点、笑顔25点、構図30点
                result['total_score'] = (
                    result['sharpness'] * 0.20 +
                    result['exposure'] * 0.05 +
                    result['face_score'] * 0.05 +
                    result['eyes_open'] * 0.15 +
                    result['smile'] * 0.25 +
                    result['composition'] * 0.30
                )
            else:
                # 顔なし写真の評価（技術品質のみ）
                result['total_score'] = (
                    result['sharpness'] * 0.40 +
                    result['exposure'] * 0.35 +
                    result['contrast'] * 0.25
                )

            # カテゴリ分類（7段階）
            if result['total_score'] >= self.tier1_threshold:
                result['category'] = '1_最高'
            elif result['total_score'] >= self.tier2_threshold:
                result['category'] = '2_とても良い'
            elif result['total_score'] >= self.tier3_threshold:
                result['category'] = '3_良い'
            elif result['total_score'] >= self.tier4_threshold:
                result['category'] = '4_普通'
            elif result['total_score'] >= self.tier5_threshold:
                result['category'] = '5_やや悪い'
            elif result['total_score'] >= self.tier6_threshold:
                result['category'] = '6_悪い'
            else:
                result['category'] = '7_非常に悪い'

        except Exception as e:
            print(f"警告: {file_path} の評価中にエラー: {e}")

        return result

    def copy_photo(self, file_path: Path, result: dict):
        """写真を適切なフォルダにコピー"""
        category_dir = self.output_dir / result['category']

        if result['photo_datetime']:
            output_filename = self.generate_output_filename(
                file_path, result['photo_datetime']
            )
        else:
            output_filename = file_path.name

        output_path = category_dir / output_filename

        # 同名ファイルが存在する場合は連番を追加
        counter = 1
        while output_path.exists():
            stem = output_path.stem
            suffix = output_path.suffix
            output_path = category_dir / f'{stem}_{counter}{suffix}'
            counter += 1

        shutil.copy2(file_path, output_path)
        result['output_path'] = str(output_path)

    def save_results_csv(self):
        """結果をCSVに保存（撮影日時順・日本語ヘッダー）"""
        if not self.results:
            return

        # 撮影日時でソート
        sorted_results = sorted(
            self.results,
            key=lambda x: x['photo_datetime'] or datetime.min
        )

        csv_path = self.output_dir / 'results.csv'

        # 英語キーと日本語ヘッダーのマッピング
        field_mapping = {
            'filename': 'ファイル名',
            'photo_datetime': '撮影日時',
            'category': '分類',
            'total_score': '総合スコア',
            'has_face': '顔検出',
            'sharpness': 'シャープさ',
            'exposure': '露出',
            'contrast': 'コントラスト',
            'face_score': '顔サイズ',
            'eyes_open': '目の開閉',
            'smile': '笑顔',
            'composition': '構図',
            'file_path': '元ファイルパス',
            'output_path': '出力先パス'
        }

        fieldnames = list(field_mapping.keys())
        japanese_headers = list(field_mapping.values())

        with open(csv_path, 'w', newline='', encoding='utf-8-sig') as f:
            writer = csv.writer(f)
            # 日本語ヘッダーを書き込み
            writer.writerow(japanese_headers)

            for result in sorted_results:
                row = []
                for key in fieldnames:
                    value = result.get(key, '')
                    if key == 'photo_datetime' and value:
                        value = value.strftime('%Y-%m-%d %H:%M:%S')
                    elif key == 'has_face':
                        value = 'あり' if value else 'なし'
                    elif key in ['total_score', 'sharpness', 'exposure', 'contrast',
                                'face_score', 'eyes_open', 'smile', 'composition']:
                        if isinstance(value, float):
                            value = f'{value:.1f}'
                    row.append(value)
                writer.writerow(row)

        print(f"\n結果を保存しました: {csv_path}")

    def run(self):
        """メイン処理を実行"""
        print("=" * 60)
        print("Photo Selector - 写真自動選定ツール")
        print("=" * 60)

        # 出力ディレクトリ作成
        self.setup_output_dirs()

        # 画像ファイル取得
        all_files = self.get_image_files()
        print(f"\n入力フォルダ: {self.input_dir}")
        print(f"見つかった画像: {len(all_files)}枚")

        if not all_files:
            print("処理する画像がありません。")
            return

        # 処理済みファイルを除外
        processed = self.get_processed_files()
        files_to_process = [f for f in all_files if str(f) not in processed]

        if len(processed) > 0:
            print(f"処理済み: {len(processed)}枚（スキップ）")
        print(f"処理対象: {len(files_to_process)}枚")

        if not files_to_process:
            print("すべての画像が処理済みです。")
            return

        # バッチ処理
        if self.batch_size and len(files_to_process) > self.batch_size:
            files_to_process = files_to_process[:self.batch_size]
            print(f"バッチサイズ: {self.batch_size}枚ずつ処理")

        # カウンター（7段階）
        counts = {
            '1_最高': 0, '2_とても良い': 0, '3_良い': 0, '4_普通': 0,
            '5_やや悪い': 0, '6_悪い': 0, '7_非常に悪い': 0
        }

        # 処理開始
        print("\n処理中...")
        for file_path in tqdm(files_to_process, desc="評価中"):
            result = self.evaluate_photo(file_path)
            self.copy_photo(file_path, result)
            self.results.append(result)
            self.mark_as_processed(str(file_path))
            counts[result['category']] += 1

        # 結果サマリー
        print("\n" + "=" * 60)
        print("処理完了")
        print("=" * 60)
        print(f"  1_最高（75点以上）:       {counts['1_最高']}枚")
        print(f"  2_とても良い（65-74点）:  {counts['2_とても良い']}枚")
        print(f"  3_良い（55-64点）:        {counts['3_良い']}枚")
        print(f"  4_普通（45-54点）:        {counts['4_普通']}枚")
        print(f"  5_やや悪い（35-44点）:    {counts['5_やや悪い']}枚")
        print(f"  6_悪い（25-34点）:        {counts['6_悪い']}枚")
        print(f"  7_非常に悪い（25点未満）: {counts['7_非常に悪い']}枚")
        print(f"  合計: {sum(counts.values())}枚")

        # CSV出力
        self.save_results_csv()

        # 出力先表示
        print(f"\n出力先: {self.output_dir}")
        print("  - 1_最高/       : アルバム最優先")
        print("  - 2_とても良い/ : アルバム候補")
        print("  - 3_良い/       : アルバム検討")
        print("  - 4_普通/       : 予備候補")
        print("  - 5_やや悪い/   : 検討対象外")
        print("  - 6_悪い/       : 除外")
        print("  - 7_非常に悪い/ : 除外")


def main():
    parser = argparse.ArgumentParser(
        description='写真を自動評価し、「最高」から「非常に悪い」まで7段階に分類します。'
    )
    parser.add_argument(
        '--input', '-i',
        required=True,
        help='入力フォルダのパス（写真が保存されているフォルダ）'
    )
    parser.add_argument(
        '--output', '-o',
        required=True,
        help='出力フォルダのパス（分類結果を保存するフォルダ）'
    )
    parser.add_argument(
        '--batch-size', '-b',
        type=int,
        default=500,
        help='一度に処理する写真の枚数（デフォルト: 500）'
    )
    args = parser.parse_args()

    # 入力フォルダの存在確認
    if not os.path.isdir(args.input):
        print(f"エラー: 入力フォルダが見つかりません: {args.input}")
        sys.exit(1)

    # セレクター実行（閾値はクラス内で定義済み）
    selector = PhotoSelector(
        input_dir=args.input,
        output_dir=args.output,
        batch_size=args.batch_size
    )
    selector.run()


if __name__ == '__main__':
    main()
