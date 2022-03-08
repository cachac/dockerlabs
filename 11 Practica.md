# 11. Práctica #2 <!-- omit in TOC -->

# 1. Clonar el repositorio: docker/getting-started

```vim
git clone https://github.com/docker/getting-started.git
```
# 2. Aseguar que no hayan contenedores en ejecución
# 3. Crear un archivo Dockerfile en getting-started/app. Con los siguientes pasos
## 3.1. Utilizar la imagen node:12.alpine
## 3.2. Utilizar el comando RUN para descargar las librerias python3, g++ y make
Utilizar:
```vim
apk add --no-cache python3 g++ make
```
## 3.3. Utilizar como directorio de inicio: /app
## 3.4. Copiar todo el contenido de la carpeta en el contenedor (COPY . .)
## 3.5. Utilizar el comando RUN para instalar las librerias Yarn (NodeJS):
```vim
yarn install --production
```
## 3.6. Ejecutar el contendor (CMD) con el comando:
```vim
["node", "src/index.js"]
```

# 4. Construir la imagen y ejecutar el contenedor (Puede tardar varios minutos construyendo):
## 4.1. Asignarle un tag a la imagen
## 4.2. Asignarle un nombre al contenedor
## 4.3. Utilizar los puertos 8080:3000

# 5. Probar en browser: http://<ip publica | dominio> y agregar tareas.

# 6. Detener el contenedor docker-app, ejecutarlo de nuevo y probar en browser...
Resultado:
> Las tareas agregadas se han perdido 🤕

# 7. Crear volumen para hacer la data persistente:

## 7.1. Crear un volumen llamado todo-db
## 7.2. Ejecutar y Conectar volumen al contenedor en /etc/todos

# 8. Bajar y subir la imagen, y comprobar persistencia.

# 9. Limpieza
```vim
docker rm -f $(docker ps -a -f status=running -q) && docker image prune
```
