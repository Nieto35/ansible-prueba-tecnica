FROM alpine:3.19.2

# Instalar paquetes necesarios
RUN apk --update add --no-cache \
    ca-certificates \
    bash \
    curl \
    tar \
    openssh-client \
    git \
    ansible \
    docker-cli-compose \
    rsync && \
    # Limpiar cache de APK
    rm -rf /var/cache/apk/*

# Crear directorios y archivos necesarios
RUN mkdir -p /etc/ansible /ansible/playbooks /www

# Copiar inventario de servidores al contenedor
# COPY hosts.yml /etc/ansible/hosts

# Copiar requisitos de dependencias al contenedor
COPY requirements.yml /ansible/requirements.yml

# Script de inicio para manejar los comandos y argumentos
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Configuración de entorno para Ansible
ENV ANSIBLE_GATHERING=smart
ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV ANSIBLE_RETRY_FILES_ENABLED=false
ENV ANSIBLE_ROLES_PATH=/ansible/playbooks/roles
ENV PYTHONPATH=/ansible/lib
ENV PATH=/ansible/bin:$PATH
ENV ANSIBLE_LIBRARY=/ansible/library

WORKDIR /ansible/playbooks

# Instalar dependencias de Ansible
RUN ansible-galaxy collection install -r /ansible/requirements.yml --force

RUN git config --global --add safe.directory '*'

CMD ["/usr/local/bin/entrypoint.sh"]