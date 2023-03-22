# 01. Instalación <!-- omit in TOC -->

## 1. Instalación en Ubuntu server
```vim
sudo apt update
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```
> [Post Install](https://docs.docker.com/engine/install/linux-postinstall/)

## 2. docker run
```vim
docker run -d --name=db redis:alpine
```
> Ejecuta el contenedor y su imagen está alojada en el registry DockerHub.

## 3. Revisar el proceso en ejecución
```vim
ps aux | grep redis-server
```
Resultado:
```vim
999       1124  0.1  1.3  29160 13380 ?        Ssl  13:46   0:01 redis-server *:6379
```

```vim
pstree -c -p -A $(pgrep dockerd)
```

## 4. Grupos de Control (CGroups)
Limitan la cantidad de recursos que un proceso puede consumir. Los CGroups son valores definidos dentro del directorio /proc

```vim
cat /proc/<docker process ID>/cgroup

cat /sys/fs/cgroup/cpu,cpuacct/docker/<dockerID>/cpu.shares

cat /sys/fs/cgroup/cpu,cpuacct/docker/<dockerID>/cpuacct.stat

ls /sys/fs/cgroup/memory/docker/
```

## 5. Docker Stats
> [Estadísticas](https://docs.docker.com/engine/reference/commandline/stats/ )


