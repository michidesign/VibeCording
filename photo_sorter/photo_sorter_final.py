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
# スタイル設定 - VS Code風 Flat Dark Theme
# ============================================================
COLORS = {
    # ベースカラー
    'bg_app': '#1e1e1e',        # アプリ背景 (VS Code Editor BG)
    'bg_panel': '#252526',      # パネル/サイドバー背景
    'bg_input': '#3c3c3c',      # 入力フィールド
    'bg_hover': '#2a2d2e',      # ホバー時の背景
    
    # テキストカラー
    'fg_primary': '#cccccc',    # メインテキスト
    'fg_secondary': '#858585',  # サブテキスト/ラベル
    'fg_bright': '#ffffff',     # 強調テキスト
    'fg_link': '#3794ff',       # リンク/アクセント文字
    
    # アクセントカラー (Professional Blue/Teal)
    'accent': '#007acc',        # メインアクセント (VS Code Blue)
    'accent_hover': '#0098ff',  # ホバー時
    'accent_light': '#4fc1ff',  # 明るいアクセント
    
    # ステータスカラー (Subtle & Clear)
    'success': '#4ec9b0',       # 成功 (Teal Green)
    'warning': '#cca700',       # 警告 (Dark Yellow)
    'error': '#f48771',         # エラー (Soft Red)
    'info': '#75beff',          # 情報
    
    # ボーダー・区切り線
    'border_subtle': '#3e3e42', # 控えめなボーダー
    'border_focus': '#007acc',  # フォーカス枠
    
    # ボタン
    'btn_primary_bg': '#007acc',
    'btn_primary_fg': '#000000', # Black for visibility
    'btn_secondary_bg': '#3c3c3c',
    'btn_secondary_fg': '#000000', # Black for visibility
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
# PhotoSorterApp クラス (V2 Design)
# ============================================================
class PhotoSorterApp:
    def __init__(self, root):
        self.root = root
        self.root.title("📷 PhotoSorter AI")
        self.root.geometry("900x800")
        self.root.minsize(800, 700)
        self.root.configure(bg=COLORS['bg_app'])
        
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
        """ttkスタイル設定 - モダンダークテーマ (Flat)"""
        style = ttk.Style()
        style.theme_use('clam')
        
        # 基本設定
        style.configure('.', background=COLORS['bg_app'], foreground=COLORS['fg_primary'], font=('Segoe UI', 10))
        
        # パネル & フレーム
        style.configure('App.TFrame', background=COLORS['bg_app'])
        style.configure('Panel.TFrame', background=COLORS['bg_panel'])
        
        # タイトル & ラベル
        style.configure('Header.TLabel', 
                       background=COLORS['bg_app'], 
                       foreground=COLORS['fg_bright'], 
                       font=('Helvetica Neue', 24, 'bold'))
                       
        style.configure('SubHeader.TLabel', 
                       background=COLORS['bg_app'], 
                       foreground=COLORS['fg_secondary'], 
                       font=('Helvetica Neue', 11))
                       
        style.configure('PanelTitle.TLabel', 
                       background=COLORS['bg_panel'], 
                       foreground=COLORS['fg_bright'], 
                       font=('Helvetica Neue', 11, 'bold'))
                       
        style.configure('PanelLabel.TLabel', 
                       background=COLORS['bg_panel'], 
                       foreground=COLORS['fg_primary'], 
                       font=('Helvetica Neue', 10))
        
        # プログレスバー (Flat)
        style.configure('Flat.Horizontal.TProgressbar',
                       background=COLORS['accent'],
                       troughcolor=COLORS['bg_input'],
                       borderwidth=0,
                       lightcolor=COLORS['accent'],
                       darkcolor=COLORS['accent'])
                       
        # スライダー
        style.configure('Flat.Horizontal.TScale',
                       background=COLORS['bg_panel'],
                       troughcolor=COLORS['bg_input'],
                       sliderthickness=16,
                       sliderlength=24,
                       sliderrelief='flat')
        style.map('Flat.Horizontal.TScale',
                 background=[('active', COLORS['accent_hover'])])

    def _build_ui(self):
        """UIコンポーネントを構築 - Breathing Room Layout"""
        # メインコンテナ (padding増量)
        main_container = ttk.Frame(self.root, style='App.TFrame')
        main_container.pack(fill='both', expand=True, padx=30, pady=30)
        
        # ヘッダーエリア
        self._build_header(main_container)
        
        # コンテンツエリア
        # 左パネル: 設定 (API, フォルダ, オプション)
        # 右パネル: 実行 & ログ
        # 上下に分けるのではなく、左右に分けたいが、ウィンドウ幅が狭い場合を考慮して
        # 上部: 設定、下部: 実行＆ログ という構成にする（元のレイアウトを踏襲しつつスペースを空ける）
        
        content_area = ttk.Frame(main_container, style='App.TFrame')
        content_area.pack(fill='both', expand=True, pady=(20, 0))
        
        # 設定パネル
        self._build_settings_panel(content_area)
        
        # 実行パネル
        self._build_execution_panel(content_area)
        
        # ログパネル
        self._build_log_panel(content_area)

    def _build_header(self, parent):
        """ヘッダー構築"""
        header_frame = ttk.Frame(parent, style='App.TFrame')
        header_frame.pack(fill='x')
        
        title = ttk.Label(header_frame, text="PhotoSorter AI", style='Header.TLabel')
        title.pack(anchor='w')
        
        subtitle = ttk.Label(header_frame, text="AI搭載 写真自動選別ツール", style='SubHeader.TLabel')
        subtitle.pack(anchor='w', pady=(5, 0))

    def _build_settings_panel(self, parent):
        """設定パネル"""
        # パネルコンテナ (カード風)
        panel = tk.Frame(parent, bg=COLORS['bg_panel'], padx=20, pady=20)
        panel.pack(fill='x', pady=(0, 20))
        
        # タイトル
        tk.Label(panel, text="設定", bg=COLORS['bg_panel'], fg=COLORS['fg_secondary'], 
                 font=('Helvetica Neue', 9, 'bold'), anchor='w').pack(fill='x', pady=(0, 15))
        
        # 入力エリア
        content = tk.Frame(panel, bg=COLORS['bg_panel'])
        content.pack(fill='x')
        
        # --- API Key & Model ---
        row1 = tk.Frame(content, bg=COLORS['bg_panel'])
        row1.pack(fill='x', pady=(0, 10))
        
        # API Key
        api_frame = tk.Frame(row1, bg=COLORS['bg_panel'])
        api_frame.pack(side='left', fill='x', expand=True, padx=(0, 20))
        self._create_field_label(api_frame, "APIキー")
        api_entry_frame = tk.Frame(api_frame, bg=COLORS['bg_panel'])
        api_entry_frame.pack(fill='x')
        
        api_entry = tk.Entry(api_entry_frame, textvariable=self.api_key_var, show="•",
                            bg=COLORS['bg_input'], fg=COLORS['fg_primary'],
                            insertbackground=COLORS['fg_bright'],
                            relief='flat', font=('Consolas', 11))
        api_entry.pack(side='left', fill='x', expand=True, ipady=8, padx=(0, 5))
        
        verify_btn = tk.Button(api_entry_frame, text="検証", command=self._verify_api_key,
                              bg=COLORS['btn_primary_bg'], fg=COLORS['btn_primary_fg'],
                              activebackground=COLORS['accent_hover'], activeforeground='white',
                              relief='flat', font=('Helvetica Neue', 9, 'bold'), cursor='hand2', padx=12)
        verify_btn.pack(side='right', ipady=3)

        # Model
        model_frame = tk.Frame(row1, bg=COLORS['bg_panel'])
        model_frame.pack(side='right', fill='x')
        self._create_field_label(model_frame, "モデル")
        model_menu = ttk.OptionMenu(model_frame, self.model_var, MODELS[0], *MODELS)
        model_menu.pack(fill='x', ipady=2)
        
        # --- Folders ---
        row2 = tk.Frame(content, bg=COLORS['bg_panel'])
        row2.pack(fill='x', pady=(0, 10))
        
        # Input Folder
        input_frame = tk.Frame(row2, bg=COLORS['bg_panel'])
        input_frame.pack(side='left', fill='x', expand=True, padx=(0, 20))
        self._create_field_label(input_frame, "入力フォルダ")
        self._create_folder_picker(input_frame, self.input_folder_var, self._select_input_folder)
        
        # Output Folder
        output_frame = tk.Frame(row2, bg=COLORS['bg_panel'])
        output_frame.pack(side='right', fill='x', expand=True)
        self._create_field_label(output_frame, "出力フォルダ")
        self._create_folder_picker(output_frame, self.output_folder_var, self._select_output_folder)
        
        # --- Options ---
        row3 = tk.Frame(content, bg=COLORS['bg_panel'])
        row3.pack(fill='x')
        
        # Interval
        self._create_field_label(row3, "処理間隔")
        interval_frame = tk.Frame(row3, bg=COLORS['bg_panel'])
        interval_frame.pack(fill='x')
        
        scale = ttk.Scale(interval_frame, from_=5, to=60, variable=self.interval_var, 
                         orient='horizontal', style='Flat.Horizontal.TScale',
                         command=self._update_interval_label)
        scale.pack(side='left', fill='x', expand=True, padx=(0, 15))
        
        self.interval_label = tk.Label(interval_frame, text="15s", bg=COLORS['bg_panel'], 
                                       fg=COLORS['accent'], font=('Helvetica Neue', 11, 'bold'), width=4)
        self.interval_label.pack(side='right')

    def _build_execution_panel(self, parent):
        """実行パネル"""
        panel = tk.Frame(parent, bg=COLORS['bg_panel'], padx=20, pady=20)
        panel.pack(fill='x', pady=(0, 20))
        
        # タイトル
        tk.Label(panel, text="実行", bg=COLORS['bg_panel'], fg=COLORS['fg_secondary'], 
                 font=('Helvetica Neue', 9, 'bold'), anchor='w').pack(fill='x', pady=(0, 15))

        # Status & Progress Area
        status_area = tk.Frame(panel, bg=COLORS['bg_panel'])
        status_area.pack(fill='x', pady=(0, 20))
        
        # Left: Progress Bar and Text
        prog_left = tk.Frame(status_area, bg=COLORS['bg_panel'])
        prog_left.pack(side='left', fill='x', expand=True, padx=(0, 20))
        
        self.progress_bar = ttk.Progressbar(prog_left, variable=self.progress_var,
                                           maximum=100, style='Flat.Horizontal.TProgressbar')
        self.progress_bar.pack(fill='x', ipady=4, pady=(0, 5))
        
        tk.Label(prog_left, textvariable=self.progress_text_var,
                bg=COLORS['bg_panel'], fg=COLORS['fg_secondary'],
                font=('Helvetica Neue', 10), anchor='w').pack(fill='x')
        
        # Right: Status Text (Big)
        self.status_label = tk.Label(status_area, textvariable=self.status_var,
                                    bg=COLORS['bg_panel'], fg=COLORS['fg_bright'],
                                    font=('Helvetica Neue', 16, 'bold'), anchor='e')
        self.status_label.pack(side='right')
        
        # Controls
        btn_frame = tk.Frame(panel, bg=COLORS['bg_panel'])
        btn_frame.pack(fill='x')
        
        self.start_btn = self._create_control_btn(btn_frame, "▶ 開始", COLORS['success'], self._start_processing)
        self.start_btn.pack(side='left', fill='x', expand=True, padx=(0, 10))
        
        self.pause_btn = self._create_control_btn(btn_frame, "⏸ 一時停止", COLORS['warning'], self._toggle_pause, state='disabled')
        self.pause_btn.pack(side='left', fill='x', expand=True, padx=(0, 10))
        
        self.reset_btn = self._create_control_btn(btn_frame, "↻ リセット", COLORS['btn_secondary_bg'], self._reset_processing)
        self.reset_btn.pack(side='left', fill='x', expand=True)

    def _build_log_panel(self, parent):
        """ログパネル"""
        # カード背景なし、直接配置してターミナルっぽくする
        panel = tk.Frame(parent, bg=COLORS['bg_panel'], padx=1, pady=1) # Border
        panel.pack(fill='both', expand=True)
        
        # タイトルバー
        title_bar = tk.Frame(panel, bg=COLORS['bg_hover'], height=28)
        title_bar.pack(fill='x')
        title_bar.pack_propagate(False)
        
        tk.Label(title_bar, text="実行ログ", bg=COLORS['bg_hover'], fg=COLORS['fg_secondary'],
                 font=('Helvetica Neue', 8, 'bold'), padx=10).pack(side='left', fill='y')
                 
        # ログ本文
        self.log_text = scrolledtext.ScrolledText(panel, bg=COLORS['bg_app'], fg=COLORS['fg_primary'],
                                                 font=('Menlo', 10), relief='flat',
                                                 state='normal', padx=15, pady=15,
                                                 insertbackground=COLORS['fg_bright'])
        self.log_text.pack(fill='both', expand=True)

    # --- UI Helper Methods ---
    def _create_field_label(self, parent, text):
        tk.Label(parent, text=text, bg=COLORS['bg_panel'], fg=COLORS['fg_primary'],
                 font=('Helvetica Neue', 10)).pack(anchor='w', pady=(0, 5))

    def _create_folder_picker(self, parent, var, command):
        frame = tk.Frame(parent, bg=COLORS['bg_panel'])
        frame.pack(fill='x')
        
        entry = tk.Entry(frame, textvariable=var, bg=COLORS['bg_input'], fg=COLORS['fg_primary'],
                        relief='flat', font=('Helvetica Neue', 11))
        entry.pack(side='left', fill='x', expand=True, ipady=8, padx=(0, 5))
        
        btn = tk.Button(frame, text="選択", command=command,
                       bg=COLORS['btn_secondary_bg'], fg=COLORS['btn_secondary_fg'],
                       activebackground=COLORS['bg_hover'], activeforeground='white',
                       relief='flat', width=6, cursor='hand2')
        btn.pack(side='right', ipady=3)

    def _create_control_btn(self, parent, text, bg, command, state='normal'):
        return tk.Button(parent, text=text, command=command, state=state,
                        bg=bg, fg='#000000', 
                        activebackground=COLORS['accent_hover'], activeforeground='#000000',
                        relief='flat', font=('Helvetica Neue', 11, 'bold'), cursor='hand2',
                        pady=12)

    # ============================================================
    # イベントハンドラ
    # ============================================================
    def _update_interval_label(self, value):
        self.interval_label.config(text=f"{int(float(value))}s")
        
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
        """APIキー検証（UIをブロックしないようスレッドで実行）"""
        api_key = self.api_key_var.get().strip()
        if not api_key:
            messagebox.showerror("エラー", "APIキーを入力してください")
            return
        
        model_name = self.model_var.get()
        self._log(f"🔄 APIキー検証中... (モデル: {model_name})")
        self._update_status("🔄 検証中...", COLORS['accent'])
        
        # 別スレッドで検証を実行
        thread = threading.Thread(target=self._verify_api_key_thread, args=(api_key, model_name), daemon=True)
        thread.start()

    def _verify_api_key_thread(self, api_key: str, model_name: str):
        """APIキー検証の実処理（別スレッドで実行）"""
        max_retries = 3
        
        for attempt in range(max_retries):
            try:
                self.api = GeminiAPI(api_key, model_name)
                response = self._test_api_connection(api_key, model_name)
                
                if response:
                    self.root.after(0, lambda: messagebox.showinfo("成功", f"✅ 接続確認完了！\nモデル: {model_name}"))
                    self._log(f"✅ 接続確認完了 (モデル: {model_name})")
                    self._update_status("待機中...", COLORS['fg_bright'])
                    return
                else:
                    raise APIError("空のレスポンスが返されました")
                    
            except RateLimitError:
                rate_limit_delay = 30 * (attempt + 1)
                if attempt < max_retries - 1:
                    self._log(f"⚠️ レート制限 (429)。{rate_limit_delay}秒後にリトライします... ({attempt+1}/{max_retries})")
                    for remaining in range(rate_limit_delay, 0, -1):
                        self._update_status(f"⏳ レート制限待機中: {remaining}秒", COLORS['warning'])
                        time.sleep(1)
                else:
                    self.root.after(0, lambda: messagebox.showerror("エラー", "レート制限エラー (429)\n\nGemini APIの無料枠制限に達しました。\n1-2分待ってから再度お試しください。"))
                    self._log("❌ レート制限によりAPIキー検証に失敗しました")
                    self._update_status("待機中...", COLORS['fg_bright'])
                    return
                    
            except InvalidRequestError as e:
                err = str(e)
                if "API_KEY_INVALID" in err or "API key not valid" in err:
                    self.root.after(0, lambda: messagebox.showerror("エラー", "APIキーが無効です。\n\n正しいキーを入力してください。"))
                    self._log("❌ 無効なAPIキーです")
                else:
                    self.root.after(0, lambda e=err: messagebox.showerror("エラー", f"リクエストエラー:\n{e[:200]}"))
                    self._log(f"❌ リクエストエラー: {err[:100]}")
                self._update_status("待機中...", COLORS['fg_bright'])
                return
                
            except APIError as e:
                if attempt < max_retries - 1:
                    self._log(f"⚠️ 接続エラー。5秒後にリトライします... ({attempt+1}/{max_retries})")
                    for remaining in range(5, 0, -1):
                        self._update_status(f"🔄 リトライ待機: {remaining}秒", COLORS['warning'])
                        time.sleep(1)
                else:
                    self.root.after(0, lambda e=str(e): messagebox.showerror("エラー", f"接続エラー:\n{e}\n\nネットワーク接続を確認してください。"))
                    self._log(f"❌ 接続エラー: {str(e)}")
                    self._update_status("待機中...", COLORS['fg_bright'])
                    return
                    
            except Exception as e:
                if attempt < max_retries - 1:
                    self._log(f"⚠️ エラー発生。5秒後にリトライします... ({attempt+1}/{max_retries})")
                    for remaining in range(5, 0, -1):
                        self._update_status(f"🔄 リトライ待機: {remaining}秒", COLORS['warning'])
                        time.sleep(1)
                else:
                    self.root.after(0, lambda e=str(e): messagebox.showerror("エラー", f"予期しないエラー:\n{e}"))
                    self._log(f"❌ 予期しないエラー: {str(e)}")
                    self._update_status("待機中...", COLORS['fg_bright'])
                    return

    def _test_api_connection(self, api_key: str, model: str) -> str:
        """APIキー検証用のシンプルなテストリクエスト（SYSTEM_INSTRUCTIONなし）"""
        url = f"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent?key={api_key}"
        
        request_body = {
            "contents": [{"parts": [{"text": "Hi, respond with OK"}]}],
            "generationConfig": {
                "temperature": 0.0,
                "maxOutputTokens": 10
            }
        }
        
        data = json.dumps(request_body).encode('utf-8')
        req = urllib.request.Request(
            url,
            data=data,
            headers={'Content-Type': 'application/json'},
            method='POST'
        )
        
        try:
            # タイムアウトを延長 (90秒)
            with urllib.request.urlopen(req, timeout=90) as response:
                result = json.loads(response.read().decode('utf-8'))
                
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
            elif e.code == 403:
                raise InvalidRequestError("API_KEY_INVALID")
            else:
                raise APIError(f"HTTP {e.code}: {e.reason}")
        except urllib.error.URLError as e:
            raise APIError(f"ネットワーク接続エラー: {str(e)}")
            
    def _start_processing(self):
        if not self._validate_inputs():
            return
            
        input_folder = Path(self.input_folder_var.get())
        self.image_files = [
            f for f in input_folder.iterdir()
            if f.is_file() and f.suffix.lower() in SUPPORTED_EXTENSIONS
        ]
        
        if not self.image_files:
            messagebox.showerror("エラー", "対象の画像ファイルが見つかりません。")
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
        
        self._log(f"🚀 {self.total_images} 枚の画像の処理を開始します...")
        
        self.processing_thread = threading.Thread(target=self._process_images, daemon=True)
        self.processing_thread.start()
        
    def _toggle_pause(self):
        if self.is_paused:
            self.is_paused = False
            self.pause_btn.configure(text="⏸ 一時停止", bg=COLORS['warning'])
            self._log("▶️ 再開しました")
        else:
            self.is_paused = True
            self.pause_btn.configure(text="▶️ 再開", bg=COLORS['success'])
            self._log("⏸️ 一時停止しました")
            
    def _reset_processing(self):
        self.is_running = False
        self.is_paused = False
        self.current_image_index = 0
        self.total_images = 0
        
        self.start_btn.configure(state='normal')
        self.pause_btn.configure(state='disabled', text="⏸ 一時停止", bg=COLORS['warning'])
        
        self.progress_var.set(0)
        self.progress_text_var.set("0/0")
        self.status_var.set("待機中")
        self.status_label.config(fg=COLORS['fg_bright'])
        
        self._log("🔄 リセット完了")
        
    def _validate_inputs(self) -> bool:
        if not self.api_key_var.get().strip():
            messagebox.showerror("エラー", "APIキーは必須です")
            return False
        if not self.input_folder_var.get():
            messagebox.showerror("エラー", "入力フォルダは必須です")
            return False
        if not self.output_folder_var.get():
            messagebox.showerror("エラー", "出力フォルダは必須です")
            return False
        if not self.api:
            api_key = self.api_key_var.get().strip()
            self.api = GeminiAPI(api_key, self.model_var.get())
                
        return True
        
    # ============================================================
    # 処理ロジック (Logic Inherited, Style Updated)
    # ============================================================
    def _process_images(self):
        output_folder = Path(self.output_folder_var.get())
        interval = self.interval_var.get()
        
        for idx, image_path in enumerate(self.image_files):
            if not self.is_running: break
                
            while self.is_paused and self.is_running:
                self._update_status("⏸️ 一時停止中", COLORS['fg_secondary'])
                time.sleep(0.5)
                
            if not self.is_running: break
                
            self.current_image_index = idx + 1
            self._update_progress()
            self._update_status(f"📷 解析中 {self.current_image_index}/{self.total_images}...", COLORS['accent'])
            
            result = self._analyze_image_with_retry(image_path)
            
            if result:
                self._move_image(image_path, output_folder, result)
                cat = result.get("category", "Skip")
                score = result.get("score", 0)
                reason = result.get("reason", "")
                emoji = {"Best": "⭐", "Good": "✅", "Skip": "⚠️"}.get(cat, "❓")
                self._log(f"{emoji} {image_path.name} → {cat} ({score}) : {reason}")
            else:
                self._move_image(image_path, output_folder, {"category": "Skip"})
                self._log(f"❓ {image_path.name} → Skip (失敗)")
                
            if idx < len(self.image_files) - 1:
                self._wait_with_countdown(interval, "⏳ 待機中")
                
        self._update_status("✅ 完了", COLORS['success'])
        self._log(f"🎉 {self.total_images} 枚の画像処理が完了しました。")
        self.root.after(0, self._on_processing_complete)
        
    def _analyze_image_with_retry(self, image_path: Path) -> Optional[dict]:
        max_retries = 3
        for attempt in range(max_retries):
            try:
                return self._analyze_image(image_path)
            except RateLimitError:
                wait_time = 60 * (2 ** attempt)
                self._log(f"⚠️ レート制限 (429)。 {wait_time}秒 待機します...")
                self._wait_with_countdown(wait_time, "⚠️ レート制限 待機中")
            except InvalidRequestError as e:
                err = str(e)
                if "API_KEY_INVALID" in err or "API key not valid" in err:
                    self._log(f"🔑 無効なAPIキーです。")
                    self._update_status("❌ 無効なAPIキー", COLORS['error'])
                    self.is_running = False
                    self.root.after(0, lambda: messagebox.showerror("キーエラー", "無効なAPIキーです。"))
                    return None
                self._log(f"❌ 不正なリクエスト: {err[:50]}...")
                return None
            except Exception as e:
                self._log(f"❌ エラー: {str(e)}")
                if attempt < max_retries-1:
                    wait_time = 30 * (attempt + 1)
                    self._wait_with_countdown(wait_time, "🔄 リトライ中")
                else:
                    return None
        return None
        
    def _analyze_image(self, image_path: Path) -> Optional[dict]:
        prompt = f"この写真を評価してください。ファイル名: {image_path.name}\nJSON形式で回答してください。"
        response = self.api.generate_content(prompt, image_path)
        text = response.strip()
        if text.startswith("```"):
            lines = text.split("\n")
            json_lines = []
            in_json = False
            for line in lines:
                if line.startswith("```json") or line.startswith("```"):
                    in_json = not in_json
                    continue
                if in_json: json_lines.append(line)
            if json_lines: text = "\n".join(json_lines)
            
        try:
            start = text.find('{')
            end = text.rfind('}') + 1
            if start != -1 and end != -1:
                return json.loads(text[start:end])
        except json.JSONDecodeError:
            self._log(f"⚠️ JSON解析失敗: {text[:100]}...")
            pass
        return None

    def _wait_with_countdown(self, seconds: int, reason: str):
        for i in range(seconds, 0, -1):
            if not self.is_running: break
            while self.is_paused and self.is_running:
                self._update_status("⏸️ 一時停止中", COLORS['fg_secondary'])
                time.sleep(0.5)
            self._update_status(f"{reason}: {i}秒", COLORS['warning'])
            time.sleep(1)

    def _move_image(self, src: Path, base_dst: Path, result: dict):
        cat = result.get("category", "Skip")
        if cat not in ["Best", "Good", "Skip"]: cat = "Skip"
        dst_folder = base_dst / cat
        dst_path = dst_folder / src.name
        
        counter = 1
        while dst_path.exists():
            dst_path = dst_folder / f"{src.stem}_{counter}{src.suffix}"
            counter += 1
            
        try:
            self._copy_with_exif(src, dst_path)
        except Exception as e:
            self._log(f"❌ 移動エラー: {e}")

    def _copy_with_exif(self, src: Path, dst: Path):
        try:
            img = Image.open(src)
            exif = img.info.get('exif')
            if exif: img.save(dst, exif=exif)
            else: shutil.copy2(src, dst)
        except Exception:
            shutil.copy2(src, dst)

    def _on_processing_complete(self):
        self.is_running = False
        self.start_btn.configure(state='normal')
        self.pause_btn.configure(state='disabled')
        messagebox.showinfo("完了", "処理が完了しました！")

    def _update_status(self, text: str, color: str = None):
        def update():
            self.status_var.set(text)
            self.status_label.config(fg=color if color else COLORS['fg_bright'])
        self.root.after(0, update)
        
    def _update_progress(self):
        p = (self.current_image_index / self.total_images * 100) if self.total_images > 0 else 0
        def update():
            self.progress_var.set(p)
            self.progress_text_var.set(f"{self.current_image_index}/{self.total_images}")
        self.root.after(0, update)
        
    def _log(self, message: str):
        ts = datetime.now().strftime("%H:%M:%S")
        def update():
            self.log_text.insert(tk.END, f"[{ts}] {message}\n")
            self.log_text.see(tk.END)
        self.root.after(0, update)

# ============================================================
# メイン実行
# ============================================================
if __name__ == "__main__":
    if sys.platform == "darwin":
        os.system('''/usr/bin/osascript -e 'tell app "Finder" to set frontmost of process "Python" to true' ''')
    
    root = tk.Tk()
    app = PhotoSorterApp(root)
    root.mainloop()
