# 📱 MyTransfer

Una aplicación web similar a Snapdrop que permite transferir texto y archivos entre una PC y un móvil sin necesidad de instalación ni configuración, usando tecnología WebRTC para la comunicación peer-to-peer.

## ✨ Características

- 🔗 **Conexión P2P**: Comunicación directa entre dispositivos usando WebRTC
- 📱 **Sin instalación**: Funciona directamente desde el navegador
- 🔐 **Privacidad**: Los archivos se transfieren directamente entre dispositivos
- 📊 **Transferencia de archivos**: Hasta 50 MB por archivo
- 💬 **Chat de texto**: Envío de mensajes en tiempo real
- 📱 **Responsive**: Optimizado para móviles y escritorio
- 🚀 **Despliegue automático**: Configurado para Render.com

## 🚀 Despliegue Rápido en Render.com

### Opción 1: Despliegue con un clic

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/yourusername/mytransfer)

> **Nota**: Reemplaza `yourusername` con tu nombre de usuario de GitHub en el botón de arriba.

### Opción 2: Despliegue manual

1. **Fork este repositorio** en tu cuenta de GitHub
2. **Ve a [Render.com](https://render.com)** y crea una cuenta
3. **Crea un nuevo Web Service**:
   - Conecta tu repositorio de GitHub
   - Selecciona este proyecto
   - Configuración automática:
     - **Build Command**: `cd server && npm install`
     - **Start Command**: `cd server && npm start`
     - **Environment**: `Node`
     - **Plan**: `Free`

4. **Haz clic en "Deploy"** y espera a que se complete

## 🔧 Configuración del Frontend

Una vez desplegado el servidor, necesitas actualizar la URL del WebSocket en el frontend:

### Para uso local:
1. Abre `client/index.html` en tu navegador
2. El código detectará automáticamente la URL del servidor

### Para uso en producción:
1. Sube la carpeta `client/` a cualquier servicio de hosting estático:
   - [Netlify](https://netlify.com) (recomendado)
   - [Vercel](https://vercel.com)
   - [GitHub Pages](https://pages.github.com)
   - [Firebase Hosting](https://firebase.google.com/products/hosting)

2. **Actualiza la URL del WebSocket** en `client/app.js`:
   ```javascript
   // Línea 45 aproximadamente
   const wsUrl = 'wss://tu-servidor-render.onrender.com';
   ```

## 📖 Cómo usar

### En la PC (Host):
1. Abre la aplicación en tu navegador
2. Haz clic en **"Crear sesión (PC)"**
3. Escanea el código QR con tu móvil
4. ¡Ya puedes enviar archivos y mensajes!

### En el móvil (Cliente):
1. Abre la aplicación en tu navegador móvil
2. Haz clic en **"Unirse a sesión (Móvil)"**
3. Escanea el código QR o introduce el ID de sesión manualmente
4. ¡Ya puedes recibir archivos y enviar mensajes!

## 🛠️ Desarrollo local

### Prerrequisitos
- Node.js 16+ 
- NPM o Yarn

### Instalación
```bash
# Clonar el repositorio
git clone https://github.com/yourusername/mytransfer.git
cd mytransfer

# Instalar dependencias del servidor
npm run install-server

# Iniciar el servidor de desarrollo
npm run dev
```

### Estructura del proyecto
```
MyTransfer/
├── client/                 # Frontend (HTML, CSS, JS)
│   ├── index.html         # Página principal
│   ├── styles.css         # Estilos
│   └── app.js            # Lógica WebRTC y UI
├── server/                # Backend (Node.js)
│   ├── index.js          # Servidor WebSocket
│   └── package.json      # Dependencias del servidor
├── render.yaml           # Configuración de Render.com
├── package.json          # Dependencias principales
└── README.md            # Este archivo
```

## 🔧 Tecnologías utilizadas

### Frontend
- **HTML5**: Estructura semántica
- **CSS3**: Diseño responsive y animaciones
- **JavaScript ES6+**: Lógica de la aplicación
- **WebRTC**: Comunicación peer-to-peer
- **QRCode.js**: Generación de códigos QR

### Backend
- **Node.js**: Runtime de JavaScript
- **WebSocket (ws)**: Señalización WebRTC
- **Express.js**: Servidor HTTP
- **UUID**: Generación de IDs únicos

### Hosting
- **Render.com**: Servidor de señalización
- **Netlify/Vercel**: Frontend estático (opcional)

## 🔒 Seguridad y privacidad

- ✅ **Comunicación P2P**: Los archivos nunca pasan por el servidor
- ✅ **Sin almacenamiento**: No se guardan archivos en el servidor
- ✅ **Conexiones seguras**: WebSocket seguro (WSS) en producción
- ✅ **Limpieza automática**: Las sesiones se eliminan después de 1 hora
- ✅ **Validación de archivos**: Límite de 50MB por archivo

## 🐛 Solución de problemas

### El código QR no se genera
- Verifica que tengas conexión a internet
- Asegúrate de que el servidor esté funcionando
- Revisa la consola del navegador para errores

### No se puede conectar entre dispositivos
- Ambos dispositivos deben estar en la misma red o tener acceso a internet
- Verifica que el firewall no bloquee las conexiones WebRTC
- Asegúrate de que ambos dispositivos usen HTTPS (en producción)

### Los archivos no se transfieren
- Verifica que el archivo no exceda 50MB
- Asegúrate de que la conexión P2P esté establecida
- Revisa que ambos dispositivos tengan suficiente espacio de almacenamiento

### Error de WebSocket
- Verifica que la URL del servidor sea correcta
- Asegúrate de que el servidor esté desplegado y funcionando
- Revisa los logs del servidor en Render.com

## 📝 Límites y restricciones

- **Tamaño máximo de archivo**: 50 MB
- **Tiempo de sesión**: 1 hora (se limpia automáticamente)
- **Dispositivos por sesión**: 2 (PC + Móvil)
- **Tipos de archivo**: Cualquiera (sin restricciones)

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 🙏 Agradecimientos

- Inspirado en [Snapdrop](https://snapdrop.net/)
- Códigos QR generados con [QRCode.js](https://github.com/davidshimjs/qrcodejs)
- WebRTC implementado con la API nativa del navegador
- Hosting gratuito proporcionado por [Render.com](https://render.com)

## 📞 Soporte

Si tienes problemas o preguntas:

1. Revisa la sección de [Solución de problemas](#-solución-de-problemas)
2. Busca en los [Issues](https://github.com/yourusername/mytransfer/issues) existentes
3. Crea un nuevo issue si no encuentras la solución

---

**¡Disfruta transfiriendo archivos de forma segura y privada! 🚀**
