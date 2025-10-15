# Dockerfile
FROM node:20-alpine  # hoặc python, tùy app
WORKDIR /app
COPY . .
RUN npm install      # nếu node
CMD ["node", "index.js"]  # thay bằng file chính
EXPOSE 8080
