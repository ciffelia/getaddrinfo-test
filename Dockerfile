FROM gcc:14-bookworm AS builder

COPY . .

RUN gcc getaddrinfo.c -o getaddrinfo

FROM scratch AS binaries

COPY --from=builder getaddrinfo /

FROM debian:bookworm-slim

COPY --from=builder getaddrinfo /usr/local/bin/
