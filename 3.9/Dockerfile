FROM golang:1.20-alpine3.19 AS build_stage

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN go build && \
     go test ./...

FROM scratch
COPY --from=build_stage /usr/src/app/server .

ENV REQUEST_ORIGIN=http://localhost:3000
ENV PORT=8080

CMD ["./server"]