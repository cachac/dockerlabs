# 1. Compose <!-- omit in TOC -->

# 2. Instalación

> [Info](https://docs.docker.com/compose/install/ )

```vim
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## 2.1. Comprobar versión
```vim
docker-compose --version
```
# 3. Construir un Docker-Compose básico, con el nombre docker-compose.yml

> docker-compose.yml


```yaml
version: '3.7'
services:
  dockerlabs:
    container_name: dockerlabs
    image: dockerlabs:version_compose
    build:
      dockerfile: /stage.dockerfile
      context: .
```
> Utiliza el archivo stage.dockerfile del lab 06

Error conocido:
> ERROR: yaml.scanner.ScannerError: while scanning for the next token
>
> Sucede al insertar caracteres "basura" al copiar y pegar en la terminal

# 4. Construir la imágen
> [Info](https://docs.docker.com/compose/reference/build/)

```vim
docker-compose build
```

> Unable to evaluate symlinks in Dockerfile path: lstat /home/docker/stage.dockerfile: no such file or directory

## 4.1. Corregir el error: hace falta un punto en la ruta del dockerfile
```vim
dockerfile: ./stage.dockerfile
```

> Successfully tagged dockerlabs:version_compose

# 5. Levantar los servicios:
```vim
docker images
docker-compose up
```

# 6. Probar en browser

> 502 Bad Gateway

# 7. Agregar el puerto:
```yaml
ports:
  - 8080:8080
```

# Ejecutar y probar en browser
```
docker-compose up -d
```

# 8. Construir un Docker-Compose Avanzado
> [yaml](./compose_loadbalancer/advanced.yml)
## 8.1. Eliminar contenedores del lab anterior
```vim
docker-compose down
ó
docker rm -f dockerlabs
```
## 8.2. Editar el archivo docker-compose.yml
> Eliminar el primer contenedor del archivo
## 8.3. Crear un bloque networks:
```yaml
networks:
  net-lab-compose:
    name: net-lab-compose
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 11.0.0.0/27
          gateway: 11.0.0.1
```

## 8.4. En el bloque de services crear 4 contenedores con los siguientes atributos:

### 8.4.1. Contenedor Aplicación Web:
```yaml
  multidocker:
    build:
      dockerfile: ./stage.dockerfile
      context: .
    image: multidocker
    hostname: multidocker
    restart: always
    mem_limit: 50m
    memswap_limit: 50m
    cpus: 0.3
    networks:
      net-lab-compose:
    healthcheck:
      test: ['CMD', 'curl', '-f', 'http://localhost:8080']
      interval: 30s #1m30s
      timeout: 10s
      retries: 3
      start_period: 30s
```

### 8.4.2. Construir
```vim
docker-compose build
```

### 8.4.3. Contenedor Load Balancer:
```yaml
  loadbalancer:
    container_name: loadbalancer
    image: nginx:stable-alpine
    hostname: loadbalancer
    restart: always
    mem_limit: 50m
    memswap_limit: 50m
    cpus: 0.3
    ports:
    - 8080:80
    networks:
      net-lab-compose:
    volumes:
      - ./dockerfiles_demo/compose-loadbalancer.conf:/etc/nginx/conf.d/default.conf:ro
    healthcheck:
      test: ['CMD', 'curl', '-f', 'http://localhost']
      interval: 30s #1m30s
      timeout: 10s
      retries: 3
      start_period: 30s
    depends_on:
      - multidocker
```
> monta el archivo dockerfiles_demo/compose-loadbalancer.conf con las rutas a los contenedores de la app web


## 8.5. Construir y ejecutar
```vim
docker-compose up --build -d
```
> levanta loadbalancer
> levanta contenedor multidocker

## Comprobar estado de salud
```
docker-compose ps
```
> Loadbalancer Restarting


## Ver logs
```
docker-compose logs
```
> El loadbalancer espera 3 copias
> host not found in upstream ...
## 8.6. Escalar 3 replicas
```
docker-compose down

docker-compose up -d --scale multidocker=3
```

> Crea tres contenedores "dockerlabs_multidocker_x"


## 8.9. Listar contenedores
```vim
watch docker-compose ps
docker-compose logs -f
```

## 8.14. Validar en browser


## 8.15. Limpiar
```vim
docker-compose down

docker ps -a
```
