@echo off
chcp 65001 >nul
setlocal

echo.
echo ==========================================
echo   Публикация новой версии на GitHub
echo ==========================================

REM Читаем версию из pubspec.yaml
for /f "tokens=2 delims=: " %%a in ('findstr /r "^version:" pubspec.yaml') do set VERSION_FULL=%%a
for /f "tokens=1 delims=+" %%a in ("%VERSION_FULL%") do set VERSION=%%a

echo   Версия: %VERSION%
echo.

REM Проверяем что все изменения закоммичены
git diff --quiet
if errorlevel 1 (
    echo [!] Есть незакоммиченные изменения. Сначала сделай git add + git commit.
    pause
    exit /b 1
)

echo [1/3] Создаём тег v%VERSION%...
git tag -a v%VERSION% -m "Release v%VERSION%"

echo [2/3] Пушим код на GitHub...
git push origin main

echo [3/3] Пушим тег — запустит GitHub Actions...
git push origin v%VERSION%

echo.
echo ==========================================
echo   ГОТОВО! GitHub Actions собирает APK.
echo   Следи за прогрессом на:
echo   https://github.com/dakerhel/template-basic/actions
echo ==========================================
echo.
pause
