#!/bin/bash

# Definir el directorio base
directorio_bbdd="$HOME/d20cards"

# Función para copiar archivos
copiar_archivos() {
    cp -f ./docker-compose.yml "$directorio_bbdd/"
    cp -f ./.env "$directorio_bbdd/"
}

# Verificar si el directorio existe
if [ ! -d "$directorio_bbdd" ]; then
    # Crear directorio si no existe
    mkdir -p "$directorio_bbdd"
    copiar_archivos
else
    # Limpiar el contenido del directorio
    rm -rf "$directorio_bbdd"/*
    copiar_archivos
fi

# Cambiar a la ubicación del directorio
cd "$directorio_bbdd"

# Crear el contenido del archivo setup.sh
volcado="docker network create d20-network
docker-compose up --build
docker-compose up -d"

# Escribir el contenido en el archivo setup.sh
echo "$volcado" > "$directorio_bbdd/setup.sh"

# Dar permisos de ejecución al script
chmod +x "$directorio_bbdd/setup.sh"

# Ejecutar el script setup.sh
"$directorio_bbdd/setup.sh"
