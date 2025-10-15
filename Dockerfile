# --- Dockerfile ---

# Giai đoạn build (dùng Node để build React)
FROM node:20-alpine AS build

# Tạo thư mục làm việc
WORKDIR /app

# Copy file package.json và package-lock.json vào container
COPY package*.json ./

# Cài dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build app ra thư mục /app/build
RUN npm run build

# Giai đoạn run (dùng Nginx để serve app)
FROM nginx:alpine

# Copy build đã tạo sang Nginx để chạy
COPY --from=build /app/build /usr/share/nginx/html

# Expose cổng 80 để Kubernetes có thể truy cập
EXPOSE 80

# Lệnh mặc định để chạy Nginx
CMD ["nginx", "-g", "daemon off;"]
