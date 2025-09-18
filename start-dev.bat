@echo off
echo Iniciando MyTransfer en modo desarrollo...
echo.

echo Instalando dependencias del servidor...
cd server
call npm install
if %errorlevel% neq 0 (
    echo Error instalando dependencias del servidor
    pause
    exit /b 1
)

echo.
echo Iniciando servidor de desarrollo...
echo El servidor estara disponible en: http://localhost:3000
echo.
echo Para detener el servidor, presiona Ctrl+C
echo.

call npm run dev
