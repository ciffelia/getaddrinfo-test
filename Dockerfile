FROM alpine:3.20 as builder

RUN apk add --no-cache build-base

COPY . .

RUN gcc getaddrinfo.c -o getaddrinfo

FROM alpine:3.20

COPY --from=builder getaddrinfo /usr/local/bin/getaddrinfo
