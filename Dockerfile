FROM debian:bookworm-slim

RUN apt update && apt install -y tinyproxy apache2-utils && rm -rf /var/lib/apt/lists/*

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

EXPOSE 443

CMD ["tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf"]