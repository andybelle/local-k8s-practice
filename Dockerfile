FROM golang:latest as builder

WORKDIR /

COPY . .

RUN go mod init main
RUN go mod tidy -e
RUN go build -o main

FROM alpine:latest

RUN apk add gcompat

WORKDIR /

COPY --from=builder /main .

EXPOSE 8000

ENTRYPOINT ["./main"]