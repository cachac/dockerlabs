# 6. Dockerfile <!-- omit in TOC -->

# 1. Dockerfile Stages: crear el archivo stage.dockerfile
```vim
### STAGE 1: Build ###
FROM cachac/dockerlabs_base:node14 as build

WORKDIR /usr/src/app

### STAGE 2: NGINX ###
FROM nginx:stable-alpine as release

COPY --from=build /usr/src/app/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
```

> as build = establece el escenario *build*

> as release = establece el escenario *release*

> COPY --from = copia de un stage a otro

> EXPOSE = expone el puerto 8080

> nginx.conf escucha en el puerto 8080

# 2. Construir y ejecutar

## 2.1. Crear la imagen usando el archivo stage.dockerfile (-f) y el nombre dockerlabs
```vim
docker build . -f stage.dockerfile -t dockerlabs

docker images
```

## 2.2. Ejecutar
```vim
docker run -p 8080:8080 dockerlabs:latest
```

> Error Conocido:
>
> listen tcp4 0.0.0.0:8080: bind: address already in use.


## 2.3. Probar página en el browser con ip pública o dominio

## 2.4. Descargar la imagen original node:14.11.0-alpine3.12

```vim
docker pull node:14.11.0-alpine3.12

docker images
```

## 2.5. Comparar tamaño de imagenes NODE

> node14 (usada en el paso anterior): cachac/dockerlabs_base:node14 = ~1.59GB

> Alpine: alpine3.12 = ~114MB

> Comparar el tamaño de la imagen con *stages dockerlabs* y *demowebsite* (lab anterior)


## 2.6. Limpiar imágenes sin utilizar
```vim
docker image prune
```
> Validar las imágenes borradas y la cantidad de espacio reclamada


# 3. Crear cuenta en hub.docker.com y subir imagen
> [Docker Hub](https://docs.docker.com/docker-hub/ )

```vim
docker tag <container_id> <dockerhub user>/dockerlabs

docker tag <container_id> cachac/dockerlabs

docker push <docker user>/dockerlabs
```
Resultado:

> denied: requested access to the resource is denied

## 3.1. Dockerhub  Login y validar en el registry
```vim
docker login
```
> Login Succeeded

# 4. Multiples contenedores
![docker](./static/assets/img/Dockerlabs-multi-contenedor.png)
