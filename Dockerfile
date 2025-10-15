# Imagen base estable
FROM debian:bookworm-slim

# Instalar dependencias
RUN apt update && \
    apt install -y squid apache2-utils curl nano && \
    rm -rf /var/lib/apt/lists/*

# Crear carpeta de logs
RUN mkdir -p /var/log/squid && chmod -R 755 /var/log/squid

# Crear usuario para autenticación (manual después)
# RUN htpasswd -c /etc/squid/passwd proxyuser

# Exponer puerto 9666
EXPOSE 9666

# Prevenir error xcalloc: crea spool vacío y desactiva cache por defecto
RUN mkdir -p /var/spool/squid && \
    chown -R proxy:proxy /var/spool/squid && \
    echo "cache_dir null /tmp" > /etc/squid/conf.d/disable-cache.conf

# Comando de inicio
CMD ["squid", "-N", "-d", "1"]
