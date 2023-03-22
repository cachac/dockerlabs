# 9. Administración de Recursos <!-- omit in TOC -->

> [info](https://docs.docker.com/config/containers/resource_constraints/)

# 1. Limitar la memoria y el swap a 100 MB

Listar las estadísticas de contenedores y revisar el MEM/LIMIT

```vim
docker run -d --rm --memory-swap 100m --memory 100m --name mem-demo dockerlabs

docker stats
Ó
docker stats mem-demo
```
```
NAME       CPU %     MEM USAGE / LIMIT   MEM %
mem-demo   0.00%     4.383MiB / 100MiB   4.38%
```

# 2. Limitar el cpu al 50% por segundo

```vim
docker run -d --rm --cpus="0.5" --memory 100m --name cpu-demo dockerlabs

Ó (con notación en microsegundos)

docker run -d --rm --cpu-period=100000 --cpu-quota=50000 --name cpu-demo dockerlabs

docker stats cpu-demo

```

## Generar consumo de CPU

En otro tab:

```vim
docker exec cpu-demo apk add stress-ng

docker exec -d cpu-demo stress-ng --matrix 1 -t 1m
```

> Revisar que el consumo de CPU no sobrepasa el ~50%


## Limpieza
```
docker rm -f $(docker ps -a -f status=running -q) && docker image prune
```
