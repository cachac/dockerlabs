# 05. Dockerfile <!-- omit in TOC -->

> [Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

# 1. Descargar proyecto github Dockerlabs
```vim
git clone https://github.com/cachac/dockerlabs.git
```

# 2. Dockerfile básico
Entrar en la carpeta dockerlabs, luego crear el archivo “dockerfile”. Agregar la siguiente información al dockerfile:

```vim
FROM nginx

WORKDIR /usr/share/nginx/html

COPY Hello_docker.html .

RUN cp Hello_docker.html index.html

CMD nginx -g 'daemon off;'
```

> FROM = docker pull nginx:latest

> WORKDIR = directorio de trabajo

> COPY = copia archivos y directorios, en este caso copia Hello_docker.html como index.html

> RUN = ejecuta comandos Linux

> CMD = ejecuta un comando de inicio

> otra forma: CMD ["nginx", "-g", "daemon off;"]


# 3. Crear la imagen con el nombre demowebsite y el tag 1.0
```vim
docker build -t demowebsite:1.0 .

docker images
```
Resultado:
```
Step 1/6 : FROM nginx

Step 2/6 : WORKDIR /usr/share/nginx/html
 ---> Running in a55c755148b3
Removing intermediate container a55c755148b3

Step 3/6 : COPY Hello_docker.html /usr/share/nginx/html
...
Step 4/6 : RUN cp Hello_docker.html index.html
...
Step 5/6 : USER lab
...
Step 6/6 : CMD nginx -g 'daemon off;'
```

> Crea imágenes intermedias por cada paso.

> Las imágenes Nginx y demowebsite:1.0 tiene el mismo tamaño pero no el mismo ID

# 4. Ejecutar la imágen
```vim
docker run -d --name website -p 8080:80 demowebsite:1.0

docker ps
```

> Expone el puerto 8080 en el host y el puerto 80 a lo interno del contenedor

> 0.0.0.0:8080->80/tcp, :::8080->80/tcp

![docker](https://raw.githubusercontent.com/cachac/dockerlabs/main/static/assets/img/Dockerlabs-Docker%20Ports-Nginx.png)

## Ver logs
```vim
docker logs -f website
```
## 4.1. Probar el sitio web
Con la ip pública del host o el dominio <'lab'>.dockerlabs.tk

> Validar los logs del contenedor


# Construir con argumentos.
Cambiar en el docker file las siguientes líneas:
```vim
FROM nginx

ARG AUTOR

ENV AUTOR=$AUTOR

WORKDIR /usr/share/nginx/html

COPY Hello_docker.html .

RUN sed -e s/Docker/"$AUTOR"/ Hello_docker.html > index.html ;

CMD ["nginx", "-g", "daemon off;"]
```

> ARG = argumento

> ENV = variable de entorno dentro del contenedor

> RUN = actualiza el archivo .html con el contenido de la variable


# Construir una versión 2.0 y ejecutar

Detener el contenedor en ejecución y **REMPLAZAR** la variable AUTOR
```vim
docker rm -f website

docker build --build-arg AUTOR="mi_nombre" -t demowebsite:2.0 .

docker run -d --name website -p 8080:80 demowebsite:2.0

```

Errores conocidos:
> The container name "/website" is already in use by container

> Bind for 0.0.0.0:8080 failed: port is already allocated.

## Ver la variable de entorno $AUTOR
```vim
docker exec website env
```



