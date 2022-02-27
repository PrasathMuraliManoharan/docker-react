# phase 1 : builder
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build will be created in builder phase

#phase 2: create nginx and copy build files to it
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
