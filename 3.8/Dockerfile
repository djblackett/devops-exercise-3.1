FROM node:16.20.2-alpine3.18

WORKDIR /usr/src/app
COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    rm -R /usr/src/app/src && \
    rm -R /usr/src/app/node_modules && \
    rm -R /usr/src/app/public && \
    rm package.json package-lock.json .eslintcache && \
    adduser -D -g '' user1 && \
    chown -R user1:user1 /usr/src/app


USER user1

#CMD ["npm", "run", "start"]
CMD ["serve", "-s", "-l", "3000", "build"]