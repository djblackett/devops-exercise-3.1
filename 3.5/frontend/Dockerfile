FROM node:16

WORKDIR /usr/src/app
COPY . /usr/src/app

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install

RUN adduser user1
RUN chown -R user1:user1 /usr/src/app
USER user1

CMD ["npm", "run", "start"]