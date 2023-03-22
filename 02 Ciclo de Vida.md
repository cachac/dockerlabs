# 02. Ciclo de vida <!-- omit in TOC -->

## 1. Crear imagen
```vim
docker create --name ciclo ubuntu
```
>[Ubuntu Image](https://hub.docker.com/_/ubuntu)

Resultado:
> Unable to find image 'ubuntu:latest' locally
>
> latest: Pulling from library/ubuntu

## 2. Listar imagen
```vim
docker images

docker ps
```
> Creamos la imagen del contenedor, pero no está en ejecución, está en estado “Created”.

### 2.1. Mostar la salida usando --all, -a
```vim
docker ps -a
```

## 3. Iniciar el contenedor
```vim
docker start ciclo

docker ps
docker ps -a
```

> No muestra el contenedor en ejecución. La imagen de Ubuntu se ejecutó y salió al instante: Exited(0)

### 3.1. Ejecutar (run) la imagen
```vim
docker run --name ciclo ubuntu sh -c "while true; do $(echo date); sleep 1; done"
```

> docker run = ejecuta
> --name ciclo-2 = nombre del contenedor
>
> ubuntu = nombre de la imagen
>
> sh = comando de ejecución, terminal sh
>
> -c = argumento de ejecución, while

Resultado:
> The container name "/ciclo" is already in use by container

> El contenedor **ciclo** ya existe,


### 3.2. Eliminar y volver a correr.

```vim
docker rm ciclo

docker run --name ciclo ubuntu sh -c "while true; do $(echo date); sleep 1; done"
```
### 3.3. Detener e Iniciar usando Start
```vim
control + c

docker ps -a

docker start ciclo

docker ps
```
Resultado:
> Status **Up x seconds**

## 4. Pausar y Detener el contenedor

Validar el status de cada fase

```vim
docker pause ciclo

docker ps

docker unpause ciclo

docker ps

docker stop ciclo

docker ps
docker ps -a
```

> Pause = SIGSTOP, pausa el proceso. Puede continuar utilizando la porción de memoria asignada mediante un SIGCONT (docker unpause).
>
> Stop = SIGTERM, termina el proceso. SIGKILL (docker kill) termina el proceso inmediatamente.

## 5. Eliminar contenedores e imágenes
```vim
docker rm ciclo (en caso de error forzar con -f)

docker rmi <id> (en caso de error forzar con -f)
```

> para el <id> puede utilizar los primeros caracteres
