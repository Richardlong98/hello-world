# --- Dockerfile (React app build & serve bằng Nginx) ---

# Giai đoạn build
FROM node:20-alpine AS build
WORKDIR /app

# Cài dependencies
COPY package*.json ./
RUN npm install

# Copy toàn bộ mã nguồn và build
COPY . .
RUN npm run build

# Giai đoạn run (serve build qua nginx)
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Expose cổng 80 (nginx mặc định)
EXPOSE 80

# Chạy nginx
CMD ["nginx", "-g", "daemon off;"]
