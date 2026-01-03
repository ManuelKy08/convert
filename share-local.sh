#!/data/data/com.termux/files/usr/bin/bash

PORT=8080

echo "======================================"
echo " 📡 Local File Sharing Server (TERMUX)"
echo "======================================"
echo ""

# --- AUTO IP DETECTION ---
IP=$(getprop dhcp.wlan0.ipaddress 2>/dev/null)

if [ -z "$IP" ]; then
  IP=$(getprop dhcp.eth0.ipaddress 2>/dev/null)
fi

# --- MANUAL FALLBACK ---
if [ -z "$IP" ]; then
  echo "⚠️  IP tidak terdeteksi otomatis"
  read -p "Masukkan IP Wi-Fi HP ini (contoh 192.168.43.1): " IP
fi

URL="http://$IP:$PORT"

echo ""
echo " 🌐 IP Address : $IP"
echo " 🔌 Port       : $PORT"
echo ""
echo " 👉 Buka di device lain:"
echo " $URL"
echo ""
echo " 📂 Folder yang dishare:"
pwd
echo ""

# --- QR CODE VIA PYTHON (PAKSA TAMPIL) ---
echo "📱 QR CODE (scan dari HP lain):"
python - <<EOF
import qrcode
qr = qrcode.QRCode(border=1)
qr.add_data("$URL")
qr.make(fit=True)
qr.print_ascii(invert=True)
EOF

echo ""
echo "======================================"
echo " Tekan CTRL+C untuk stop server"
echo "======================================"
echo ""

python -m http.server $PORT --bind 0.0.0.0
