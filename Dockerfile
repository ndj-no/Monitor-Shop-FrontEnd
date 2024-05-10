# Bước 1: Xây dựng ứng dụng Angular
FROM node:16 AS build
ARG BUILD_MODE
WORKDIR /app
COPY package.json ./
RUN npm install -f
COPY . .
RUN if [ -n "$BUILD_MODE" ]; then \
        ng build --configuration ${BUILD_MODE}; \
    else \
        ng build; \
    fi

# Bước 2: Chạy ứng dụng Angular với Nginx
FROM nginx:mainline-alpine3.18-slim AS final
COPY --from=build /app/dist/Monitor-Shop /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
