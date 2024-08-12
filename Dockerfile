FROM alpine:3.20 as builder

RUN apk add build-base strace

COPY . .

RUN gcc getaddrinfo.c -o /usr/local/bin/getaddrinfo
