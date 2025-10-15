# Imagen base estable
FROM debian:bookworm-slim

# Paquetes
RUN apt update && \
    apt install -y squid apache2-utils ca-certificates curl nano && \
    rm -rf /var/lib/apt/lists/*

# Copiamos configuración
COPY squid.conf /etc/squid/squid.conf

# Creamos wrapper que fuerza parámetros seguros
RUN echo '#!/bin/bash\n' \
    'mkdir -p /var/spool/squid /var/log/squid && chown -R proxy:proxy /var/spool/squid /var/log/squid\n' \
    'exec squid -N -d 1 -f /etc/squid/squid.conf -z\n' \
    > /start-squid.sh && chmod +x /start-squid.sh

EXPOSE 9666

CMD ["/start-squid.sh"]
