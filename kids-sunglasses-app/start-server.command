#!/bin/bash
cd "$(dirname "$0")"
echo "========================================"
echo "Kids Sunglasses App - ローカルサーバー起動"
echo "========================================"
echo ""
echo "サーバーを起動中..."
echo "ブラウザで http://localhost:8000 を開いてください"
echo ""
echo "終了するには Ctrl+C を押してください"
echo ""
open "http://localhost:8000"
python3 -m http.server 8000
