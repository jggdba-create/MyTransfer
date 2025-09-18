# 🏗️ Arquitectura de MyTransfer

## 📋 Resumen

MyTransfer es una aplicación web P2P que permite la transferencia de archivos y texto entre dispositivos usando WebRTC para comunicación directa y WebSocket solo para señalización inicial.

## 🔄 Flujo de la aplicación

### 1. Inicialización
```
Usuario PC → Abre aplicación → Crea sesión → Genera QR
Usuario Móvil → Abre aplicación → Escanea QR → Se conecta
```

### 2. Señalización WebSocket
```
PC (Host) ←→ Servidor Render.com ←→ Móvil (Cliente)
     ↓              ↓                    ↓
  Crea sesión   Almacena ID         Se une a sesión
  Genera QR     Relaya mensajes     Recibe confirmación
```

### 3. Conexión WebRTC P2P
```
PC (Host) ←→ Conexión directa ←→ Móvil (Cliente)
     ↓                              ↓
  Crea oferta                   Recibe oferta
  Envía respuesta               Envía respuesta
  Establece P2P                 Establece P2P
```

### 4. Transferencia de datos
```
PC ←→ DataChannel (Mensajes) ←→ Móvil
PC ←→ DataChannel (Archivos) ←→ Móvil
```

## 🏛️ Componentes principales

### Frontend (`/client`)
- **index.html**: Interfaz de usuario principal
- **styles.css**: Estilos responsive y animaciones
- **app.js**: Lógica WebRTC, manejo de archivos y UI

### Backend (`/server`)
- **index.js**: Servidor WebSocket para señalización
- **package.json**: Dependencias del servidor

### Configuración
- **render.yaml**: Configuración de despliegue en Render.com
- **netlify.toml**: Configuración para hosting del frontend
- **package.json**: Configuración del proyecto principal

## 🔧 Tecnologías utilizadas

### Frontend
- **HTML5**: Estructura semántica y accesible
- **CSS3**: Diseño responsive con Flexbox/Grid
- **JavaScript ES6+**: Lógica de aplicación y WebRTC
- **QRCode.js**: Generación de códigos QR
- **WebRTC API**: Comunicación P2P nativa

### Backend
- **Node.js**: Runtime de JavaScript
- **WebSocket (ws)**: Comunicación en tiempo real
- **Express.js**: Servidor HTTP básico
- **UUID**: Generación de identificadores únicos

### Hosting
- **Render.com**: Servidor de señalización (gratuito)
- **Netlify/Vercel**: Frontend estático (opcional)

## 🔐 Seguridad y privacidad

### Comunicación segura
- **WSS**: WebSocket seguro en producción
- **HTTPS**: Frontend servido sobre HTTPS
- **STUN/TURN**: Servidores públicos de Google

### Privacidad de datos
- **P2P directo**: Archivos nunca pasan por el servidor
- **Sin almacenamiento**: No se guardan archivos en el servidor
- **Limpieza automática**: Sesiones se eliminan después de 1 hora
- **Validación local**: Límites de archivo verificados en cliente

## 📊 Flujo de datos

### Creación de sesión
1. PC envía `create-session` al servidor
2. Servidor genera UUID único
3. Servidor responde con `session-created`
4. PC genera QR con el ID de sesión

### Unión a sesión
1. Móvil envía `join-session` con ID
2. Servidor valida ID y asigna cliente
3. Servidor notifica a ambos: `peer-connected`
4. Ambos inician proceso WebRTC

### Establecimiento WebRTC
1. Host crea `RTCPeerConnection`
2. Host crea `DataChannel` para mensajes y archivos
3. Host genera oferta SDP
4. Cliente recibe oferta y genera respuesta
5. Intercambio de ICE candidates
6. Conexión P2P establecida

### Transferencia de archivos
1. Usuario selecciona archivo (máx. 50MB)
2. Archivo se divide en chunks de 64KB
3. Se envían metadatos: `file-start`
4. Se envían chunks: `file-chunk`
5. Se envía señal de fin: `file-end`
6. Receptor reconstruye archivo y descarga

## 🚀 Optimizaciones

### Rendimiento
- **Chunks de 64KB**: Balance entre velocidad y memoria
- **DataChannel no ordenado**: Archivos pueden llegar desordenados
- **Limpieza automática**: Sesiones inactivas se eliminan
- **Compresión**: Archivos se envían como base64

### UX/UI
- **Responsive design**: Funciona en móviles y escritorio
- **Drag & drop**: Interfaz intuitiva para archivos
- **Progreso visual**: Barras de progreso para transferencias
- **Notificaciones**: Feedback inmediato al usuario

### Escalabilidad
- **Servidor stateless**: No mantiene estado entre requests
- **Límite de sesiones**: Máximo 1000 sesiones simultáneas
- **Timeouts**: Sesiones expiran automáticamente
- **Heartbeat**: Conexiones inactivas se detectan

## 🔄 Estados de la aplicación

### Estados del frontend
1. **Initial**: Pantalla de inicio
2. **CreateSession**: Mostrando QR para escanear
3. **JoinSession**: Formulario para unirse
4. **Connected**: Chat y transferencia activos
5. **Error**: Manejo de errores

### Estados del servidor
1. **Listening**: Esperando conexiones
2. **SessionActive**: Sesión con 1 o 2 clientes
3. **Cleaning**: Limpiando sesiones expiradas

## 📱 Compatibilidad

### Navegadores soportados
- **Chrome/Chromium**: 60+
- **Firefox**: 55+
- **Safari**: 11+
- **Edge**: 79+

### Dispositivos
- **Desktop**: Windows, macOS, Linux
- **Mobile**: iOS, Android
- **Tablets**: iPad, Android tablets

## 🛠️ Mantenimiento

### Logs del servidor
- Conexiones WebSocket
- Creación/eliminación de sesiones
- Errores de WebRTC
- Limpieza automática

### Monitoreo
- Health check endpoint: `/health`
- Métricas de sesiones activas
- Estadísticas de clientes conectados

---

**Esta arquitectura garantiza una experiencia segura, rápida y privada para la transferencia de archivos entre dispositivos.**
