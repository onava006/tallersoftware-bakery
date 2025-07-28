# Etapa 1: Construcción
FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Etapa 2: Servidor web (nginx)
FROM nginx:alpine

# Copia el build al directorio público de nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Elimina configuración por defecto de nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia tu configuración personalizada de nginx
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
