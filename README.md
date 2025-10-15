# Proxy Docker (Squid + Auth)


Este repositorio levanta un proxy HTTP autenticado en tu VPS o entorno Docker.


## 🚀 Instrucciones


1. **Construir la imagen:**
```bash
docker compose build
```


2. **Crear usuario de autenticación:**
```bash
docker run -it --rm \
-v $(pwd)/passwd:/etc/squid/passwd \
debian:bookworm-slim htpasswd -c /etc/squid/passwd proxyuser
```


3. **Levantar el contenedor:**
```bash
docker compose up -d
```


4. **Probar el proxy:**
```bash
curl -x http://proxyuser:contraseña@IP_DEL_VPS:9666 http://ifconfig.me
```


5. **Configurar en el navegador (Proxy Switcher / ZeroOmega):**
- Tipo: HTTP
- Host: IP_DEL_VPS
- Puerto: 9666
- Usuario: proxyuser
- Contraseña: la que configuraste


## ⚙️ Archivos


- `Dockerfile` → define el proxy basado en Debian.
- `docker-compose.yml` → facilita su despliegue.
- `squid.conf` → configuración principal de Squid.
- `passwd` → credenciales (no subirlo a GitHub).
- `logs/` → registros de acceso.


## ⚠️ Seguridad


- Nunca publiques el archivo `passwd`.
- Usa firewall y limita acceso por IP si el VPS es público.
- Revisa los logs:
```bash
docker logs proxy-server
```