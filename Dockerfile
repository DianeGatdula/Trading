FROM node:16.13-alpine as build

WORKDIR /app

COPY ./package*.json /app

RUN npm install

COPY . .


RUN npm run build
CMD ["npm", "run", "start"]

#webserver
FROM fholzer/nginx-brotli:v1.12.2
WORKDIR /etc/nginx
ADD nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]