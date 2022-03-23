# 12. Compose <!-- omit in TOC -->

# 1. Instalación

> [Info](https://docs.docker.com/compose/install/ )

```vim
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## 1.1. Comprobar versión
```vim
docker-compose --version
```
# 2. Construir un Docker-Compose básico, con el nombre docker-compose.yml

Utiliza el archivo stage.dockerfile del lab 06

```yaml
version: '3.7'
services:
  dockerlabs:
    container_name: dockerlabs
    image: dockerlabs:version_compose
    build:
      dockerfile: ./stage.dockerfile
      context: .
```

Error conocido:
> ERROR: yaml.scanner.ScannerError: while scanning for the next token
>
> Sucede al insertar caracteres "basura" al copiar y pegar en la terminal

# 3. Construir la imágen
> [Info](https://docs.docker.com/compose/reference/build/)

```vim
docker-compose build
```

> Unable to evaluate symlinks in Dockerfile path: lstat /home/docker/stage.dockerfile: no such file or directory

## 3.1. Corregir el error:
```vim
dockerfile: ./stage.dockerfile
```

> Successfully tagged dockerlabs:version_compose

# 4. Levantar los servicios:
```vim
docker-compose up
```

# 5. Probar en browser

> 502 Bad Gateway

# 6. Agregar el puerto:
```yaml
ports:
	- 8080:8080
```

# 7. Construir un Docker-Compose Avanzado
## 7.1. Eliminar contenedores del lab anterior
```vim
docker-compose down
ó
docker rm -f dockerlabs
```
## 7.2. Editar el archivo docker-compose.yml

## 7.3. En el docker-compose utilizar la versión 3.7
```vim
version: '3.7'
```
## 7.4. En el bloque networks:
> Nombre: net-lab-compose

> Driver: bridge

> CIDR: 11.0.0.0/27

> Gateway: 11.0.01
>
```yaml
networks:
  net-lab-compose:
    name: net-lab-compose
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 11.0.0.0/27
          gateway: 11.0.0.1
```

## 7.5. En el bloque de services crear 4 contenedores con los siguientes atributos:
### 7.5.1. Contenedor Load Balancer:
> Utilizar el dockerfile del lab 6 (punto 4.4): loadbalancer.dockerfile

> Recursos: 50m de memoria y 0.3 cpu

> Puertos: 8080:80

> Networks: net-lab-compose, ip 11.0.0.2
```yaml
  loadbalancer:
    container_name: loadbalancer
    build:
      dockerfile: ./loadbalancer.dockerfile
      context: .
    image: loadbalancer
    hostname: loadbalancer
    restart: always
    mem_limit: 50m
    memswap_limit: 50m
    cpus: 0.3
    ports:
    	- 8080:80
    networks:
      net-lab-compose:
        ipv4_address: 11.0.0.2
```

### 7.5.2. Construir
```vim
docker-compose build
```
> Successfully tagged loadbalancer:latest

### 7.5.3. Contenedor Aplicación Web:
> Nombre: multidocker_1

> Utilizar el dockerfile del lab 6: stage.dockerfile

> Recursos: 50m de memoria y 0.3 cpu

> Puertos: 8080

> Networks: net-lab-compose, ip 11.0.0.3

```yaml
multidocker_1:
	container_name: multidocker_1
	build:
		dockerfile: ./stage.dockerfile
		context: .
	image: multidocker_1
	hostname: multidocker_1
	restart: always
	mem_limit: 50m
	memswap_limit: 50m
	cpus: 0.3
	ports:
		- 8080
	networks:
		net-lab-compose:
			ipv4_address: 11.0.0.3
```

### 7.5.4. Construir
```vim
docker-compose build
```
> Successfully tagged multidocker_1:latest

### 7.5.5. Configurar dos servicios mas con los valores:
> Nombre del servicio, contenedor, imagen y hostname: multidocker_2 & multidocker_3 (usar ctl+d en vsCode)

> Networks: net-lab-compose, ip 11.0.0.4 - ip 11.0.0.5


### 7.5.6. Crear dependencias
El contenedor de Load Balancer depende de los contenedores de apps.

Agregar el bloque depends_on al servicio loadbalancer
```yaml
	depends_on:
		- multidocker_1
		- multidocker_2
		- multidocker_3
```

## 7.6. Construir y ejecutar
```vim
docker-compose up --build
```

## 7.7. Generar tráfico en browser y validar logs

## 7.8. Detener (ctl+c) y ver las imágenes

> Construyó 1 imágen por cada contenedor de aplicación.

> Las tres imágenes hacen referencia al mismo ID

## 7.9. Ejecutar los servicios escalando tres contenedores de la aplicación
> Eliminar bloque: multidocker_2 & multidocker_3

> Cambiar nombre de servicio: multidocker

> Eliminar container_name

> Eliminar puertos (excepto Loadbalancer)

> Eliminar ipv4_address

```yaml
  multidocker:
    build:
      dockerfile: ./stage.dockerfile
      context: .
    image: multidocker
    hostname: multidocker
    restart: always
    mem_limit: 50m
    memswap_limit: 50m
    cpus: 0.3
    networks:
      net-lab-compose:
```
## 7.10. Actualizar el servicio loadbalancer
> Cambiar las dependencias del loadbalancer

> Eliminar la ip

```yaml
    networks:
      net-lab-compose:
    depends_on:
      - multidocker
```

```
docker container prune

docker-compose up --scale multidocker=3
```

> Crea tres contenedores "dockerlabs_multidocker_x"

```
Creating dockerlabs_multidocker_1 ... done
Creating dockerlabs_multidocker_2 ... done
Creating dockerlabs_multidocker_3 ... done
Creating loadbalancer             ... done
```

> El balanceador no encuentra los contenedores, ya que el DNS cambió

> Todos los contenedores utilizan la misma imagen

```
loadbalancer    | nginx: [emerg] host not found in upstream "multidocker_1:8080" in /etc/nginx/conf.d/default.conf:3
loadbalancer exited with code 1
```

## 7.11. Cambiar el contenedor loadbalancer y Mapear el archivo de configuración nginx al contenedor loadbalancer

> Validar la dirección del archivo a editar en el atributo: loadbalancer - dockerfile

> Cambiar la configuración del webserver (Nginx) con los nuevos NOMBRES de contenedor a resolver

> Eliminar build

> Cambiar la imagen: nginx:stable-alpine

> Crear volumen y mapearlo en modo read-only (:ro)

```yaml
    image: nginx:stable-alpine
		volumes:
		  - ./dockerfiles_demo/nginx-loadbalancer.conf:/etc/nginx/conf.d/default.conf:ro
```

## 7.12. Construir, limpiar y ejecutar
```vim
docker-compose build

docker container prune

docker-compose up -d --scale multidocker=3
```

> Ejecuta en forma desconectada (-d)

## 7.13. Listar contenedores
```vim
docker-compose ps
```

## 7.14. Detener y eliminar contenedores
```vim
docker-compose down
```

## 7.15. Agregar Health Checks
> [Info](https://docs.docker.com/compose/compose-file/compose-file-v3/#healthcheck)

```yaml
    healthcheck:
      test: ['CMD', 'curl', '-f', 'http://localhost:8080']
      interval: 30s #1m30s
      timeout: 10s
      retries: 3
      start_period: 30s
```
> valida cada 30s

> tiempo de respuesta de 10s

> hasta 3 reintentos si el contenedor no responde

> periodo de inicio de 30s

## 7.16. Construir, limpiar y ejecutar
```vim
docker-compose build

docker container prune

docker-compose up -d --scale multidocker=3
```

## 7.17. Listar contenedores y validar status healty
```vim
docker-compose ps
```

## 7.18. Validar en browser


## 7.19. Limpiar
```vim
docker-compose down

docker image prune
```
