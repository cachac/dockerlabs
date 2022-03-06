# 8. Confianza <!-- omit in TOC -->

>[Documentación](https://docs.docker.com/engine/security/)
# 1. Validar firma de imagen

```vim
docker trust inspect --pretty <usuario>/<image-id>:<tag>

docker trust inspect --pretty cachac/test:latest
```
Resultado
> No signatures or cannot access

## 1.1. Firmar imagen

> Debe estar logueado en su registry Dockerhub: docker login

```
docker trust sign <usuario>/<contenedor>:<tag>

docker trust sign cachac/test:latest
```

> Asignar un password seguro en todas las fases del firmado.

> Ej: Abc!#3

Resultado:
> Successfully signed docker.io/cachac/test:latest

## Revisar la firma
```vim
docker trust inspect --pretty cachac/test:latest
```
```
Signatures for cachac/test:latest

SIGNED TAG   DIGEST             SIGNERS
latest       dcac1334c8c1a...   cachac

List of signers and their keys for cachac/test:latest

SIGNER    KEYS
cachac    2d5570b91d30
```

## 1.2. Asegurar la descarga (pull) de imágenes firmadas:

```vim
export DOCKER_CONTENT_TRUST=1
```

## Bajar imágen sin firma
```vim
docker pull cachac/vuedemo
```

Resultado:
```
Error: remote trust data does not exist for docker.io/<user>/vuedemo

```

## Bajar una imagen firmada
```vim
docker pull cachac/multidocker:latest
```

## Volver a la configuración por defecto
```vim
export DOCKER_CONTENT_TRUST=0
```

> [Notario](https://docs.docker.com/engine/security/trust/deploying_notary/)

> [Acceso Remoto SSH](https://docs.docker.com/engine/security/protect-access/)
