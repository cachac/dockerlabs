## 1. Descargar imagen ubuntu versión 20.04. Usar docker pull

## 2. Listar las imágenes y comprobar la imagen Ubuntu 20.04 en lista.

## 3. Ejecutar el contenedor. Usar docker run y asignar el nombre practica

## 4. Listar los contenedores. Usar ps –a, y comprobar el STATUS del contenedor practica: Exited (0)…

## 5. El contenedor se encuentra en estado “Exited (0)” debido a que ejecutó su función (levantar Ubuntu) y al no tener otra instrucción terminó inmediatamente.

## 6. Ejecutar el contenedor con el nombre practica en modo “background”  (-d) y habilitar la terminal interactiva (-it) para mantener el contenedor en estado “running” y evitar su salida.

> Si recibe el error: “The container name "/practica" is already in use by container...” Debe eliminar los contenedores en ejecución y detenidos con el mismo nombre. Usar el comando rm. Adicionalmente, para evitar el error anterior, también puede agregar el argumento   --rm (docker run --rm <otros argumentos>), y sobreescribir los contenedores detenidos.

## 7. Listar los detalles del contenedor. Usar inspect. Buscar la información de su status, ip, gateway

## 8. Detener y eliminar el contenedor practica y la imagen de ubuntu:20.04. Usar stop, rm, rmi y prune.

## 9. Ejecutar la imagen de mysql:latest (última versión). Usar docker run en modo “background” y asignarle el nombre practica-db

>Note que la imagen no se encuentra local y se debe descargar el Registry: Unable to find image 'mysql:latest' locally

 >                            latest Pulling from library/mysql

## 10. Listar las imágenes y comprobar la imagen mysql

## 11. Ver los logs del contenedor practica-db. ¿Cuál es el error que está mostrando?

## 12. Detener y eliminar todos los contenedores e imágenes. Aplicar el comando prune.

> Validar la cantidad de megas reclamados (limpiados).
