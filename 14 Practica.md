# 14. Práctica Compose <!-- omit in TOC -->

# 1. Crear un archivo docker-compose.yml con las siguientes características:

> Versión: 3.7

> Nombre del contenedor de aplicacion: app

> Imagen: cachac/todo-demo:1.0

> Reinicio: unless-stopped

> Límite de memoria: 50mb

> Límite cpu: 0.3

> Puerto externo (host): 8080

> Puerto interno (contenedor): 3000

> Crear un volumen con el nombre: todo-data.

> Montar el volumen en la ruta del contenedor: /etc/todos

Ejemplo de volúmenes: https://docs.docker.com/compose/compose-file/compose-file-v3/#volume-configuration-reference

# 2. Levantar el contenedor en modo detached (-d). Luego probar la aplicación agregando algunas tareas

# 3. Detener el contenedor y levantarlo de nuevo para probar persistencia.

# 4. Agregar persistencia con una BD MySql para el almacenamiento de las tareas:

## 4.1. Volúmenes
> En el servicio APP: eliminar el mapeo del contenedor: - todo-data:/etc/todos

> Eliminar el volumen todo-data

> Crear un nuevo volumen: todo-mysql-data

## 4.2. Agregar un servicio con las siguientes características:

> Nombre: mysql

> Nombre del contenedor: db-<'nombre estudiante'>

> Imagen: mysql:5.7

> Variables:
```yaml
    environment:
      MYSQL_ROOT_PASSWORD: 12345
      MYSQL_DATABASE: todos
```

> Volumen: mapear el nuevo volumen "todo-mysql-data" con la ruta: /var/lib/mysql

## 4.3. Crear las variables de entorno en el servicio APP
```yaml
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: 12345
      MYSQL_DB: todos
```

> Recomendación: En ambientes productivos no se deben publicar archivos con información sensible.

## 4.4. Agregar una dependencia en APP para esperar el despliegue de Mysql

## 4.5. Ejecutar de forma desconectada (-d) y comprobar en browser

## 4.6. Reiniciar los contenedores para comprobar la persistencia

# 5. Checkpoint
