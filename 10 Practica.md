# 10. Práctica #2 <!-- omit in TOC -->

# 1. Clonar el repositorio: docker/getting-started

```vim
git clone https://github.com/docker/getting-started.git
```
# 2. Aseguar que no hayan contenedores en ejecución
# 3. En la carpeta getting-started/app, crear un archivo Dockerfile Con los siguientes pasos:
## 3.1. Utilizar la imagen node:18-alpine
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

# 4. Construir la imagen y ejecutar el contenedor con los siguientes parámetros (Puede tardar varios minutos construyendo):
- Asignarle un tag a la imagen
- Asignarle un nombre al contenedor
- Utilizar los puertos 8080:3000

# 5. Probar en browser: http://<ip publica | dominio> y agregar tareas.

# 6. Eliminar (rm) el contenedor. Ejecutarlo de nuevo y probar en browser...
Resultado:
> Las tareas agregadas se han perdido 🤕

# 7. Checkpoint

# 8. Crear volumen para hacer la data persistente:

## 8.1. Crear un volumen llamado todo-db
## 8.2. Ejecutar y Conectar volumen al contenedor en /etc/todos

# 9. Eliminar el contenedor y crearlo de nuevo para comprobar persistencia.

# 10. Checkpoint
# 11. Limpieza
```vim
docker rm -f $(docker ps -a -f status=running -q) && docker image prune
```
