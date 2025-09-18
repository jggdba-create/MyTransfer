# 🚀 Guía de Despliegue en Render.com

## 📋 Pasos detallados para desplegar MyTransfer

### **Paso 1: Preparar el repositorio en GitHub**

1. **Crea un nuevo repositorio** en GitHub:
   - Ve a [github.com](https://github.com)
   - Haz clic en "New repository"
   - Nombre: `mytransfer` (o el que prefieras)
   - Marca como **público** (necesario para el plan gratuito de Render)
   - No inicialices con README (ya tenemos uno)

2. **Sube el código**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: MyTransfer app"
   git branch -M main
   git remote add origin https://github.com/TU-USUARIO/mytransfer.git
   git push -u origin main
   ```

### **Paso 2: Crear cuenta en Render.com**

1. **Ve a [render.com](https://render.com)**
2. **Haz clic en "Get Started for Free"**
3. **Regístrate con GitHub** (recomendado):
   - Haz clic en "Continue with GitHub"
   - Autoriza el acceso a tus repositorios
   - Selecciona los repositorios que quieres conectar

### **Paso 3: Crear el WebService**

1. **En el dashboard de Render, haz clic en "New +"**
2. **Selecciona "Web Service"**
3. **Conecta tu repositorio**:
   - Si no aparece, haz clic en "Connect account" y autoriza GitHub
   - Selecciona el repositorio `mytransfer`

### **Paso 4: Configuración del servicio**

Render detectará automáticamente que es Node.js, pero verifica estos campos:

#### **Configuración básica:**
- **Name**: `mytransfer-server`
- **Environment**: `Node`
- **Region**: `Oregon (US West)` (o la más cercana a ti)
- **Branch**: `main`
- **Root Directory**: `server` ⚠️ **MUY IMPORTANTE**
- **Runtime**: `Node` (debería detectarse automáticamente)

#### **Build & Deploy:**
- **Build Command**: `npm install`
- **Start Command**: `npm start`
- **Plan**: `Free`

#### **Variables de entorno:**
Haz clic en "Advanced" y agrega:
- `NODE_ENV` = `production`
- `PORT` = `10000`

### **Paso 5: Desplegar**

1. **Haz clic en "Create Web Service"**
2. **Espera el despliegue** (5-10 minutos):
   - Verás los logs en tiempo real
   - El estado cambiará de "Building" a "Live"
3. **Copia la URL** que te da Render (algo como `https://mytransfer-server.onrender.com`)

### **Paso 6: Actualizar el frontend**

Una vez que tengas la URL del servidor:

1. **Edita el archivo `client/app.js`**
2. **Busca la línea 67** (aproximadamente):
   ```javascript
   wsUrl = 'wss://tu-servidor-render.onrender.com';
   ```
3. **Reemplaza** `tu-servidor-render.onrender.com` con tu URL real de Render
4. **Guarda el archivo**

### **Paso 7: Hosting del frontend**

#### **Opción A: Netlify (Recomendado)**

1. **Ve a [netlify.com](https://netlify.com)**
2. **Regístrate** con GitHub
3. **Haz clic en "New site from Git"**
4. **Selecciona tu repositorio** `mytransfer`
5. **Configuración**:
   - **Base directory**: `client`
   - **Build command**: (dejar vacío)
   - **Publish directory**: `client`
6. **Haz clic en "Deploy site"**

#### **Opción B: Vercel**

1. **Ve a [vercel.com](https://vercel.com)**
2. **Regístrate** con GitHub
3. **Importa tu repositorio**
4. **Configuración**:
   - **Root Directory**: `client`
   - **Framework Preset**: `Other`
5. **Deploy**

#### **Opción C: GitHub Pages**

1. **Ve a la configuración** de tu repositorio en GitHub
2. **Scroll hasta "Pages"**
3. **Source**: `Deploy from a branch`
4. **Branch**: `main` / `client`
5. **Save**

### **Paso 8: Probar la aplicación**

1. **Abre la URL del frontend** (Netlify/Vercel/GitHub Pages)
2. **En una pestaña**: Haz clic en "Crear sesión (PC)"
3. **En otra pestaña/móvil**: Haz clic en "Unirse a sesión (Móvil)"
4. **Escanea el QR** o introduce el ID manualmente
5. **¡Prueba enviar archivos y mensajes!**

## 🔧 **Solución de problemas comunes**

### **Error: "Build failed"**
- Verifica que el **Root Directory** esté configurado como `server`
- Asegúrate de que el archivo `server/package.json` existe
- Revisa los logs de build en Render

### **Error: "WebSocket connection failed"**
- Verifica que la URL en `client/app.js` sea correcta
- Asegúrate de usar `wss://` (no `ws://`) para HTTPS
- Revisa que el servidor esté "Live" en Render

### **Error: "Session not found"**
- Verifica que ambos dispositivos estén usando la misma URL del frontend
- Asegúrate de que el servidor de Render esté funcionando
- Revisa la consola del navegador para errores

### **El servidor se "duerme"**
- Render.com tiene un plan gratuito que "duerme" el servidor después de 15 minutos de inactividad
- El primer request después de dormir puede tardar 30 segundos
- Considera actualizar a un plan de pago si necesitas que esté siempre activo

## 📊 **Monitoreo del servicio**

### **En Render.com:**
- **Dashboard**: Ve el estado del servicio
- **Logs**: Revisa los logs en tiempo real
- **Metrics**: Estadísticas de uso (en planes de pago)

### **Health Check:**
- Visita `https://tu-servidor.onrender.com/health`
- Deberías ver: `{"status":"ok","sessions":0,"clients":0}`

## 🎉 **¡Listo!**

Una vez completados todos los pasos, tendrás:
- ✅ **Backend**: Desplegado en Render.com
- ✅ **Frontend**: Desplegado en Netlify/Vercel/GitHub Pages
- ✅ **Aplicación funcional**: Lista para usar

### **URLs finales:**
- **Backend**: `https://mytransfer-server.onrender.com`
- **Frontend**: `https://mytransfer.netlify.app` (o tu dominio)

---

**¡Disfruta tu aplicación MyTransfer desplegada! 🚀**
