#!/bin/bash

echo "=========================================="
echo "CREACIÓN ESTRUCTURA DIRECTORIOS - GRUPO 9"
echo "=========================================="

# 1. CREAR DIRECTORIOS
echo "1. Creando estructura de directorios en /proyecto/..."
sudo mkdir -p /proyecto/{datos,web,scripts,capturas}

# 2. ASIGNAR GRUPOS
echo "2. Asignando grupos a los directorios..."
sudo chgrp soporte /proyecto/datos
sudo chgrp web /proyecto/web

# 3. CONFIGURAR HERENCIA DE GRUPOS (SETGID)
echo "3. Configurando herencia de grupos..."
sudo chmod g+s /proyecto/datos
sudo chmod g+s /proyecto/web

# 4. ASIGNAR PERMISOS
echo "4. Asignando permisos..."
sudo chmod 775 /proyecto/datos
sudo chmod 775 /proyecto/web
sudo chmod 755 /proyecto/scripts
sudo chmod 755 /proyecto/capturas

echo "=========================================="
echo "ESTRUCTURA CREADA EXITOSAMENTE"
echo "=========================================="


