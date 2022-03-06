# 10. Storage <!-- omit in TOC -->

# Crear Punto de montaje (bind mount)
```do

docker run -d --rm --name demo-mount -p 80:80 nginx:stable-alpine

docker inspect demo-mount -f "{{json .Mounts }}"

(no tiene puntos de montaje: [])

docker stop demo-mount

```
```vim

docker run -d --rm --name demo-mount -p 80:80 nginx:stable-alpine

docker inspect demo-mount -f "{{json .Mounts }}"

(no tiene puntos de montaje: [])

docker stop demo-mount

```
