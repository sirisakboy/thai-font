#!/usr/bin/env bash
#
# install-linux.sh — ติดตั้งฟอนต์ไทยทั้งหมดในโฟลเดอร์นี้ (Linux / *BSD)
#   - ไม่ต้องการสิทธิ์ราก (root) เหนือผู้ใช้ปัจจุบัน
#   - คัดลอกไฟล์ไปยัง ~/.local/share/fonts/thai-font
#   - รีเฟรชแคชฟอนต์ด้วย fc-cache (fontconfig)
#
# วิธีใช้:
#   chmod +x install-linux.sh
#   ./install-linux.sh
#
# สำหรับการติดตั้งระบบทั้งหมด (ทุกผู้ใช้) ให้ใช้ sudo และยกเลิกบรรทัด FONT_DIR ด้านล่าง
set -euo pipefail

# โฟลเดอร์ต้นทาง = ไดเรกทอรีที่มีสคริปต์อยู่ (ไม่ใช่ PWD)
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# โฟลเดอร์ปลายทาง (รองรับ XDG ด้วย)
FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share/fonts}/thai-font"
# --- ถอนการคอมเมนต์บรรทัดต่อไปหากต้องการติดตั้งแบบระบบทั้งหมด (ต้องการ sudo) ---
# FONT_DIR="/usr/local/share/fonts/thai-font"

mkdir -p "$FONT_DIR"

echo "Source : $SRC_DIR"
echo "Target : $FONT_DIR"

# คัดลอกฟอนต์ทุกไฟล์ .ttf (ตัวอักษรเล็ก-ใหญ์ ให้จับคู่กัน)
# ใช้ find + -print0/-d เพื่อรองรับชื่อไฟล์ที่มีช่องว่างและอักขระพิเศษ (@ # ~ ฯลฯ)
count=0
while IFS= read -r -d '' f; do
    cp -f -- "$f" "$FONT_DIR/"
    count=$((count + 1))
done < <(find "$SRC_DIR" -maxdepth 1 -type f -iname '*.ttf' -print0 | sort -z)

if [ "$count" -eq 0 ]; then
    echo "⚠ ไม่พบไฟล์ .ttf ใน $SRC_DIR" >&2
    exit 1
fi
echo "✅ คัดลอกแล้ว $count ไฟล์ฟอนต์"

# รีเฟรชแคชฟอนต์ (fontconfig)
if command -v fc-cache >/dev/null 2>&1; then
    echo "กำลังรีเฟรชแคชฟอนต์ (fc-cache)..."
    fc-cache -f "$FONT_DIR" >/dev/null
    echo "✅ ติดตั้งฟอนต์และรีเฟรชแคชเรียบร้อยแล้ว"
else
    echo "⚠ ไม่มี fc-cache — ติดตั้ง fontconfig เพื่อรีเฟรชแคช" >&2
    echo "   Debian/Ubuntu : sudo apt install fontconfig" >&2
    echo "   Fedora/RHEL   : sudo dnf install fontconfig" >&2
    echo "   Arch          : sudo pacman -S fontconfig" >&2
fi

# แนะนำว่าตรวจสอบอย่างไร
echo "ตรวจสอบได้ด้วย:  fc-list | grep -i sarabun   (หรือชื่ออื่น)"
echo "จับคู่ฟอนต์    :  fc-match \"Sarabun\""
