# 1. Ciclo de vida <!-- omit in TOC -->

## 1. Crear imagen
```vim
docker create --name ciclo ubuntu
```

## 2. Listar imagen
```vim
docker images
```

> Creamos la imagen del contenedor, pero no está en ejecución, tampoco en estado “Stopped”. La imagen solamente existe.

## 3. Iniciar el contenedor
```vim
docker start ciclo

docker ps -a

docker pause ciclo
```

> SIGSTOP, pausa el proceso. Puede continuar utilizando la porción de memoria asignada mediante un SIGCONT (docker unpause).


## 4. Detener el contenedor
```vim
docker  stop ciclo
```
> SIGTERM, termina el proceso. SIGKILL (docker kill) termina el proceso inmediatamente.

## 5. Eliminar contenedores e imágenes
```vim
docker rm ciclo (en caso de error forzar con -f)

docker rmi <id> (en caso de error forzar con -f)
```

