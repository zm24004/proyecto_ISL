#!/bin/bash

echo "=== CONFIGURACIÓN SERVIDOR GRUPO 9 ==="

# Configurar hostname
sudo hostnamectl set-hostname servidor-grupo9
echo "127.0.1.1    servidor-grupo9" | sudo tee -a /etc/hosts

# Crear grupos
sudo groupadd -f soporte
sudo groupadd -f web

# Crear usuarios si no existen
if ! id "adminsys" &>/dev/null; then
    sudo useradd -m -s /bin/bash adminsys
    echo "adminsys:password123" | sudo chpasswd
    sudo usermod -aG sudo adminsys
fi

if ! id "tecnico" &>/dev/null; then
    sudo useradd -m -s /bin/bash tecnico
    echo "tecnico:password123" | sudo chpasswd
    sudo usermod -aG soporte tecnico
fi

if ! id "visitante" &>/dev/null; then
    sudo useradd -m -s /bin/bash visitante
    echo "visitante:password123" | sudo chpasswd
    sudo usermod -aG web visitante
fi

echo "=== CONFIGURACIÓN COMPLETADA ==="
echo "Hostname: $(hostname)"
echo "Usuarios creados: adminsys, tecnico, visitante"
echo "Grupos creados: soporte, web"


