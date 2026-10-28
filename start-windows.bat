@echo off
cd /d "%~dp0"
echo Starting MAS-DED Inventory Pro...
docker compose up -d --build
if errorlevel 1 pause
start http://localhost:3000
