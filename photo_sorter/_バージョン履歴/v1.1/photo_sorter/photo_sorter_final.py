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
# スタイル設定 - マテリアルデザイン風モダンダークテーマ
# ============================================================
COLORS = {
    # 背景色（階層化されたダークグレー）
    'bg_dark': '#121212',         # Material Dark - 最背面
    'bg': '#1e1e1e',              # Material Dark - 基本背景
    'bg_light': '#2d2d2d',        # Material Dark - 浮き上がりパネル
    'bg_elevated': '#383838',     # Material Dark - さらに浮き上がった要素
    
    # 前景色（視認性重視の階層化）
    'fg': '#e0e0e0',              # メインテキスト（高コントラスト）
    'fg_bright': '#ffffff',       # 強調テキスト
    'fg_secondary': '#a0a0a0',    # セカンダリテキスト
    'fg_dim': '#6b6b6b',          # 薄いテキスト・ラベル
    
    # ボーダー・分割線
    'border': '#404040',          # 通常ボーダー
    'border_light': '#525252',    # 明るいボーダー
    'border_focus': '#03dac6',    # フォーカス時（ティール）
    
    # アクセントカラー（Material Teal）
    'accent': '#03dac6',          # プライマリアクセント（ティール）
    'accent_light': '#64ffda',    # ライトティール
    'accent_dark': '#00a896',     # ダークティール
    
    # ステータスカラー（Material Design準拠）
    'success': '#4caf50',         # 成功（グリーン500）
    'success_light': '#81c784',   # ライトグリーン
    'warning': '#ffb74d',         # 警告（オレンジ300）
    'warning_dark': '#ff9800',    # ダークオレンジ
    'error': '#f44336',           # エラー（レッド500）
    'error_light': '#e57373',     # ライトエラー
    'info': '#29b6f6',            # 情報（ライトブルー400）
    
    # 入力欄
    'input_bg': '#2d2d2d',        # 入力背景
    'input_bg_focus': '#363636',  # フォーカス時背景
    'input_border': '#4a4a4a',    # 入力ボーダー
    
    # ボタン（Material風フラットボタン）
    'btn_primary': '#03dac6',     # プライマリ（ティール）
    'btn_primary_hover': '#00bfa5',
    'btn_primary_fg': '#000000',  # プライマリ文字色（黒）
    'btn_secondary': '#424242',   # セカンダリ（グレー800）
    'btn_secondary_hover': '#535353',
    'btn_success': '#4caf50',     # 成功ボタン
    'btn_success_hover': '#66bb6a',
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
        """ttkスタイル設定 - マテリアルデザイン風モダンダークテーマ"""
        style = ttk.Style()
        style.theme_use('clam')
        
        # === OS対応フォント設定 ===
        import platform
        if platform.system() == 'Darwin':  # macOS
            self.font_family = 'SF Pro Display'
            self.font_mono = 'SF Mono'
        elif platform.system() == 'Windows':
            self.font_family = 'Segoe UI'
            self.font_mono = 'Consolas'
        else:  # Linux
            self.font_family = 'Ubuntu'
            self.font_mono = 'Ubuntu Mono'
        
        # フォールバック
        try:
            test_font = ('SF Pro Display', 12)
            self.root.option_add('*Font', test_font)
        except:
            self.font_family = 'Helvetica Neue'
            self.font_mono = 'Menlo'
        
        # === フレームスタイル ===
        style.configure('Dark.TFrame', background=COLORS['bg_dark'])
        style.configure('Panel.TFrame', background=COLORS['bg_light'])
        
        # === ラベルスタイル ===
        style.configure('Title.TLabel',
                       background=COLORS['bg_dark'],
                       foreground=COLORS['fg_bright'],
                       font=(self.font_family, 28, 'bold'))
        style.configure('Section.TLabel',
                       background=COLORS['bg_light'],
                       foreground=COLORS['fg_dim'],
                       font=(self.font_family, 11, 'bold'))
        style.configure('Body.TLabel',
                       background=COLORS['bg_light'],
                       foreground=COLORS['fg'],
                       font=(self.font_family, 13))
        
        # === プログレスバー - フラットモダンスタイル ===
        style.configure('Modern.Horizontal.TProgressbar',
                       background=COLORS['accent'],
                       troughcolor=COLORS['bg_dark'],
                       borderwidth=0,
                       lightcolor=COLORS['accent'],
                       darkcolor=COLORS['accent_dark'])
        # プログレスバーのレイアウト（より太く）
        style.layout('Modern.Horizontal.TProgressbar',
                    [('Horizontal.Progressbar.trough',
                      {'children': [('Horizontal.Progressbar.pbar',
                                    {'side': 'left', 'sticky': 'ns'})],
                       'sticky': 'nswe'})])
        
        # === スライダー - スリムでモダン ===
        style.configure('Modern.Horizontal.TScale',
                       background=COLORS['bg_light'],
                       troughcolor=COLORS['bg_elevated'],
                       sliderthickness=16,
                       borderwidth=0)
        style.map('Modern.Horizontal.TScale',
                 background=[('active', COLORS['bg_light'])],
                 troughcolor=[('active', COLORS['accent_dark'])])
        
        # === オプションメニュー - ダークスタイル ===
        style.configure('TMenubutton',
                       background=COLORS['input_bg'],
                       foreground=COLORS['fg'],
                       font=(self.font_family, 12),
                       padding=(12, 6),
                       relief='flat')
        style.map('TMenubutton',
                 background=[('active', COLORS['bg_elevated']),
                            ('pressed', COLORS['bg_elevated'])],
                 foreground=[('active', COLORS['fg_bright'])])
        
    def _build_ui(self):
        """UIコンポーネントを構築 - モダンレイアウト"""
        # メインコンテナ
        self.root.configure(bg=COLORS['bg_dark'])
        
        main_frame = tk.Frame(self.root, bg=COLORS['bg_dark'])
        main_frame.pack(fill='both', expand=True, padx=24, pady=20)
        
        # ヘッダー
        self._build_header(main_frame)
        
        # メインコンテンツ（スクロール可能）
        content_frame = tk.Frame(main_frame, bg=COLORS['bg_dark'])
        content_frame.pack(fill='both', expand=True)
        
        # 設定パネル
        self._build_settings_panel(content_frame)
        
        # 実行パネル
        self._build_execution_panel(content_frame)
        
        # ログパネル
        self._build_log_panel(content_frame)
        
    def _build_header(self, parent):
        """ヘッダーセクション"""
        header_frame = tk.Frame(parent, bg=COLORS['bg_dark'])
        header_frame.pack(fill='x', pady=(0, 24))
        
        # タイトル（動的フォント使用）
        title_label = tk.Label(header_frame,
                              text="PhotoSorter AI",
                              bg=COLORS['bg_dark'],
                              fg=COLORS['fg_bright'],
                              font=(self.font_family, 32, 'bold'))
        title_label.pack(side='left')
        
        # サブタイトル
        subtitle_label = tk.Label(header_frame,
                                 text="Gemini AI写真分類",
                                 bg=COLORS['bg_dark'],
                                 fg=COLORS['fg_secondary'],
                                 font=(self.font_family, 14))
        subtitle_label.pack(side='left', padx=(16, 0), pady=(14, 0))
        
    def _build_settings_panel(self, parent):
        """設定パネル（API・フォルダ・オプション）"""
        # パネルコンテナ（余白を十分に確保）
        panel = tk.Frame(parent, bg=COLORS['bg_light'], 
                        highlightbackground=COLORS['border'],
                        highlightthickness=1)
        panel.pack(fill='x', pady=(0, 16))
        
        # パネルヘッダー
        header = tk.Frame(panel, bg=COLORS['bg_light'])
        header.pack(fill='x', padx=24, pady=(20, 16))
        
        tk.Label(header, text="⚙️  設定",
                bg=COLORS['bg_light'], fg=COLORS['fg_secondary'],
                font=(self.font_family, 12, 'bold')).pack(side='left')
        
        # コンテンツ（余白を広げる）
        content = tk.Frame(panel, bg=COLORS['bg_light'])
        content.pack(fill='x', padx=24, pady=(0, 20))
        
        # --- API設定行 ---
        api_row = tk.Frame(content, bg=COLORS['bg_light'])
        api_row.pack(fill='x', pady=8)
        
        tk.Label(api_row, text="API キー",
                bg=COLORS['bg_light'], fg=COLORS['fg'],
                font=(self.font_family, 13), width=12, anchor='w').pack(side='left')
        
        api_entry = tk.Entry(api_row, textvariable=self.api_key_var, show="•",
                            bg=COLORS['input_bg'], fg=COLORS['fg'],
                            insertbackground=COLORS['accent'],
                            font=(self.font_family, 13),
                            relief='flat', highlightbackground=COLORS['input_border'],
                            highlightthickness=2, highlightcolor=COLORS['border_focus'])
        api_entry.pack(side='left', fill='x', expand=True, ipady=10, padx=(0, 16))
        
        # 検証ボタン（プライマリカラー）
        self.verify_btn = tk.Button(api_row, text="✓ 検証",
                                   command=self._verify_api_key,
                                   bg=COLORS['btn_primary'],
                                   fg=COLORS['btn_primary_fg'],
                                   activebackground=COLORS['btn_primary_hover'],
                                   activeforeground=COLORS['btn_primary_fg'],
                                   font=(self.font_family, 12, 'bold'),
                                   padx=24, pady=8,
                                   cursor='hand2', relief='flat', bd=0)
        self.verify_btn.pack(side='left')
        
        # --- モデル選択行 ---
        model_row = tk.Frame(content, bg=COLORS['bg_light'])
        model_row.pack(fill='x', pady=8)
        
        tk.Label(model_row, text="モデル",
                bg=COLORS['bg_light'], fg=COLORS['fg'],
                font=(self.font_family, 13), width=12, anchor='w').pack(side='left')
        
        model_menu = ttk.OptionMenu(model_row, self.model_var, MODELS[0], *MODELS)
        model_menu.pack(side='left')
        
        # --- 入力フォルダ行 ---
        input_row = tk.Frame(content, bg=COLORS['bg_light'])
        input_row.pack(fill='x', pady=8)
        
        tk.Label(input_row, text="入力フォルダ",
                bg=COLORS['bg_light'], fg=COLORS['fg'],
                font=(self.font_family, 13), width=12, anchor='w').pack(side='left')
        
        input_entry = tk.Entry(input_row, textvariable=self.input_folder_var,
                              bg=COLORS['input_bg'], fg=COLORS['fg'],
                              insertbackground=COLORS['accent'],
                              font=(self.font_family, 12),
                              relief='flat', highlightbackground=COLORS['input_border'],
                              highlightthickness=2, highlightcolor=COLORS['border_focus'])
        input_entry.pack(side='left', fill='x', expand=True, ipady=9, padx=(0, 16))
        
        tk.Button(input_row, text="📁 選択",
                 command=self._select_input_folder,
                 bg=COLORS['btn_secondary'],
                 fg=COLORS['fg'],
                 activebackground=COLORS['btn_secondary_hover'],
                 activeforeground=COLORS['fg_bright'],
                 font=(self.font_family, 12),
                 padx=20, pady=7,
                 cursor='hand2', relief='flat', bd=0).pack(side='left')
        
        # --- 出力フォルダ行 ---
        output_row = tk.Frame(content, bg=COLORS['bg_light'])
        output_row.pack(fill='x', pady=8)
        
        tk.Label(output_row, text="出力フォルダ",
                bg=COLORS['bg_light'], fg=COLORS['fg'],
                font=(self.font_family, 13), width=12, anchor='w').pack(side='left')
        
        output_entry = tk.Entry(output_row, textvariable=self.output_folder_var,
                               bg=COLORS['input_bg'], fg=COLORS['fg'],
                               insertbackground=COLORS['accent'],
                               font=(self.font_family, 12),
                               relief='flat', highlightbackground=COLORS['input_border'],
                               highlightthickness=2, highlightcolor=COLORS['border_focus'])
        output_entry.pack(side='left', fill='x', expand=True, ipady=9, padx=(0, 16))
        
        tk.Button(output_row, text="📁 選択",
                 command=self._select_output_folder,
                 bg=COLORS['btn_secondary'],
                 fg=COLORS['fg'],
                 activebackground=COLORS['btn_secondary_hover'],
                 activeforeground=COLORS['fg_bright'],
                 font=(self.font_family, 12),
                 padx=20, pady=7,
                 cursor='hand2', relief='flat', bd=0).pack(side='left')
        
        # --- 処理間隔行 ---
        interval_row = tk.Frame(content, bg=COLORS['bg_light'])
        interval_row.pack(fill='x', pady=8)
        
        tk.Label(interval_row, text="処理間隔",
                bg=COLORS['bg_light'], fg=COLORS['fg'],
                font=(self.font_family, 13), width=12, anchor='w').pack(side='left')
        
        self.interval_slider = ttk.Scale(interval_row, from_=5, to=30,
                                         variable=self.interval_var,
                                         orient='horizontal', length=220,
                                         style='Modern.Horizontal.TScale',
                                         command=self._update_interval_label)
        self.interval_slider.pack(side='left', padx=(0, 16))
        
        self.interval_label = tk.Label(interval_row, text="15秒",
                                       bg=COLORS['bg_light'],
                                       fg=COLORS['accent'],
                                       font=(self.font_family, 15, 'bold'))
        self.interval_label.pack(side='left')
        
    def _build_execution_panel(self, parent):
        """実行パネル（進捗・ステータス・ボタン）"""
        panel = tk.Frame(parent, bg=COLORS['bg_light'], 
                        highlightbackground=COLORS['border'],
                        highlightthickness=1)
        panel.pack(fill='x', pady=(0, 16))
        
        # パネルヘッダー
        header = tk.Frame(panel, bg=COLORS['bg_light'])
        header.pack(fill='x', padx=24, pady=(20, 16))
        
        tk.Label(header, text="▶️  実行",
                bg=COLORS['bg_light'], fg=COLORS['fg_secondary'],
                font=(self.font_family, 12, 'bold')).pack(side='left')
        
        # コンテンツ（余白を広げる）
        content = tk.Frame(panel, bg=COLORS['bg_light'])
        content.pack(fill='x', padx=24, pady=(0, 20))
        
        # --- 進捗バー行 ---
        progress_frame = tk.Frame(content, bg=COLORS['bg_light'])
        progress_frame.pack(fill='x', pady=(0, 16))
        
        self.progress_bar = ttk.Progressbar(progress_frame,
                                           variable=self.progress_var,
                                           maximum=100,
                                           style='Modern.Horizontal.TProgressbar',
                                           length=400)
        self.progress_bar.pack(side='left', fill='x', expand=True, ipady=6)
        
        self.progress_label = tk.Label(progress_frame,
                                       textvariable=self.progress_text_var,
                                       bg=COLORS['bg_light'],
                                       fg=COLORS['fg'],
                                       font=(self.font_family, 14, 'bold'),
                                       width=10)
        self.progress_label.pack(side='left', padx=(20, 0))
        
        # --- ステータス表示（中央配置、大きめ） ---
        self.status_label = tk.Label(content,
                                    textvariable=self.status_var,
                                    bg=COLORS['bg_light'],
                                    fg=COLORS['warning'],
                                    font=(self.font_family, 20, 'bold'))
        self.status_label.pack(pady=16)
        
        # --- コントロールボタン（余白を広げる）---
        btn_frame = tk.Frame(content, bg=COLORS['bg_light'])
        btn_frame.pack(fill='x', pady=(12, 0))
        
        # 開始ボタン（成功緑）
        self.start_btn = tk.Button(btn_frame, text="▶  開始",
                                   command=self._start_processing,
                                   bg=COLORS['btn_success'],
                                   fg=COLORS['fg_bright'],
                                   activebackground=COLORS['btn_success_hover'],
                                   activeforeground=COLORS['fg_bright'],
                                   font=(self.font_family, 14, 'bold'),
                                   padx=40, pady=12,
                                   cursor='hand2', relief='flat', bd=0)
        self.start_btn.pack(side='left', expand=True, padx=8)
        
        # 一時停止ボタン
        self.pause_btn = tk.Button(btn_frame, text="⏸  一時停止",
                                   command=self._toggle_pause,
                                   bg=COLORS['btn_secondary'],
                                   fg=COLORS['fg'],
                                   activebackground=COLORS['btn_secondary_hover'],
                                   activeforeground=COLORS['fg_bright'],
                                   font=(self.font_family, 14, 'bold'),
                                   padx=40, pady=12,
                                   cursor='hand2', relief='flat', bd=0,
                                   state='disabled')
        self.pause_btn.pack(side='left', expand=True, padx=8)
        
        # リセットボタン
        self.reset_btn = tk.Button(btn_frame, text="↻  リセット",
                                   command=self._reset_processing,
                                   bg=COLORS['btn_secondary'],
                                   fg=COLORS['fg'],
                                   activebackground=COLORS['btn_secondary_hover'],
                                   activeforeground=COLORS['fg_bright'],
                                   font=(self.font_family, 14, 'bold'),
                                   padx=40, pady=12,
                                   cursor='hand2', relief='flat', bd=0)
        self.reset_btn.pack(side='left', expand=True, padx=8)
        
    def _build_log_panel(self, parent):
        """ログパネル（ターミナル風）"""
        panel = tk.Frame(parent, bg=COLORS['bg_light'], 
                        highlightbackground=COLORS['border'],
                        highlightthickness=1)
        panel.pack(fill='both', expand=True)
        
        # パネルヘッダー
        header = tk.Frame(panel, bg=COLORS['bg_light'])
        header.pack(fill='x', padx=24, pady=(20, 12))
        
        tk.Label(header, text="💻  コンソール",
                bg=COLORS['bg_light'], fg=COLORS['fg_secondary'],
                font=(self.font_family, 12, 'bold')).pack(side='left')
        
        # ターミナル風ログエリア（暗い背景、等幅フォント）
        log_container = tk.Frame(panel, bg=COLORS['bg_dark'],
                                highlightbackground=COLORS['border'],
                                highlightthickness=1)
        log_container.pack(fill='both', expand=True, padx=24, pady=(0, 20))
        
        self.log_text = scrolledtext.ScrolledText(log_container,
                                                  bg=COLORS['bg_dark'],
                                                  fg=COLORS['fg_secondary'],
                                                  font=(self.font_mono, 11),
                                                  insertbackground=COLORS['accent'],
                                                  relief='flat',
                                                  highlightthickness=0,
                                                  padx=16, pady=12)
        self.log_text.pack(fill='both', expand=True)
        
    # ============================================================
    # イベントハンドラ
    # ============================================================
    def _update_interval_label(self, value):
        self.interval_label.config(text=f"{int(float(value))}秒")
        
    def _select_input_folder(self):
        folder = filedialog.askdirectory(title="入力フォルダを選択")
        if folder:
            self.input_folder_var.set(folder)
            self._log(f"📁 入力フォルダを設定: {folder}")
            
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
    def _update_status(self, text: str, color: str = None):
        """ステータス更新（色も自動変更）"""
        def update():
            self.status_var.set(text)
            # 状況に応じた色を自動設定
            if color:
                status_color = color
            elif "完了" in text or "成功" in text:
                status_color = COLORS['success']
            elif "エラー" in text or "失敗" in text or "❌" in text:
                status_color = COLORS['error']
            elif "待機" in text or "⏳" in text:
                status_color = COLORS['warning']
            elif "解析中" in text or "処理" in text:
                status_color = COLORS['accent']
            elif "一時停止" in text:
                status_color = COLORS['fg_dim']
            else:
                status_color = COLORS['fg']
            self.status_label.config(fg=status_color)
        self.root.after(0, update)
        
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
