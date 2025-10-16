# Proxy Docker (SOCKS5)

Este repositorio levanta un proxy SOCKS5 ligero basado en Dante en tu VPS o entorno Docker.

## 🚀 Instrucciones

1. **Construir la imagen:**

   ```bash
   docker compose build
   ```

2. **Levantar el contenedor:**

   ```bash
   docker compose up -d
   ```

3. **Probar el proxy:**

   ```bash
   curl --socks5-hostname 127.0.0.1:443 http://ifconfig.me
   ```

4. **Configurar en el navegador o sistema:**
   - Tipo: SOCKS5
   - Host: IP_DEL_VPS
   - Puerto: 443

## ⚙️ Archivos

- `Dockerfile` → define la imagen basada en Debian y Dante.
- `docker-compose.yml` → despliegue del servicio SOCKS5.
- `danted.conf` → configuración principal del servidor Dante.

## ⚠️ Notas

- Este ejemplo no incluye autenticación; considera añadirla antes de exponerlo en internet.
- Limita el acceso mediante firewall o reglas de red cuando lo publiques.
- Revisa los logs con:

  ```bash
  docker logs -f socks5-proxy
  ```
