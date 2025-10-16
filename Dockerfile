FROM debian:bookworm-slim

RUN apt update \
    && apt install -y dante-server \
    && rm -rf /var/lib/apt/lists/*

COPY danted.conf /etc/danted.conf

EXPOSE 443

CMD ["danted", "-f", "/etc/danted.conf", "-D"]
