@echo off
rem Bam dup file nay (hoac shortcut "Gui Chi Tra" tren Desktop) de mo phim
rem May chu chay trong cua so thu nho; dong cua so do de tat
start "Gui Chi Tra - may chu (dong de tat)" /min powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0mo-trang.ps1"
timeout /t 2 /nobreak >nul
start "" "http://localhost:8765/tri-an-chi-tra/phim.html"
