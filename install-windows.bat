@echo off
REM ============================================================================
REM install-windows.bat - ติดตั้งฟอนต์ไทยทั้งหมดในโฟลเดอร์นี้ (Windows)
REM   - ติดตั้งเป็นผู้ใช้ปัจจุบัน ไม่ต้องการสิทธิ์ราก (ไม่มี UAC ขึ้น)
REM   - คัดลอกไฟล์ .ttf ไปยังโฟลเดอร์ Fonts ของผู้ใช้
REM   - รองรับชื่อไฟล์ที่มีช่องว่ายะและอักขระพิเศษ (@ # ~ ฯลฯ)
REM
REM วิธีใช้:
REM   - ดับเปิลคลิก  install-windows.bat
REM   - หรือเปิด "หน้าต่างคำสั่ง (Command Prompt)" แล้วพิมพ์ install-windows.bat
REM
REM หมายเหตุ: การติดตั้งแบบระบบทั้งหมด (ทุกผู้ใช้) ต้องการสิทธิ์ผู้ดูแล
REM   ให้คัดลอกไฟล์ไปที่ %WINDIR%\Fonts แทน (ต้องเปิดด้วยสิทธิ์ราก)
REM ============================================================================
setlocal enabledelayedexpansion

REM โฟลเดอร์ต้นทาง = ไดเรกทอรีที่มี batch นี้อยู่
set "SRC=%~dp0"

REM โฟลเดอร์ปลายทาง (ฟอนต์ของผู้ใช้ปัจจุบัน — ไม่ต้องการ admin)
set "DST=%LOCALAPPDATA%\Microsoft\Windows\Fonts"
if not exist "%DST%" mkdir "%DST%"

echo Source : %SRC%
echo Target : %DST%
echo.
echo กำลังติดตั้งฟอนต์ไทย...

set /a n=0
set /a fail=0

REM ใช้ dir /B /A-D ซึ่งจับคู่ชื่อ .ttf และ .TTF ได้อัตโนมัติ (ไม่สนใจตัวพิมพ์)
for /f "delims=" %%F in ('dir /B /A-D "%SRC%*.ttf" 2^>nul') do (
    copy /Y "%%F" "%DST%\" >nul 2>&1
    if errorlevel 1 (
        set /a fail+=1
    ) else (
        set /a n+=1
    )
)

echo.
echo สรุปผล:
echo   ติดตั้งสำเร็จ : !n!  ไฟล์
echo   ล้มเหลว       : !fail!  ไฟล์
if !n! GTR 0 (
    echo.
    echo อาจต้องเปิดรีเฟรชหน้าต่าง Fonts หรือรีสตาร์ทโปรแกรม
    echo เปิดโฟลเดอร์ Fonts ของคุณ:  explorer "%DST%"
)
endlocal
