# Thai Font Collection

[![Fonts: 3015+](https://img.shields.io/badge/fonts-3015+-2360a6)](https://github.com/sirisakboy/thai-font)
[![License: CC0 1.0](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](#ใบอนุญาต)
[![Platform: Linux / Windows](https://img.shields.io/badge/platform-Linux%20%7C%20Windows-orange)]()

สรุปฟอนต์ไทยสไตล์สรรพ์พร้อม **สคริปต์ติดตั้งสั้น ๆ** สำหรับ **Linux** และ **Windows**  
(ดัดแปลงมาจากชุดฟอนต์ไทยขนาดใหญ่ [sirisakboy/thai-font](https://github.com/sirisakboy/thai-font))

> **สริป (concise):** ใช้สคริปต์เดียว 2 คำสั่ง ก็ติดตั้งฟอนต์ทั้งหมดได้ทันที

---

## 📦 สิ่งที่มีอยู่

| ประเภท | จำนวน | ตัวอย่าง |
|---|---|---|
| **รวมทั้งหมด** | **3015 ไฟล์** | `*.ttf` / `*.TTF` |
| ฟอนต์รัฐบัณฑ์ / มาตรฐาน (TH) | ~54 | TH Sarabun, TH Chakra Petch, TH Fahkwang, TH K2D, TH Kodchasal, TH Krub, TH Mali Grade6, TH Niramit AS, TH Srisakdi, TH Baijam, TH Charm of AU, TH Charmonman, TH KoHo |
| ฟอนต์ TX (ออกแบบสคริปต์ไทย) | 31 | TX_banjong, TX_Chaiyo, TX_creamy, TX_Songkran, TX_Thongmuan, … |
| ฟอนต์ SF | 25 | SF Pimpdeed, SF Wasabi, SF Shai Fontai, SF Burlington Script |
| ฟอนต์ PSL | 160 | PSL-01…PSL-85 + ชุดตัวอักษร A/B/C/D/E/I/J/M/P/S/T (พร้อม Bold/Italic) |
| ฟอนต์ DS / Dusit | ~197 | DS-DUSIT, DS-ARKOR, DS-ERAWA, DS-AR___, … |
| ฟอนต์หนังสือการศึกษา ปี 2547/2548/2550 | 30 | 2547_Dinya, 2548_D1N…D6N, 2550-DDINYAMALAAW |
| ฟอนต์ iannnnnn VCD Office (2005/2006) | 23 | 2005_iannnnnAMD…UBC, 2006_iannnnnBKK… |
| ฟอนต์ ZF / Zfont | 36 | ZF#2ndPixelus, ZFXLZQ, ZFVeenus-Condense, … |
| ฟอนต์ Sarun's | 8 | Sarun's Bang_rajan, Famai, Gothic 1/2, HarryPotter, Manorah, … |
| เสริมสร้าง / อื่น ๆ | 2000+ | ฟอนต์ลายมือชาวต่างประเทศ + ชุดอักขระพิเศษ |

ทั้งหมดเป็นไฟล์รูปแบบ **TTF (TrueType)** เท่านับ

---

## 📂 โครงสร้างไฟล์

```
thai-font/
├── 📜 install-linux.sh      # สคริปต์ติดตั้ง Linux  (Bash)
├── 📜 install-windows.bat   # สคริปต์ติดตั้น Windows (Batch)
├── 📜 README.md             # เอกสารนี้
└── *.ttf / *.TTF            # ไฟล์ฟอนต์ทั้งหมด 3015 ไฟล์
```

---

## 🐧 วิธีติดตั้ง — Linux

> ไม่เห็นใจให้ใช้ `sudo` — ติดตั้งเฉพาะผู้ใช้ปัจจุบันเทร่าพอ

### วิธี 1 — ใช้สคริปต์ (แนะนำ)

```bash
chmod +x install-linux.sh
./install-linux.sh
```

สคริปต์จะ:
1. สร้างโฟลเดอร์ `~/.local/share/fonts/thai-font`
2. คัดลอกฟอนต์ทั้งหมดเข้าไป (รองรับชื่อไฟล์ที่มีช่องว่างและสัญลักษณ์พิเศษ)
3. รีเฟรชแคชฟอนต์ด้วย `fc-cache`

### วิธี 2 — ทำเอง (manual)

```bash
mkdir -p ~/.local/share/fonts/thai-font
cp -r *.ttf *.TTF ~/.local/share/fonts/thai-font/
fc-cache -fv ~/.local/share/fonts/thai-font
```

> **ระบบทั้งหมด (ทุกผู้ใช้):** ให้ใช้ `sudo mkdir -p /usr/local/share/fonts/thai-font` และคัดลอกไปที่นั้นแทน
> (ต้องมีสิทธิ์ผู้ดูแลระบบ)

---

## 🪟 วิธีติดตั้ง — Windows

> ติดตั้งเป็นผู้ใช้ปัจจุบัน **ไม่ต้องการรันเป็นผู้ดูแล (UAC)**

### วิธี 1 — ใช้สคริปต์ (แนะนำ)

1. เปิดโฟลเดอร์นี้ใน **ตำแหน่งที่ไม่มีช่องว่ายืดไปนอกเส้นทาง** (เช่น `C:\thai-font`)
2. ดับเปิด (double-click) ที่ `install-windows.bat`  
   หรือเปิด **พร้อมท์คำสั่ง (Command Prompt)** → พิมพ์ `install-windows.bat`

สคริปต์จะคัดลอกฟอนต์ทั้งหมดไปยัง
`{ผู้ใช้}\AppData\Local\Microsoft\Windows\Fonts`
และเปิดโฟลเดอร์ฟอนต์ให้ทางหลังทำงานเสร็จ

### วิธี 2 — ลากและปล่อย (drag-and-drop)

เปิดโฟลเดอร์ฟอนต์ของ Windows:

```
Win + R  →  พิมพ์ Fonts  →  Enter
```

ลากไฟล์ `*.ttf` ทั้งหมดจากโฟลเดอร์นี้ไปในหน้าต่าง Fonts ที่เปิดขึ้น

> **ระบบทั้งหมด (ทุกผู้ใช้):** คัดลอกไฟล์ไปที่ `C:\Windows\Fonts` แล้วรีสตาร์ท PC  
> (ต้องเปิดด้วยสิทธิ์ผู้ดูแลระบบ)

---

## ✅ วิธีตรวจสอบว่าติดตั้งแล้ว

### Linux

```bash
# แสดงรายชื่อฟอนต์ทั้งหมดที่ระบบเห็น
fc-list | grep -i sarabun          # ลองชื่ออื่น เช่น k2d, fahkwang, chakra

# ตรวจสอบว่าเลเบอร์รันของฟอนต์ตรง
fc-match "Sarabun"
fc-match "TH K2D July8"
```

### Windows

- เปิด **การตั้งค่า → การปรับใช้ → แบบอักษร** (Settings → Personalization → Fonts)
- พิมพ์ชื่อฟอนต์ เช่น `Sarabun` หรือ `K2D` ในช่องค้นหา

---

## 🗑️ วิธีถอดการติดตั้ง

| ระบบ | วิธีทำ |
|---|---|
| **Linux** | `rm -rf ~/.local/share/fonts/thai-font && fc-cache -fv` |
| **Windows (ผู้ใช้)** | ลบไฟล์ใน `{ผู้ใช้}\AppData\Local\Microsoft\Windows\Fonts` (หรือเลือกลบจากหน้าต่าง Fonts) แล้วรีเฟรช |

---

## ⚠️ หมายเหตุสำคัญ

- ชุดนี้มี **3015 ฟอนต์** — จำนวนมาก ระบบปฏิบัติการและโปรแกรมบางโปรแกรมอาจช้าลงเมื่อเปิดเลือกฟอนต์ หากต้องการเฉพาะบางฟอนต์ ให้คัดลอกเฉพาะไฟล์ที่ต้องการแทนการใช้สคริปต์
- ชื่อบางไฟล์มีอักขระพิเศษ (`@`, `#`, `~`, ช่องว่าง) — สคริปต์ทั้งสองจัดการกับมันได้
- ไฟล์มีนามสกุลเป็น `.ttf` และ `.TTF` (ตัวใหญ่-เล็ก) — สคริปต์จับคู่ทั้งสองแบบอัตโนมัติ

---

## 🎯 แหล่งอ้างอิง

- ชุดฟอนต์ต้นฉบั้น: [sirisakboy/thai-font](https://github.com/sirisakboy/thai-font)
- ฟอนต์ TH Sarabun / K2D / Fahkwang / Chakra Petch — โครงการรัฐบัณฑ์ไทย (ศูนย์พัฒนาภาษาไทย)
- ฟอนต์ TX / DS — งานออกแบบสคริปต์ไทยเอกชน

---

## ใบอนุญาต

ไฟล์ฟอนต์เฉพาะแต่ละไฟล์มีใบอนุญาตของเจ้าของสิทธิ์เอง สคริปต์และเอกสารในพื้นโครงการนี้อยู่ภายใต้ขอบเขตสาธารณะ (Public Domain / CC0) เพื่อให้ผู้ใช้ทั่วไปได้ติดตั้งและใช้งานได้อย่างสะดวก
