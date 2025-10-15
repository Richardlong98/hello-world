# --- Dockerfile ---
FROM node:20

# Tạo thư mục làm việc trong container
WORKDIR /app

# Copy package.json và cài dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy toàn bộ code vào container
COPY . .

# Expose cổng app chạy (thường 8080)
EXPOSE 8080

# Chạy app thông qua npm start
CMD ["npm", "start"]
