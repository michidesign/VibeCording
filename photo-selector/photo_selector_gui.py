#!/usr/bin/env python3
"""
Photo Selector GUI - 写真自動選定ツール（GUI版）
CustomTkinterを使用したモダンなGUIインターフェース
"""

import os
import threading
from pathlib import Path
from tkinter import filedialog

import customtkinter as ctk

from photo_selector import PhotoSelector, PhotoEvaluator


class PhotoSelectorGUI(ctk.CTk):
    """写真自動選定ツールのGUIクラス"""

    def __init__(self):
        super().__init__()

        # ウィンドウ設定
        self.title("Photo Selector - 写真自動選定ツール")
        self.geometry("700x600")
        self.minsize(600, 500)

        # テーマ設定（ダークモード）
        ctk.set_appearance_mode("dark")
        ctk.set_default_color_theme("blue")

        # 変数
        self.input_path = ctk.StringVar()
        self.output_path = ctk.StringVar()
        self.batch_size = ctk.IntVar(value=500)
        self.is_running = False

        # UI構築
        self._create_widgets()

    def _create_widgets(self):
        """UIウィジェットを作成"""
        # メインフレーム
        main_frame = ctk.CTkFrame(self)
        main_frame.pack(fill="both", expand=True, padx=20, pady=20)

        # タイトル
        title_label = ctk.CTkLabel(
            main_frame,
            text="Photo Selector",
            font=ctk.CTkFont(size=28, weight="bold")
        )
        title_label.pack(pady=(0, 5))

        subtitle_label = ctk.CTkLabel(
            main_frame,
            text="写真を自動評価し、7段階に分類します",
            font=ctk.CTkFont(size=14),
            text_color="gray"
        )
        subtitle_label.pack(pady=(0, 20))

        # 入力フォルダ選択
        input_frame = ctk.CTkFrame(main_frame, fg_color="transparent")
        input_frame.pack(fill="x", pady=10)

        ctk.CTkLabel(
            input_frame,
            text="入力フォルダ",
            font=ctk.CTkFont(size=14, weight="bold")
        ).pack(anchor="w")

        input_entry_frame = ctk.CTkFrame(input_frame, fg_color="transparent")
        input_entry_frame.pack(fill="x", pady=(5, 0))

        self.input_entry = ctk.CTkEntry(
            input_entry_frame,
            textvariable=self.input_path,
            placeholder_text="写真が保存されているフォルダを選択...",
            height=40
        )
        self.input_entry.pack(side="left", fill="x", expand=True, padx=(0, 10))

        ctk.CTkButton(
            input_entry_frame,
            text="選択",
            width=80,
            height=40,
            command=self._select_input_folder
        ).pack(side="right")

        # 出力フォルダ選択
        output_frame = ctk.CTkFrame(main_frame, fg_color="transparent")
        output_frame.pack(fill="x", pady=10)

        ctk.CTkLabel(
            output_frame,
            text="出力フォルダ",
            font=ctk.CTkFont(size=14, weight="bold")
        ).pack(anchor="w")

        output_entry_frame = ctk.CTkFrame(output_frame, fg_color="transparent")
        output_entry_frame.pack(fill="x", pady=(5, 0))

        self.output_entry = ctk.CTkEntry(
            output_entry_frame,
            textvariable=self.output_path,
            placeholder_text="分類結果を保存するフォルダを選択...",
            height=40
        )
        self.output_entry.pack(side="left", fill="x", expand=True, padx=(0, 10))

        ctk.CTkButton(
            output_entry_frame,
            text="選択",
            width=80,
            height=40,
            command=self._select_output_folder
        ).pack(side="right")

        # バッチサイズ設定
        batch_frame = ctk.CTkFrame(main_frame, fg_color="transparent")
        batch_frame.pack(fill="x", pady=10)

        batch_label_frame = ctk.CTkFrame(batch_frame, fg_color="transparent")
        batch_label_frame.pack(fill="x")

        ctk.CTkLabel(
            batch_label_frame,
            text="バッチサイズ",
            font=ctk.CTkFont(size=14, weight="bold")
        ).pack(side="left")

        self.batch_value_label = ctk.CTkLabel(
            batch_label_frame,
            text="500枚",
            font=ctk.CTkFont(size=14),
            text_color="gray"
        )
        self.batch_value_label.pack(side="right")

        self.batch_slider = ctk.CTkSlider(
            batch_frame,
            from_=100,
            to=2000,
            number_of_steps=19,
            variable=self.batch_size,
            command=self._on_batch_change,
            height=20
        )
        self.batch_slider.pack(fill="x", pady=(5, 0))

        # プログレスバー
        progress_frame = ctk.CTkFrame(main_frame, fg_color="transparent")
        progress_frame.pack(fill="x", pady=20)

        self.progress_bar = ctk.CTkProgressBar(progress_frame, height=15)
        self.progress_bar.pack(fill="x")
        self.progress_bar.set(0)

        self.progress_label = ctk.CTkLabel(
            progress_frame,
            text="待機中",
            font=ctk.CTkFont(size=12),
            text_color="gray"
        )
        self.progress_label.pack(pady=(5, 0))

        # 実行ボタン
        self.run_button = ctk.CTkButton(
            main_frame,
            text="実行",
            font=ctk.CTkFont(size=16, weight="bold"),
            height=50,
            command=self._run_selector
        )
        self.run_button.pack(fill="x", pady=10)

        # ログエリア
        log_frame = ctk.CTkFrame(main_frame)
        log_frame.pack(fill="both", expand=True, pady=(10, 0))

        ctk.CTkLabel(
            log_frame,
            text="処理ログ",
            font=ctk.CTkFont(size=12, weight="bold")
        ).pack(anchor="w", padx=10, pady=(10, 5))

        self.log_text = ctk.CTkTextbox(
            log_frame,
            font=ctk.CTkFont(size=12),
            state="disabled"
        )
        self.log_text.pack(fill="both", expand=True, padx=10, pady=(0, 10))

    def _select_input_folder(self):
        """入力フォルダを選択"""
        folder = filedialog.askdirectory(title="入力フォルダを選択")
        if folder:
            self.input_path.set(folder)

    def _select_output_folder(self):
        """出力フォルダを選択"""
        folder = filedialog.askdirectory(title="出力フォルダを選択")
        if folder:
            self.output_path.set(folder)

    def _on_batch_change(self, value):
        """バッチサイズ変更時のコールバック"""
        self.batch_value_label.configure(text=f"{int(value)}枚")

    def _log(self, message: str):
        """ログを追加"""
        self.log_text.configure(state="normal")
        self.log_text.insert("end", message + "\n")
        self.log_text.see("end")
        self.log_text.configure(state="disabled")

    def _clear_log(self):
        """ログをクリア"""
        self.log_text.configure(state="normal")
        self.log_text.delete("1.0", "end")
        self.log_text.configure(state="disabled")

    def _update_progress(self, current: int, total: int, message: str = ""):
        """プログレスバーを更新"""
        progress = current / total if total > 0 else 0
        self.progress_bar.set(progress)
        if message:
            self.progress_label.configure(text=message)
        else:
            self.progress_label.configure(text=f"{current}/{total}枚 処理完了")

    def _run_selector(self):
        """写真選定を実行"""
        if self.is_running:
            return

        # 入力チェック
        input_dir = self.input_path.get().strip()
        output_dir = self.output_path.get().strip()

        if not input_dir:
            self._log("エラー: 入力フォルダを選択してください")
            return

        if not output_dir:
            self._log("エラー: 出力フォルダを選択してください")
            return

        if not os.path.isdir(input_dir):
            self._log(f"エラー: 入力フォルダが見つかりません: {input_dir}")
            return

        # 処理開始
        self.is_running = True
        self.run_button.configure(state="disabled", text="処理中...")
        self._clear_log()

        # バックグラウンドで実行
        thread = threading.Thread(
            target=self._process_photos,
            args=(input_dir, output_dir, self.batch_size.get()),
            daemon=True
        )
        thread.start()

    def _process_photos(self, input_dir: str, output_dir: str, batch_size: int):
        """写真を処理（バックグラウンドスレッド）"""
        try:
            self._log("=" * 50)
            self._log("Photo Selector - 写真自動選定ツール")
            self._log("=" * 50)

            # セレクター初期化
            selector = PhotoSelector(
                input_dir=input_dir,
                output_dir=output_dir,
                batch_size=batch_size
            )

            # 出力ディレクトリ作成
            selector.setup_output_dirs()

            # 画像ファイル取得
            all_files = selector.get_image_files()
            self._log(f"\n入力フォルダ: {input_dir}")
            self._log(f"見つかった画像: {len(all_files)}枚")

            if not all_files:
                self._log("処理する画像がありません。")
                self._finish_processing()
                return

            # 処理済みファイルを除外
            processed = selector.get_processed_files()
            files_to_process = [f for f in all_files if str(f) not in processed]

            if len(processed) > 0:
                self._log(f"処理済み: {len(processed)}枚（スキップ）")
            self._log(f"処理対象: {len(files_to_process)}枚")

            if not files_to_process:
                self._log("すべての画像が処理済みです。")
                self._finish_processing()
                return

            # バッチ処理
            if batch_size and len(files_to_process) > batch_size:
                files_to_process = files_to_process[:batch_size]
                self._log(f"バッチサイズ: {batch_size}枚ずつ処理")

            # カウンター
            counts = {
                '1_最高': 0, '2_とても良い': 0, '3_良い': 0, '4_普通': 0,
                '5_やや悪い': 0, '6_悪い': 0, '7_非常に悪い': 0
            }

            total = len(files_to_process)
            self._log("\n処理中...")
            self.after(0, lambda: self._update_progress(0, total, "処理開始..."))

            # 処理実行
            for i, file_path in enumerate(files_to_process):
                result = selector.evaluate_photo(file_path)
                selector.copy_photo(file_path, result)
                selector.results.append(result)
                selector.mark_as_processed(str(file_path))
                counts[result['category']] += 1

                # プログレス更新（UIスレッドで実行）
                current = i + 1
                self.after(0, lambda c=current, t=total: self._update_progress(c, t))

            # 結果サマリー
            self._log("\n" + "=" * 50)
            self._log("処理完了")
            self._log("=" * 50)
            self._log(f"  1_最高（75点以上）:       {counts['1_最高']}枚")
            self._log(f"  2_とても良い（65-74点）:  {counts['2_とても良い']}枚")
            self._log(f"  3_良い（55-64点）:        {counts['3_良い']}枚")
            self._log(f"  4_普通（45-54点）:        {counts['4_普通']}枚")
            self._log(f"  5_やや悪い（35-44点）:    {counts['5_やや悪い']}枚")
            self._log(f"  6_悪い（25-34点）:        {counts['6_悪い']}枚")
            self._log(f"  7_非常に悪い（25点未満）: {counts['7_非常に悪い']}枚")
            self._log(f"  合計: {sum(counts.values())}枚")

            # CSV出力
            selector.save_results_csv()
            self._log(f"\n結果を保存しました: {selector.output_dir / 'results.csv'}")

            # 出力先表示
            self._log(f"\n出力先: {output_dir}")

            self.after(0, lambda: self._update_progress(total, total, "完了"))

        except Exception as e:
            self._log(f"\nエラーが発生しました: {e}")

        finally:
            self._finish_processing()

    def _finish_processing(self):
        """処理完了時の後処理"""
        self.is_running = False
        self.after(0, lambda: self.run_button.configure(state="normal", text="実行"))


def main():
    """メイン関数"""
    app = PhotoSelectorGUI()
    app.mainloop()


if __name__ == '__main__':
    main()
