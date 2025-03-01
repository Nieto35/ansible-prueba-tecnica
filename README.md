# infra

## Comenzar

### ¡¡IMPORTANT!!

routes vhost
```bash
Windows: C:\Windows\System32\drivers\etc\hosts
Linux: /etc/hosts
Mac: /etc/hosts
```
Ensure you have the following entries in your `hosts` file:
```plaintext
127.0.0.1 app.project.local
127.0.0.1 auth.project.local
```

### Docker

Docker para estandarizar entornos de trabajo.

[Instalar Docker](https://docs.docker.com/desktop/)

### Ansible

Ansible para estandarizar procesos. Esta herramienta está disponible como imagen de Docker:

##### Construir imagen para ejecutar Ansible

```shell
cd ansible/docker; docker build -t project/ansible .; cd ../..
```

##### Clonar repositorios

```shell
./ansible-playbook.sh dev/clone-repositories.yml
```

##### Copiar archivos .env

```shell
./ansible-playbook.sh dev/copy-env-files.yml
```

##### Arrancar proyectos

```shell
./ansible-playbook.sh dev/start.yml
```

##### Parar proyectos

```shell
./ansible-playbook.sh dev/stop.yml
```

## [repositorio de la prueba técnica de back-end](https://github.com/Nieto35/back-prueba-tecnica.git)