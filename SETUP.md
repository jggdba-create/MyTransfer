# 🚀 Guía de Configuración - MyTransfer

## ⚠️ Solución de problemas comunes

### Error de política de ejecución en Windows

Si encuentras el error:
```
npm : No se puede cargar el archivo C:\Program Files\nodejs\npm.ps1 porque la ejecución de scripts está deshabilitada en este sistema.
```

**Solución 1: Cambiar política de ejecución (Recomendado)**
```powershell
# Abre PowerShell como Administrador y ejecuta:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Solución 2: Usar Command Prompt**
```cmd
# Abre Command Prompt (cmd) en lugar de PowerShell
cd server
npm install
npm start
```

**Solución 3: Usar el script de inicio**
```cmd
# En Command Prompt, ejecuta:
start-dev.bat
```

## 🛠️ Instalación paso a paso

### 1. Prerrequisitos
- Node.js 16+ instalado
- Git (opcional, para clonar el repositorio)

### 2. Instalación local

**Opción A: Usando Command Prompt (Windows)**
```cmd
cd server
npm install
npm start
```

**Opción B: Usando el script de inicio**
```cmd
# Ejecuta el archivo start-dev.bat
start-dev.bat
```

**Opción C: Usando PowerShell (después de cambiar la política)**
```powershell
cd server
npm install
npm start
```

### 3. Verificar instalación
- El servidor debería iniciarse en `http://localhost:3000`
- Abre `client/index.html` en tu navegador
- Deberías ver la interfaz de MyTransfer

## 🌐 Despliegue en producción

### Render.com (Recomendado)

1. **Fork el repositorio** en GitHub
2. **Ve a [Render.com](https://render.com)**
3. **Crea un nuevo Web Service**:
   - Conecta tu repositorio
   - Build Command: `cd server && npm install`
   - Start Command: `cd server && npm start`
   - Environment: `Node`
   - Plan: `Free`

4. **Espera el despliegue** (puede tomar 5-10 minutos)

### Actualizar el frontend

Una vez desplegado, actualiza la URL del WebSocket en `client/app.js`:

```javascript
// Línea 45 aproximadamente, reemplaza:
const wsUrl = 'wss://tu-servidor-render.onrender.com';
```

### Hosting del frontend

**Opción 1: Netlify (Recomendado)**
1. Sube la carpeta `client/` a Netlify
2. El archivo `netlify.toml` ya está configurado

**Opción 2: Vercel**
1. Sube la carpeta `client/` a Vercel
2. No requiere configuración adicional

**Opción 3: GitHub Pages**
1. Sube la carpeta `client/` a un repositorio
2. Habilita GitHub Pages en la configuración

## 🔧 Configuración avanzada

### Variables de entorno

Crea un archivo `.env` en la carpeta `server/` basado en `env.example`:

```env
NODE_ENV=production
PORT=10000
WS_HEARTBEAT_INTERVAL=30000
WS_MAX_SESSIONS=1000
SESSION_TIMEOUT=3600000
CLEANUP_INTERVAL=300000
```

### Personalización

**Cambiar límite de archivos:**
- Edita `client/app.js` línea 200: `if (file.size > 50 * 1024 * 1024)`
- Cambia `50` por el valor deseado en MB

**Cambiar tiempo de sesión:**
- Edita `server/index.js` línea 120: `if (now - session.createdAt > 3600000)`
- Cambia `3600000` por el valor deseado en milisegundos

**Cambiar servidores STUN:**
- Edita `client/app.js` líneas 15-18 en `rtcConfig`

## 🐛 Solución de problemas

### El servidor no inicia
- Verifica que Node.js esté instalado: `node --version`
- Verifica que npm esté instalado: `npm --version`
- Revisa que el puerto 3000 esté libre

### No se puede conectar entre dispositivos
- Ambos dispositivos deben estar en la misma red
- Verifica que el firewall no bloquee las conexiones
- En producción, ambos deben usar HTTPS

### Los archivos no se transfieren
- Verifica que el archivo no exceda 50MB
- Asegúrate de que la conexión P2P esté establecida
- Revisa la consola del navegador para errores

### Error de WebSocket
- Verifica que la URL del servidor sea correcta
- Asegúrate de que el servidor esté desplegado
- Revisa los logs del servidor

## 📞 Soporte

Si tienes problemas:

1. Revisa esta guía
2. Busca en los [Issues de GitHub](https://github.com/yourusername/mytransfer/issues)
3. Crea un nuevo issue con:
   - Sistema operativo
   - Versión de Node.js
   - Mensaje de error completo
   - Pasos para reproducir el problema

---

**¡Disfruta usando MyTransfer! 🚀**
