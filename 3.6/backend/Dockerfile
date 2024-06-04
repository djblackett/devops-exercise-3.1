FROM golang:1.20

WORKDIR /usr/src/app
COPY . /usr/src/app/

ENV REQUEST_ORIGIN=http://localhost:3000
ENV PORT=8080

RUN go build && \
     go test ./... && \
     adduser user1 && \
     chown -R user1:user1 /usr/src/app

USER user1
CMD ["./server"]