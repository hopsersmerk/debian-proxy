FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends dante-server net-tools iproute2 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY danted.conf /etc/danted.conf

EXPOSE 443/tcp 443/udp

# Iniciar con un pequeño delay y modo debug 1 (para ver errores)
CMD sleep 2 && danted -f /etc/danted.conf -D -d 1
