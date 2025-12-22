#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PhotoSorter AI - Gemini APIを使用した写真自動選別アプリ
REST API版（grpcio非依存・macOS完全互換）
"""

import os
import sys
import json
import time
import shutil
import threading
import base64
import urllib.request
import urllib.error
from pathlib import Path
from datetime import datetime
from typing import Optional

import tkinter as tk
from tkinter import ttk, filedialog, messagebox, scrolledtext
from PIL import Image
import piexif
import io

# ============================================================
# 定数定義
# ============================================================
MODELS = [
    "gemini-2.5-flash",
    "gemini-2.0-flash",
    "gemini-2.5-pro",
]

SUPPORTED_EXTENSIONS = {'.jpg', '.jpeg', '.png', '.webp', '.heic', '.heif'}

SYSTEM_INSTRUCTION = """
あなたは家族写真の選定を行うプロの編集者です。

【被写体】
子どもがメインの被写体です。

【評価基準】
- Best (85-100): 完全にピントが合っており、表情が生き生きしている。「奇跡の1枚」。
- Good (60-84): 良い写真。アルバムのサブ候補。
- Skip (0-59): ピンボケ、目つぶり、まったく同じ構図の連写（ベスト以外）、後ろ姿のみなど。

【出力形式】
以下のJSON形式のみを返してください（Markdown等の装飾は不要）:
{"filename": "ファイル名", "score": スコア, "category": "カテゴリ", "reason": "理由"}
"""

# ============================================================
# スタイル設定
# ============================================================
COLORS = {
    'bg': '#0f0f23',
    'fg': '#ffffff',
    'fg_dark': '#1a1a2e',
    'accent': '#4fc3f7',
    'accent_dark': '#0288d1',
    'success': '#66bb6a',
    'success_dark': '#388e3c',
    'warning': '#ffca28',
    'warning_dark': '#f57f17',
    'danger': '#ef5350',
    'secondary': '#78909c',
    'secondary_dark': '#546e7a',
    'card': '#1a1a3e',
    'card_border': '#2d2d5a',
    'entry': '#252550',
    'button_text': '#ffffff'
}

# ============================================================
# Gemini REST API クラス
# ============================================================
class GeminiAPI:
    """REST APIを使用したGemini呼び出し（grpcio不要）"""
    
    BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models"
    
    def __init__(self, api_key: str, model: str):
        self.api_key = api_key
        self.model = model
        
    def generate_content(self, prompt: str, image_path: Optional[Path] = None) -> str:
        """コンテンツ生成（画像対応）"""
        url = f"{self.BASE_URL}/{self.model}:generateContent?key={self.api_key}"
        
        # リクエストボディ構築
        parts = []
        
        # システム指示をプロンプトに含める
        full_prompt = f"{SYSTEM_INSTRUCTION}\n\n{prompt}"
        parts.append({"text": full_prompt})
        
        # 画像がある場合は追加
        if image_path:
            image_data = self._encode_image(image_path)
            if image_data:
                mime_type = self._get_mime_type(image_path)
                parts.append({
                    "inline_data": {
                        "mime_type": mime_type,
                        "data": image_data
                    }
                })
        
        request_body = {
            "contents": [{"parts": parts}],
            "generationConfig": {
                "temperature": 0.4,
                "maxOutputTokens": 1024
            }
        }
        
        # リクエスト送信
        data = json.dumps(request_body).encode('utf-8')
        req = urllib.request.Request(
            url,
            data=data,
            headers={'Content-Type': 'application/json'},
            method='POST'
        )
        
        try:
            with urllib.request.urlopen(req, timeout=60) as response:
                result = json.loads(response.read().decode('utf-8'))
                
            # レスポンスからテキスト抽出
            if 'candidates' in result and result['candidates']:
                candidate = result['candidates'][0]
                if 'content' in candidate and 'parts' in candidate['content']:
                    parts = candidate['content']['parts']
                    if parts and 'text' in parts[0]:
                        return parts[0]['text']
            
            return ""
            
        except urllib.error.HTTPError as e:
            if e.code == 429:
                raise RateLimitError("Rate limit exceeded")
            elif e.code == 400:
                raise InvalidRequestError(f"Invalid request: {e.read().decode()}")
            else:
                raise APIError(f"HTTP {e.code}: {e.reason}")
        except urllib.error.URLError as e:
            raise APIError(f"Connection error: {str(e)}")
            
    def _encode_image(self, image_path: Path) -> Optional[str]:
        """画像をBase64エンコード"""
        try:
            with Image.open(image_path) as img:
                # HEIC/HEIFはJPEGに変換
                if image_path.suffix.lower() in ['.heic', '.heif']:
                    buffer = io.BytesIO()
                    img.convert('RGB').save(buffer, format='JPEG', quality=85)
                    return base64.b64encode(buffer.getvalue()).decode('utf-8')
                else:
                    # リサイズ（大きすぎる場合）
                    max_size = 4096
                    if max(img.size) > max_size:
                        ratio = max_size / max(img.size)
                        new_size = (int(img.size[0] * ratio), int(img.size[1] * ratio))
                        img = img.resize(new_size, Image.Resampling.LANCZOS)
                    
                    buffer = io.BytesIO()
                    fmt = 'JPEG' if image_path.suffix.lower() in ['.jpg', '.jpeg'] else 'PNG'
                    if img.mode in ('RGBA', 'LA', 'P'):
                        img = img.convert('RGB')
                    img.save(buffer, format=fmt, quality=85)
                    return base64.b64encode(buffer.getvalue()).decode('utf-8')
        except Exception as e:
            print(f"Image encoding error: {e}")
            return None
            
    def _get_mime_type(self, image_path: Path) -> str:
        """画像のMIMEタイプを取得"""
        suffix = image_path.suffix.lower()
        mime_types = {
            '.jpg': 'image/jpeg',
            '.jpeg': 'image/jpeg',
            '.png': 'image/png',
            '.webp': 'image/webp',
            '.heic': 'image/jpeg',  # 変換後
            '.heif': 'image/jpeg',  # 変換後
        }
        return mime_types.get(suffix, 'image/jpeg')
        
    def test_connection(self) -> bool:
        """接続テスト"""
        try:
            self.generate_content("Hello, respond with 'OK'")
            return True
        except Exception:
            return False


# カスタム例外
class RateLimitError(Exception):
    pass

class InvalidRequestError(Exception):
    pass

class APIError(Exception):
    pass


# ============================================================
# PhotoSorterApp クラス
# ============================================================
class PhotoSorterApp:
    def __init__(self, root):
        self.root = root
        self.root.title("📷 PhotoSorter AI")
        self.root.geometry("850x750")
        self.root.minsize(750, 650)
        self.root.configure(bg=COLORS['bg'])
        
        # 状態変数
        self.is_running = False
        self.is_paused = False
        self.processing_thread: Optional[threading.Thread] = None
        self.api: Optional[GeminiAPI] = None
        self.current_image_index = 0
        self.total_images = 0
        self.image_files = []
        
        # tkinter変数
        self.api_key_var = tk.StringVar()
        self.model_var = tk.StringVar(value=MODELS[0])
        self.input_folder_var = tk.StringVar()
        self.output_folder_var = tk.StringVar()
        self.interval_var = tk.IntVar(value=15)
        self.status_var = tk.StringVar(value="待機中...")
        self.progress_var = tk.DoubleVar(value=0)
        self.progress_text_var = tk.StringVar(value="0/0枚")
        
        # スタイル設定
        self._setup_styles()
        
        # UI構築
        self._build_ui()
        
    def _setup_styles(self):
        """ttkスタイル設定"""
        style = ttk.Style()
        style.theme_use('clam')
        
        style.configure('Dark.TFrame', background=COLORS['bg'])
        style.configure('Card.TFrame', background=COLORS['card'])
        style.configure('Dark.TLabel', 
                       background=COLORS['bg'], 
                       foreground=COLORS['fg'],
                       font=('Helvetica', 12))
        style.configure('Card.TLabel', 
                       background=COLORS['card'], 
                       foreground=COLORS['fg'],
                       font=('Helvetica', 12))
        style.configure('Status.TLabel',
                       background=COLORS['bg'],
                       foreground=COLORS['accent'],
                       font=('Helvetica', 18, 'bold'))
        style.configure('Header.TLabel',
                       background=COLORS['bg'],
                       foreground=COLORS['accent'],
                       font=('Helvetica', 24, 'bold'))
        style.configure('Accent.Horizontal.TProgressbar',
                       background=COLORS['accent'],
                       troughcolor=COLORS['card'])
        
    def _build_ui(self):
        """UIコンポーネントを構築"""
        main_frame = ttk.Frame(self.root, style='Dark.TFrame')
        main_frame.pack(fill='both', expand=True, padx=20, pady=20)
        
        header = ttk.Label(main_frame, text="📷 PhotoSorter AI", style='Header.TLabel')
        header.pack(pady=(0, 20))
        
        self._build_api_section(main_frame)
        self._build_folder_section(main_frame)
        self._build_settings_section(main_frame)
        self._build_progress_section(main_frame)
        self._build_log_section(main_frame)
        self._build_control_section(main_frame)
        
    def _build_api_section(self, parent):
        """API設定セクション"""
        frame = tk.Frame(parent, bg=COLORS['card'], highlightbackground=COLORS['card_border'],
                        highlightthickness=1)
        frame.pack(fill='x', pady=10, ipady=12)
        
        inner = tk.Frame(frame, bg=COLORS['card'])
        inner.pack(fill='x', padx=20, pady=8)
        
        # APIキー行
        row1 = tk.Frame(inner, bg=COLORS['card'])
        row1.pack(fill='x', pady=8)
        
        tk.Label(row1, text="🔑 APIキー:", bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13)).pack(side='left')
        
        api_entry = tk.Entry(row1, textvariable=self.api_key_var, show="•", 
                            width=35, bg=COLORS['entry'], fg=COLORS['fg'],
                            insertbackground=COLORS['fg'], font=('Helvetica', 13),
                            relief='flat', highlightbackground=COLORS['accent'],
                            highlightthickness=1)
        api_entry.pack(side='left', padx=15, ipady=6)
        
        verify_btn = tk.Button(row1, text="✓ 検証", command=self._verify_api_key,
                              bg=COLORS['accent'], fg=COLORS['button_text'],
                              activebackground=COLORS['accent_dark'],
                              activeforeground=COLORS['button_text'],
                              font=('Helvetica', 12, 'bold'),
                              padx=20, pady=6, cursor='hand2', relief='flat',
                              highlightthickness=0)
        verify_btn.pack(side='left', padx=5)
        
        # モデル行
        row2 = tk.Frame(inner, bg=COLORS['card'])
        row2.pack(fill='x', pady=8)
        
        tk.Label(row2, text="🤖 モデル:", bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13)).pack(side='left')
        
        model_menu = ttk.OptionMenu(row2, self.model_var, MODELS[0], *MODELS)
        model_menu.pack(side='left', padx=15)
        
    def _build_folder_section(self, parent):
        """フォルダ設定セクション"""
        frame = tk.Frame(parent, bg=COLORS['card'], highlightbackground=COLORS['card_border'],
                        highlightthickness=1)
        frame.pack(fill='x', pady=10, ipady=12)
        
        inner = tk.Frame(frame, bg=COLORS['card'])
        inner.pack(fill='x', padx=20, pady=8)
        
        # 入力フォルダ
        row1 = tk.Frame(inner, bg=COLORS['card'])
        row1.pack(fill='x', pady=8)
        
        tk.Label(row1, text="📁 入力フォルダ:", width=14, bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13), anchor='w').pack(side='left')
        
        input_entry = tk.Entry(row1, textvariable=self.input_folder_var,
                              bg=COLORS['entry'], fg=COLORS['fg'],
                              insertbackground=COLORS['fg'], font=('Helvetica', 12),
                              relief='flat', highlightbackground=COLORS['accent'],
                              highlightthickness=1)
        input_entry.pack(side='left', fill='x', expand=True, padx=10, ipady=5)
        
        tk.Button(row1, text="📂 選択", command=self._select_input_folder,
                 bg=COLORS['secondary'], fg=COLORS['button_text'],
                 activebackground=COLORS['secondary_dark'],
                 activeforeground=COLORS['button_text'],
                 font=('Helvetica', 11, 'bold'),
                 padx=12, pady=4, cursor='hand2', relief='flat').pack(side='left')
        
        # 出力フォルダ
        row2 = tk.Frame(inner, bg=COLORS['card'])
        row2.pack(fill='x', pady=8)
        
        tk.Label(row2, text="📁 出力フォルダ:", width=14, bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13), anchor='w').pack(side='left')
        
        output_entry = tk.Entry(row2, textvariable=self.output_folder_var,
                               bg=COLORS['entry'], fg=COLORS['fg'],
                               insertbackground=COLORS['fg'], font=('Helvetica', 12),
                               relief='flat', highlightbackground=COLORS['accent'],
                               highlightthickness=1)
        output_entry.pack(side='left', fill='x', expand=True, padx=10, ipady=5)
        
        tk.Button(row2, text="📂 選択", command=self._select_output_folder,
                 bg=COLORS['secondary'], fg=COLORS['button_text'],
                 activebackground=COLORS['secondary_dark'],
                 activeforeground=COLORS['button_text'],
                 font=('Helvetica', 11, 'bold'),
                 padx=12, pady=4, cursor='hand2', relief='flat').pack(side='left')
        
    def _build_settings_section(self, parent):
        """設定セクション"""
        frame = tk.Frame(parent, bg=COLORS['card'], highlightbackground=COLORS['card_border'],
                        highlightthickness=1)
        frame.pack(fill='x', pady=10, ipady=12)
        
        inner = tk.Frame(frame, bg=COLORS['card'])
        inner.pack(fill='x', padx=20, pady=8)
        
        tk.Label(inner, text="⏱️ 処理間隔:", bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13)).pack(side='left')
        
        self.interval_slider = ttk.Scale(inner, from_=2, to=30, 
                                         variable=self.interval_var,
                                         orient='horizontal', length=250,
                                         command=self._update_interval_label)
        self.interval_slider.pack(side='left', padx=15)
        
        self.interval_label = tk.Label(inner, text="10秒", bg=COLORS['card'], fg=COLORS['accent'],
                                       font=('Helvetica', 14, 'bold'), width=6)
        self.interval_label.pack(side='left')
        
    def _build_progress_section(self, parent):
        """進捗・ステータスセクション"""
        frame = tk.Frame(parent, bg=COLORS['card'], highlightbackground=COLORS['card_border'],
                        highlightthickness=1)
        frame.pack(fill='x', pady=10, ipady=15)
        
        inner = tk.Frame(frame, bg=COLORS['card'])
        inner.pack(fill='x', padx=20, pady=8)
        
        progress_row = tk.Frame(inner, bg=COLORS['card'])
        progress_row.pack(fill='x', pady=8)
        
        self.progress_bar = ttk.Progressbar(progress_row, 
                                           variable=self.progress_var,
                                           maximum=100,
                                           style='Accent.Horizontal.TProgressbar')
        self.progress_bar.pack(side='left', fill='x', expand=True)
        
        tk.Label(progress_row, textvariable=self.progress_text_var, 
                bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13, 'bold'), width=10).pack(side='left', padx=15)
        
        status_label = tk.Label(inner, textvariable=self.status_var, 
                               bg=COLORS['card'], fg=COLORS['accent'],
                               font=('Helvetica', 20, 'bold'))
        status_label.pack(pady=15)
        
    def _build_log_section(self, parent):
        """ログウィンドウセクション"""
        frame = tk.Frame(parent, bg=COLORS['card'], highlightbackground=COLORS['card_border'],
                        highlightthickness=1)
        frame.pack(fill='both', expand=True, pady=10)
        
        tk.Label(frame, text="📋 処理ログ:", bg=COLORS['card'], fg=COLORS['fg'],
                font=('Helvetica', 13)).pack(anchor='w', padx=15, pady=8)
        
        self.log_text = scrolledtext.ScrolledText(frame, height=8,
                                                  bg=COLORS['entry'], 
                                                  fg='#b0b0b0',
                                                  font=('Menlo', 11),
                                                  insertbackground=COLORS['fg'],
                                                  relief='flat',
                                                  highlightbackground=COLORS['card_border'],
                                                  highlightthickness=1)
        self.log_text.pack(fill='both', expand=True, padx=15, pady=(0, 12))
        
    def _build_control_section(self, parent):
        """コントロールボタンセクション"""
        frame = tk.Frame(parent, bg=COLORS['bg'])
        frame.pack(fill='x', pady=15)
        
        self.start_btn = tk.Button(frame, text="▶ 開始", 
                                   command=self._start_processing,
                                   bg=COLORS['success'], fg=COLORS['button_text'],
                                   activebackground=COLORS['success_dark'],
                                   activeforeground=COLORS['button_text'],
                                   font=('Helvetica', 15, 'bold'),
                                   padx=35, pady=12, cursor='hand2',
                                   relief='flat', highlightthickness=0)
        self.start_btn.pack(side='left', expand=True, padx=10)
        
        self.pause_btn = tk.Button(frame, text="⏸ 一時停止",
                                   command=self._toggle_pause,
                                   bg=COLORS['warning'], fg=COLORS['fg_dark'],
                                   activebackground=COLORS['warning_dark'],
                                   activeforeground=COLORS['fg_dark'],
                                   font=('Helvetica', 15, 'bold'),
                                   padx=35, pady=12, cursor='hand2',
                                   state='disabled', relief='flat', highlightthickness=0)
        self.pause_btn.pack(side='left', expand=True, padx=10)
        
        self.reset_btn = tk.Button(frame, text="↻ リセット",
                                   command=self._reset_processing,
                                   bg=COLORS['secondary'], fg=COLORS['button_text'],
                                   activebackground=COLORS['secondary_dark'],
                                   activeforeground=COLORS['button_text'],
                                   font=('Helvetica', 15, 'bold'),
                                   padx=35, pady=12, cursor='hand2',
                                   relief='flat', highlightthickness=0)
        self.reset_btn.pack(side='left', expand=True, padx=10)
        
    # ============================================================
    # イベントハンドラ
    # ============================================================
    def _update_interval_label(self, value):
        self.interval_label.config(text=f"{int(float(value))}秒")
        
    def _select_input_folder(self):
        folder = filedialog.askdirectory(title="入力フォルダを選択")
        if folder:
            self.input_folder_var.set(folder)
            self._log(f"📁 入力フォルダ: {folder}")
            
    def _select_output_folder(self):
        folder = filedialog.askdirectory(title="出力フォルダを選択")
        if folder:
            self.output_folder_var.set(folder)
            self._log(f"📁 出力フォルダ: {folder}")
            
    def _verify_api_key(self):
        api_key = self.api_key_var.get().strip()
        if not api_key:
            messagebox.showerror("エラー", "APIキーを入力してください")
            return
            
        try:
            model_name = self.model_var.get()
            self.api = GeminiAPI(api_key, model_name)
            
            # テスト
            response = self.api.generate_content("Say hello")
            
            if response:
                messagebox.showinfo("成功", f"✅ APIキー検証成功！\nモデル: {model_name}")
                self._log(f"✅ APIキー検証成功 (モデル: {model_name})")
            else:
                raise Exception("Empty response")
                
        except Exception as e:
            messagebox.showerror("エラー", f"APIキー検証失敗:\n{str(e)}")
            self._log(f"❌ APIキー検証失敗: {str(e)}")
            
    def _start_processing(self):
        if not self._validate_inputs():
            return
            
        input_folder = Path(self.input_folder_var.get())
        self.image_files = [
            f for f in input_folder.iterdir()
            if f.is_file() and f.suffix.lower() in SUPPORTED_EXTENSIONS
        ]
        
        if not self.image_files:
            messagebox.showerror("エラー", "対象の画像ファイルが見つかりません")
            return
            
        self.total_images = len(self.image_files)
        self.current_image_index = 0
        
        output_folder = Path(self.output_folder_var.get())
        for category in ["Best", "Good", "Skip"]:
            (output_folder / category).mkdir(parents=True, exist_ok=True)
            
        self.is_running = True
        self.is_paused = False
        self.start_btn.configure(state='disabled')
        self.pause_btn.configure(state='normal')
        
        self._log(f"🚀 処理開始: {self.total_images}枚の画像を処理します")
        
        self.processing_thread = threading.Thread(target=self._process_images, daemon=True)
        self.processing_thread.start()
        
    def _toggle_pause(self):
        if self.is_paused:
            self.is_paused = False
            self.pause_btn.configure(text="⏸️ 一時停止")
            self._log("▶️ 処理再開")
        else:
            self.is_paused = True
            self.pause_btn.configure(text="▶️ 再開")
            self._log("⏸️ 一時停止中...")
            
    def _reset_processing(self):
        self.is_running = False
        self.is_paused = False
        self.current_image_index = 0
        self.total_images = 0
        
        self.start_btn.configure(state='normal')
        self.pause_btn.configure(state='disabled', text="⏸️ 一時停止")
        
        self.progress_var.set(0)
        self.progress_text_var.set("0/0枚")
        self.status_var.set("待機中...")
        
        self._log("🔄 リセット完了")
        
    def _validate_inputs(self) -> bool:
        if not self.api_key_var.get().strip():
            messagebox.showerror("エラー", "APIキーを入力してください")
            return False
            
        if not self.input_folder_var.get():
            messagebox.showerror("エラー", "入力フォルダを選択してください")
            return False
            
        if not self.output_folder_var.get():
            messagebox.showerror("エラー", "出力フォルダを選択してください")
            return False
            
        if not self.api:
            api_key = self.api_key_var.get().strip()
            self.api = GeminiAPI(api_key, self.model_var.get())
                
        return True
        
    # ============================================================
    # 処理ロジック（別スレッド）
    # ============================================================
    def _process_images(self):
        output_folder = Path(self.output_folder_var.get())
        interval = self.interval_var.get()
        
        for idx, image_path in enumerate(self.image_files):
            if not self.is_running:
                break
                
            while self.is_paused and self.is_running:
                self._update_status("⏸️ 一時停止中...")
                time.sleep(0.5)
                
            if not self.is_running:
                break
                
            self.current_image_index = idx + 1
            self._update_progress()
            self._update_status(f"📷 {self.current_image_index}枚目をAIが解析中...")
            
            result = self._analyze_image_with_retry(image_path)
            
            if result:
                self._move_image(image_path, output_folder, result)
                
                category = result.get("category", "Skip")
                score = result.get("score", 0)
                reason = result.get("reason", "")
                
                emoji = {"Best": "⭐", "Good": "✅", "Skip": "⚠️"}.get(category, "❓")
                self._log(f"{emoji} {image_path.name} → {category} ({score}点) - {reason}")
            else:
                self._move_image(image_path, output_folder, {"category": "Skip"})
                self._log(f"❓ {image_path.name} → Skip (解析失敗)")
                
            if idx < len(self.image_files) - 1:
                self._wait_with_countdown(interval, "⏳ API制限調整のため待機中")
                
        self._update_status("✅ 処理完了！")
        self._log(f"🎉 処理完了: {self.total_images}枚の画像を分類しました")
        self.root.after(0, self._on_processing_complete)
        
    def _analyze_image_with_retry(self, image_path: Path) -> Optional[dict]:
        max_retries = 3
        
        for attempt in range(max_retries):
            try:
                return self._analyze_image(image_path)
                
            except RateLimitError:
                wait_time = 60 * (2 ** attempt)
                self._log(f"⚠️ レート制限検知 (429)。{wait_time}秒待機します...")
                self._wait_with_countdown(wait_time, "⚠️ Google側の混雑検知(429)。クールダウン中")
                
            except InvalidRequestError as e:
                error_msg = str(e)
                # APIキーエラーの検出
                if "API_KEY_INVALID" in error_msg or "API key not valid" in error_msg:
                    self._log(f"🔑 APIキーエラー: APIキーが無効です。正しいキーを入力してください。")
                    self._update_status("❌ APIキーが無効です")
                    self.root.after(0, lambda: messagebox.showerror("APIキーエラー", 
                        "APIキーが無効です。\n\n1. Google AI Studioで新しいキーを取得してください\n2. アプリを再起動してキーを再入力してください"))
                    self.is_running = False
                    return None
                else:
                    self._log(f"❌ リクエストエラー: {image_path.name} - {error_msg[:100]}...")
                    return None
                
            except Exception as e:
                self._log(f"❌ API呼び出しエラー: {str(e)}")
                if attempt < max_retries - 1:
                    wait_time = 30 * (attempt + 1)
                    self._wait_with_countdown(wait_time, "🔄 リトライ待機中")
                else:
                    return None
                    
        return None
        
    def _analyze_image(self, image_path: Path) -> Optional[dict]:
        prompt = f"この写真を評価してください。ファイル名: {image_path.name}\nJSON形式で回答してください。"
        
        response = self.api.generate_content(prompt, image_path)
        text = response.strip()
        
        # JSONを抽出
        if text.startswith("```"):
            lines = text.split("\n")
            json_lines = []
            in_json = False
            for line in lines:
                if line.startswith("```json") or line.startswith("```"):
                    in_json = not in_json
                    continue
                if in_json:
                    json_lines.append(line)
            text = "\n".join(json_lines)
            
        try:
            result = json.loads(text)
            return result
        except json.JSONDecodeError:
            self._log(f"⚠️ JSON解析失敗: {text[:100]}...")
            return None
            
    def _wait_with_countdown(self, seconds: int, reason: str):
        for remaining in range(seconds, 0, -1):
            if not self.is_running:
                return
            if self.is_paused:
                self._update_status("⏸️ 一時停止中...")
                while self.is_paused and self.is_running:
                    time.sleep(0.5)
                if not self.is_running:
                    return
                    
            self._update_status(f"{reason}: 残り {remaining} 秒...")
            time.sleep(1)
            
    def _move_image(self, src_path: Path, output_folder: Path, result: dict):
        category = result.get("category", "Skip")
        if category not in ["Best", "Good", "Skip"]:
            category = "Skip"
            
        dst_folder = output_folder / category
        dst_path = dst_folder / src_path.name
        
        counter = 1
        while dst_path.exists():
            stem = src_path.stem
            suffix = src_path.suffix
            dst_path = dst_folder / f"{stem}_{counter}{suffix}"
            counter += 1
            
        try:
            self._copy_with_exif(src_path, dst_path)
        except Exception:
            shutil.copy2(src_path, dst_path)
            
    def _copy_with_exif(self, src: Path, dst: Path):
        try:
            img = Image.open(src)
            exif_bytes = img.info.get('exif', b'')
            
            if exif_bytes:
                img.save(dst, exif=exif_bytes)
            else:
                shutil.copy2(src, dst)
        except Exception:
            shutil.copy2(src, dst)
            
    def _on_processing_complete(self):
        self.is_running = False
        self.start_btn.configure(state='normal')
        self.pause_btn.configure(state='disabled')
        
    # ============================================================
    # ユーティリティ
    # ============================================================
    def _update_status(self, text: str):
        self.root.after(0, lambda: self.status_var.set(text))
        
    def _update_progress(self):
        progress = (self.current_image_index / self.total_images * 100) if self.total_images > 0 else 0
        
        def update():
            self.progress_var.set(progress)
            self.progress_text_var.set(f"{self.current_image_index}/{self.total_images}枚")
            
        self.root.after(0, update)
        
    def _log(self, message: str):
        timestamp = datetime.now().strftime("%H:%M:%S")
        
        def append():
            self.log_text.insert('end', f"[{timestamp}] {message}\n")
            self.log_text.see('end')
            
        self.root.after(0, append)


# ============================================================
# メイン
# ============================================================
def main():
    root = tk.Tk()
    app = PhotoSorterApp(root)
    root.mainloop()


if __name__ == "__main__":
    main()
