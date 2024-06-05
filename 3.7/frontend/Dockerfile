FROM node:16.20.2-alpine3.18

WORKDIR /usr/src/app
COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install && \
    adduser -D -g '' user1 && \
    chown -R user1:user1 /usr/src/app

USER user1
CMD ["npm", "run", "start"]
