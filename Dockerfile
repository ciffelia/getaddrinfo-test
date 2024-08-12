FROM gcc:14-bookworm as builder

COPY . .

RUN gcc getaddrinfo.c -o getaddrinfo

FROM buildpack-deps:bookworm-curl

COPY --from=builder getaddrinfo /usr/local/bin/getaddrinfo
