@echo off
rem Bam dup file nay de mo phim tri an chi Tra
start "" "http://localhost:8765/tri-an-chi-tra/phim.html"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0mo-trang.ps1"
