# 1. Comandos <!-- omit in TOC -->

> [Comandos](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf )

## Versión
```vim
docker version

docker version --format '{{.Server.Version}}'
```

## Información
```vim
docker info
```

## Descargar imagen del Registry
```vim
docker pull redis:3.2.11-alpine
```

Resultado:
> La imagen es un archivo .tar que contiene otros archivos .tar... Cada archivo es una capa de información que puede ser actualizada independientemente:
>
> **ff3a5c916c92: Pull complete**

## Exportar y extraer el archivo tar
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

## Listar
```vim
docker images
```
Resultado
```vim
REPOSITORY   TAG             IMAGE ID       CREATED       SIZE

redis        3.2.11-alpine   ca0b6709748d   3 years ago   20.7MB
```

## Ver imágenes en ejecución y detenidas
> [Opciones](https://docs.docker.com/engine/reference/commandline/ps/)

```vim
docker ps

docker ps -a

docker ps -s

docker ps -a --filter "name=<container_name>"

docker inspect <container_name | id>

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name | id>
```

## Ejecutar imagen y listar el contenedor
> [Opciones](https://docs.docker.com/engine/reference/run/)

> No pueden correr dos contenedores con el mismo nombre

```vim
docker run -d --name primero redis:3.2.11-alpine

docker ps --filter "name=primero"

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' primero
```

## Proesos y eventos
```vim
docker top primero

docker events
```

> Desde otra terminal pauser el contenedor primero para generar eventos

## Historia
```vim
docker history <image ID>
```
## Logs
```vim
docker logs primero

docker logs -f primero

docker logs -f -n 2 primero

docker logs --until=60s primero
```

## Ejecutar comandos Exec
```vim
docker exec -it primero env

docker exec -it primero sh
```
> Navegar a "/" y listar los directorios del contenedor Alpine

## Docker tags
```vim
docker tag  <id> <name>:<tag>

docker tag  <id> segundo:2.0

docker tag  <id> tercero:3.0.1
```

## Actualizar un argumento del contenedor
```vim
docker update --restart=always primero
```

## Detener
```vim
docker stop primero
```
> También con ID

## Eliminar contenedor
```vim
docker rm primero

docker ps –a (listar incluso los detenidos)

docker rm -f primero (para forzar si el contenedor está corriendo)

docker container prune

```
## Eliminar imagen
```vim
docker rmi <id>

docker image prune 
```
