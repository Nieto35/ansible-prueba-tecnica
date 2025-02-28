#!/bin/bash

# Detectar entorno no compatible
if [ -z "$BASH_VERSION" ] && [ -z "$ZSH_VERSION" ]; then
    echo "Unsupported shell environment."
    exit 1
fi

docker run \
    --rm \
    -it \
    --env HOST_ROOT=$(pwd) \
    -v $(pwd)/ansible:/ansible \
    -v $(pwd)/www:/www \
    -v /var/run/docker.sock:/var/run/docker.sock \
    project/ansible \
    ansible-playbook "$@"
