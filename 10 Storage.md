# 10. Storage <!-- omit in TOC -->

# 1. Crear Punto de montaje (bind mount)
```vim
docker run -d --rm --name demo-mount -p 8080:80 nginx:stable-alpine

docker inspect demo-mount -f "{{json .Mounts }}"
```

> no tiene puntos de montaje: []

## 1.1. Detener
```vim
docker stop demo-mount
```

## 1.2. Crear el contenedor mapeando un archivo local

```vim
docker run -d --rm --name demo-mount -p 8080:80 -v ~/dockerlabs/bind.html:/usr/share/nginx/html/index.html nginx:stable-alpine
```

> Los archivos son persistentes!!

## 1.3. Editar el punto de montaje y refrescar el browser

> Cambiar la línea #21 del archivo /dockerlabs/bind.html

# 2. Validar el punto de montaje:

```vim
docker inspect demo-mount -f "{{json .Mounts }}" | jq
```
```
   "Type": "bind",
   "Source": "/home/docker/dockerlabs/bind.html",
   "Destination": "/usr/share/nginx/html/index.html",
```

# 3. Crear un volúmen
```vim
docker volume create data

docker volume list

docker volume inspect data
```
```vim
  "Driver": "local",

  "Mountpoint": "/var/lib/docker/volumes/data/_data",
  "Name": "data",
```
## 3.1. Ejecutar un contenedor conectado al nuevo volumen data

```vim
docker run -it --rm --name demo-vol --mount source=data,destination=/data ubuntu
```

> otra opción: -v data:/data

> :ro = modo solo lectura

> -it = habilita la terminal interactiva (sh)

## 3.2. Ingresamos al directorio data y creamos un archivo

```vim
cd data

touch doc1.txt

ls

exit
```

## 3.3. Validamos el volumen en el host

```vim
sudo ls -a /var/lib/docker/volumes/data/_data
```

> Múltiples contenedores pueden compartir el mismo volumen

# 4. Crear otros dos contenedores utilizando el mismo volumen

```vim
docker run -dit --rm --name demo-vol1 --mount source=data,destination=/data ubuntu

docker run -dit --rm --name demo-vol2 -v data:/data ubuntu
```

## 4.1. Comprobar en dos terminales la modificación de archivos

### 4.1.1. En demo-vol1
```vim
docker exec -it demo-vol1 bash

watch cat /data/doc.txt
```

### 4.1.2. En demo-vol2
```vim
docker exec -it demo-vol2 bash

echo este archivo ha sido modificado desde DEMO-VOL2 > /data/doc.txt
```

## Limpieza
```vim
docker rm -f $(docker ps -a -f status=running -q) && docker image prune
```
