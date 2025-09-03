#!/bin/bash
# ============================================
#   Universal Sosmed Downloader Pro (v7)
#        by YT-DLP + FFMPEG
#   Support: IG, TikTok, YouTube (short/long)
#   Opsi: Pilih kualitas manual
# ============================================

banner() {
cat << "EOF"
                                     __       
|  \                |  \                |  \      
| $$      ____  | $$      ____  | $$   __ 
| $$  /  \ /      \ | $$  /  \ /      \ | $$  /  \
| $$_/  $$|  $$$$$$\| $$_/  $$|  $$$$$$\| $$_/  $$
| $$   $$ | $$  | $$| $$   $$ | $$  | $$| $$   $$ 
| $$$$$$\ | $$__/ $$| $$$$$$\ | $$__/ $$| $$$$$$\ 
| $$  \$$\ \$$    $$| $$  \$$\ \$$    $$| $$  \$$\
 \$$   \$$  \$$$$$$  \$$   \$$  \$$$$$$  \$$   \$$
                                                  
          🚀 IG, YT, TikTok, Sosmed Downloader Tool
EOF
}

banner
read -p "👉 Masukkan link video: " URL

# === Pilih User-Agent Random ===
USER_AGENTS=(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0 Safari/537.36"
  "Mozilla/5.0 (X11; Linux x86_64; rv:117.0) Gecko/20100101 Firefox/117.0"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Safari/605.1.15"
  "Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0 Mobile Safari/537.36"
  "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Edge/18.18362"
)
RANDOM_UA=${USER_AGENTS[$RANDOM % ${#USER_AGENTS[@]}]}

echo -e "\n[INFO] User-Agent dipakai:"
echo "$RANDOM_UA"
echo

# === Deteksi platform ===
if [[ "$URL" == *"instagram.com"* ]]; then
    PLATFORM="IG"
elif [[ "$URL" == *"tiktok.com"* ]]; then
    PLATFORM="TikTok"
elif [[ "$URL" == *"youtube.com"* || "$URL" == *"youtu.be"* ]]; then
    PLATFORM="YouTube"
else
    PLATFORM="Others"
fi

mkdir -p "$PLATFORM"

# === Ambil data video ===
RAW_TITLE=$(yt-dlp --user-agent "$RANDOM_UA" --get-title "$URL" | head -n1)
VIDEO_ID=$(yt-dlp --user-agent "$RANDOM_UA" --get-id "$URL" | head -n1)

# Short hash dari URL (8 karakter) -> cegah tabrakan
URL_HASH=$(echo -n "$URL" | md5sum | cut -c1-8)

# Bersihkan judul dari karakter aneh/spasi
SAFE_TITLE=$(echo "$RAW_TITLE" | tr -cd '[:alnum:]_- ' | tr ' ' '_')

# Nama file unik (judul + ID + hash pendek)
ORI_FILE="$PLATFORM/${SAFE_TITLE}_${VIDEO_ID}_${URL_HASH}-ori.%(ext)s"
FINAL_FILE="$PLATFORM/${SAFE_TITLE}_${VIDEO_ID}_${URL_HASH}-final.mp4"

# === Pilih kualitas manual ===
echo -e "\nPilih kualitas video:"
echo "1. 720p"
echo "2. 1080p"
echo "3. Maksimal (hingga 4K)"
echo "4. Auto (bestvideo+bestaudio)"
read -p "👉 Pilihan (1/2/3/4): " CHOICE

case $CHOICE in
  1) BEST_FORMAT="bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best" ;;
  2) BEST_FORMAT="bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best" ;;
  3) BEST_FORMAT="bestvideo[height<=2160][ext=mp4]+bestaudio[ext=m4a]/best" ;;
  4) BEST_FORMAT="bv*+ba/b" ;;
  *) BEST_FORMAT="bestvideo+bestaudio/best" ;;
esac

echo -e "\n[1] Download video kualitas sesuai pilihan..."
yt-dlp --user-agent "$RANDOM_UA" -f "$BEST_FORMAT" -o "$ORI_FILE" "$URL" -q --progress --no-playlist

# Cari file hasil download (ext bisa berubah-ubah)
DOWNLOADED=$(ls -t "$PLATFORM/${SAFE_TITLE}_${VIDEO_ID}_${URL_HASH}-ori."* | head -n1)

echo -e "\n[2] Convert agar siap sosmed..."
ffmpeg -i "$DOWNLOADED" -vf "scale=1080:-2" \
  -c:v libx264 -preset fast -profile:v high -level 4.1 \
  -pix_fmt yuv420p -c:a aac -b:a 128k -movflags +faststart \
  "$FINAL_FILE" -y

echo -e "\n✅ Selesai!"
echo -e "📂 Folder : $PLATFORM/"
echo -e "   Ori   : $DOWNLOADED"
echo -e "   Final : $FINAL_FILE"

