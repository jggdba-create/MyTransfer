#!/bin/bash

echo "Iniciando MyTransfer en modo desarrollo..."
echo

echo "Instalando dependencias del servidor..."
cd server
npm install
if [ $? -ne 0 ]; then
    echo "Error instalando dependencias del servidor"
    exit 1
fi

echo
echo "Iniciando servidor de desarrollo..."
echo "El servidor estará disponible en: http://localhost:3000"
echo
echo "Para detener el servidor, presiona Ctrl+C"
echo

npm run dev
