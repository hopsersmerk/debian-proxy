FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends dante-server net-tools iproute2 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY danted.conf /etc/danted.conf

EXPOSE 443/tcp 443/udp

# Espera 3s antes de iniciar Dante para asegurar interfaz disponible
CMD sleep 3 && danted -f /etc/danted.conf -D
