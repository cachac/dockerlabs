# 1. Comandos <!-- omit in TOC -->

> [Comandos](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf )

## 1. Versión
```vim
docker version

docker version --format '{{.Server.Version}}'
```

## 2. Información
```vim
docker info
```

## 3. Descargar imagen del Registry
```vim
docker pull redis:3.2.11-alpine
```

Resultado:
> La imagen es un archivo .tar que contiene otros archivos .tar... Cada archivo es una capa de información que puede ser actualizada independientemente:
>
> **ff3a5c916c92: Pull complete**

## 4. Exportar y extraer el archivo tar
```vim
docker save redis:3.2.11-alpine > redis.tar

tar -xvf redis.tar

cat repositories
```
Resultado:
```vim
{

"redis":{"3.2.11-alpine":

"61e9bc827d2669863d449a5d4794ed37a2ccc4871c60d5aa0ed853398544fc12"

}}
```

## 5. Listar
```vim
docker images
```
Resultado
```vim
REPOSITORY   TAG             IMAGE ID       CREATED       SIZE

redis        3.2.11-alpine   ca0b6709748d   3 years ago   20.7MB
```

## 6. Ejecutar imagen y listar el contenedor
> [Opciones](https://docs.docker.com/engine/reference/run/)

> No pueden correr dos contenedores con el mismo nombre

```vim
docker run --name primero redis:3.2.11-alpine
```
> Deja la terminal "bloqueada" con la ejecución.
### 6.1. Cancelar (ctl+c) y ejecutar de forma desconectada (-d)
```vim
control + c

docker run -d --name primero redis:3.2.11-alpine
```

## 7. Ver imágenes en ejecución y detenidas
> [Opciones](https://docs.docker.com/engine/reference/commandline/ps/)

```vim
docker ps

docker ps -a

docker ps -s

docker ps --filter "name=<container_name | id>"

docker inspect <container_name | id>

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name | id>
```
> -a = muestra todos los contenedores

> -s = muestra el tamaño

## 8. Procesos y eventos
```vim
docker top primero

docker events
```

### 8.1. Generar eventos
Desde otra terminal pausar el contenedor primero para generar eventos
```vim
docker pause primero
docker unpause primero
docker stop primero
```

## 9. Historia
```vim
docker history <image ID>
```
## 10. Logs
```vim
docker logs primero
```

### 10.1. Ejecutar la imagen Ubuntu para generar logs
```vim
docker run -d --name demologs ubuntu sh -c "while true; do $(echo date); sleep 1; done"

docker logs -f demologs

docker logs -f -n 2 demologs

docker logs --until=60s demologs
```

> -f = follow
>
> --until muestra logs antes del tiempo establecido (60s)

## 11. Ejecutar comandos Exec
```vim
docker start primero

docker exec -it primero env

docker exec -it primero sh
```
> Navegar a "/" y listar los directorios del contenedor Alpine

## 12. Docker tags
```vim
docker tag  <id> <name>:<tag>

docker tag  <id> segundo:2.0

docker tag  <id> tercero:3.0.1
```

> Las tres imagenes (primero, segundo y tercero) apuntan al mismo ID de imagen.

## 13. Actualizar un argumento del contenedor
```vim
docker update --restart=always primero
```

## 14. Detener
```vim
docker stop primero
```
> También con <container-ID>

## 15. Eliminar contenedor
```vim
docker rm primero

docker ps -a (listar incluso los detenidos)
```

### Eliminar todos los contenedores en ejecución
```vim
docker rm -f <contenedor>

```
> -f = para forzar si el contenedor está corriendo
## 16. Eliminar imagen
```vim
docker rmi <id>

```
> image is referenced in multiple repositories

> -f = para forzar

## Remover imágenes y contenedores sin usar
```vim
docker container prune

docker image prune
```
