#!/usr/bin/env bash

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

# ===== User Agent Pool =====
USER_AGENTS=(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/122.0 Safari/537.36"
  "Mozilla/5.0 (X11; Linux x86_64) Chrome/121.0 Safari/537.36"
  "Mozilla/5.0 (Macintosh) Safari/605.1.15"
  "Mozilla/5.0 (Windows NT 10.0; rv:122.0) Firefox/122.0"
  "Mozilla/5.0 (X11; Arch Linux x86_64) Chrome/120.0 Safari/537.36"
  "Mozilla/5.0 (Linux; Android 13) Chrome/120.0 Mobile"
  "Mozilla/5.0 (iPhone; CPU iPhone OS 17_2) Safari/604.1"
  "Mozilla/5.0 (iPad; CPU OS 16_6) Safari/604.1"
  "Mozilla/5.0 (Ubuntu; Linux x86_64; rv:121.0) Firefox/121.0"
  "Mozilla/5.0 (Windows NT 11.0) Chrome/123.0 Safari/537.36"
)

UA=${USER_AGENTS[$RANDOM % ${#USER_AGENTS[@]}]}

echo
echo "📥 Paste download URL:"
read -r URL

if [[ -z "$URL" ]]; then
  echo "❌ URL kosong"
  exit 1
fi

if [[ ! -f cookies.txt ]]; then
  echo "❌ cookies.txt TIDAK ADA"
  echo "👉 Export cookies dulu dari browser"
  exit 1
fi

REFERER="https://maxbit.link/"

echo
echo "🧠 UA  : $UA"
echo "🍪 Cookie : cookies.txt"
echo "🔗 Referer: $REFERER"
echo
echo "📂 Download start..."
echo "────────────────────────────────"

aria2c \
  -c \
  -x 2 \
  -s 2 \
  -k 1M \
  --file-allocation=trunc \
  --summary-interval=1 \
  --console-log-level=warn \
  --user-agent="$UA" \
  --load-cookies=cookies.txt \
  --save-cookies=cookies.txt \
  --referer="$REFERER" \
  "$URL"

echo "────────────────────────────────"
echo "✔️ Kalau gagal: cookie expired → export ulang"

