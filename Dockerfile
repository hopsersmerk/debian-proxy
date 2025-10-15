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

# Comando de inicio
CMD ["squid", "-N", "-d", "1"]
