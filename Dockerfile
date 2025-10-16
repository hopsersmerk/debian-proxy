FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends dante-server ca-certificates iproute2 net-tools \
    && rm -rf /var/lib/apt/lists/*

COPY danted.conf /etc/danted.conf

EXPOSE 443/tcp 443/udp

# -D: daemonize (igual deja logs en stdout por logoutput: stdout)
CMD ["danted", "-f", "/etc/danted.conf", "-D"]
