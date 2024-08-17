FROM alpine:3.20 AS builder

RUN apk add --no-cache build-base

COPY . .

RUN gcc getaddrinfo.c -o getaddrinfo

FROM scratch AS binaries

COPY --from=builder getaddrinfo /

FROM alpine:3.20

RUN apk add --no-cache strace

COPY --from=builder getaddrinfo /usr/local/bin/getaddrinfo
