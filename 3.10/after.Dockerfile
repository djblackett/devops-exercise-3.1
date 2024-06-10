FROM node:16.20.2-alpine3.18

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production
COPY . .


RUN adduser -D -g '' user1 && \
    chown -R user1:user1 /usr/src/app

USER user1

EXPOSE 8080

CMD ["node", "index.js"]