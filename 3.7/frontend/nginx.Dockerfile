FROM node:16.20.2-alpine3.18 AS build-stage

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080/api

RUN npm run build
RUN ls -la /usr/src/app/build

FROM nginx:1.27.0
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]