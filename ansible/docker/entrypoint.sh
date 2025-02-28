#!/bin/bash
set -e

if [ "$#" -gt 0 ]; then
    # Si se han proporcionado argumentos, ejecutarlos como un comando
    exec "$@"
else
    exec ansible --version
fi