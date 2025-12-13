#!/usr/bin/env bash

# ===============================
#  Simple IDM-like Downloader
#  Backend : aria2
# ===============================

clear

cat << "EOF"
  ____                  _           _       
 |  _ \ ___  _ __   ___| |__   ___ | |_ ___ 
 | |_) / _ \| '_ \ / __| '_ \ / _ \| __/ _ \
 |  __/ (_) | |_) | (__| | | | (_) | ||  __/
 |_|   \___/| .__/ \___|_| |_|\___/ \__\___|
             |_|                            
        Simple Download Tool (aria2)
EOF

echo
echo "📥 Paste download URL (CTRL+SHIFT+V):"
read -r URL

if [[ -z "$URL" ]]; then
  echo "❌ URL kosong!"
  exit 1
fi

echo
echo "📂 Download will start..."
echo "────────────────────────────────"

aria2c \
  -c \
  -x 4 \
  -s 4 \
  -k 1M \
  --file-allocation=trunc \
  --summary-interval=1 \
  --auto-file-renaming=false \
  --console-log-level=warn \
  "$URL"

STATUS=$?

echo "────────────────────────────────"

if [[ $STATUS -eq 0 ]]; then
  echo "✅ Download selesai!"
else
  echo "⚠️ Download terhenti / gagal"
  echo "👉 Jalankan ulang script ini untuk resume"
fi
