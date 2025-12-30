#!/bin/bash
cd "$(dirname "$0")"
source venv/bin/activate
python src/photo_selector_gui.py
