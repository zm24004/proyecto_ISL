#!/bin/bash

echo "=========================================="
echo "CONFIGURACIÓN SERVIDOR - GRUPO 9"
echo "=========================================="

# 1. CONFIGURAR HOSTNAME
echo "1. Configurando hostname..."
sudo hostnamectl set-hostname servidor-grupo9
echo "127.0.1.1    servidor-grupo9" | sudo tee -a /etc/hosts

# 2. CREAR GRUPOS
echo "2. Creando grupos..."
sudo groupadd -f soporte
sudo groupadd -f web

# 3. CREAR USUARIOS
echo "3. Creando usuarios..."
# Crear adminsys
sudo useradd -m -s /bin/bash adminsys 2>/dev/null
echo "adminsys:Admin123!" | sudo chpasswd

# Crear técnico
sudo useradd -m -s /bin/bash tecnico 2>/dev/null
echo "tecnico:Tecnico123!" | sudo chpasswd

# Crear visitante
sudo useradd -m -s /bin/bash visitante 2>/dev/null
echo "visitante:Visitante123!" | sudo chpasswd

# 4. ASIGNAR PRIVILEGIOS Y GRUPOS
echo "4. Asignando privilegios y grupos..."
sudo usermod -aG sudo adminsys
sudo usermod -aG soporte tecnico
sudo usermod -aG web visitante

echo "=========================================="
echo "CONFIGURACIÓN COMPLETADA"
echo "=========================================="
