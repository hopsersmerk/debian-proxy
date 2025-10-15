# Imagen base estable
FROM debian:bookworm-slim

# Paquetes
RUN apt update && \
    apt install -y squid apache2-utils ca-certificates curl nano && \
    rm -rf /var/lib/apt/lists/*

# Copiamos el conf al build (para que exista incluso si el bind falla)
COPY squid.conf /etc/squid/squid.conf

# Preparamos directorios y permisos
RUN mkdir -p /var/spool/squid /var/log/squid && \
    chown -R proxy:proxy /var/spool/squid /var/log/squid

# Línea clave: forzamos a usar este conf SIEMPRE
CMD ["bash","-lc","exec squid -f /etc/squid/squid.conf -N -d 1"]
