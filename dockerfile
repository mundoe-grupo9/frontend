# Dockerfile para frontend

# Usa una imagen oficial de Node.js
# FROM node:18-alpine
FROM node

# Establece el directorio de trabajo
WORKDIR /app

# Copia el package.json y package-lock.json
COPY package*.json .

# Instala las dependencias de la aplicación, incluyendo PM2
RUN npm install -g pm2 && npm install

# Copia el resto de la aplicación
COPY . .

# Expone el puerto
EXPOSE 3000

# Usa PM2 para ejecutar la aplicación
CMD ["pm2-runtime", "start", "server.js", "--name", "frontend"]

