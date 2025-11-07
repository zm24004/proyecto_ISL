#!/bin/bash

echo "=========================================="
echo "VERIFICACIÓN ESTRUCTURA DIRECTORIOS - GRUPO 9"
echo "=========================================="

# Verificar que existe el directorio /proyecto/
if [ -d "/proyecto" ]; then
    echo "✓ Directorio /proyecto/ existe"
else
    echo "✗ Directorio /proyecto/ NO existe"
    exit 1
fi

echo ""
echo "✓ ESTRUCTURA DE DIRECTORIOS:"
ls -la /proyecto/

echo ""
echo "✓ VERIFICACIÓN DE GRUPOS Y PERMISOS:"

# Verificar directorio datos
echo "📁 /proyecto/datos/"
echo "   Grupo: $(ls -ld /proyecto/datos/ | awk '{print $4}')"
echo "   Permisos: $(ls -ld /proyecto/datos/ | awk '{print $1}')"
echo "   SETGID: $(if ls -ld /proyecto/datos/ | grep -q "s"; then echo "ACTIVADO ✓"; else echo "DESACTIVADO ✗"; fi)"

# Verificar directorio web
echo "📁 /proyecto/web/"
echo "   Grupo: $(ls -ld /proyecto/web/ | awk '{print $4}')"
echo "   Permisos: $(ls -ld /proyecto/web/ | awk '{print $1}')"
echo "   SETGID: $(if ls -ld /proyecto/web/ | grep -q "s"; then echo "ACTIVADO ✓"; else echo "DESACTIVADO ✗"; fi)"

echo ""
echo "✓ PRUEBA DE HERENCIA DE GRUPOS:"

# Probar herencia en datos
sudo touch /proyecto/datos/archivo_prueba.txt
echo "   Archivo en datos/: $(ls -l /proyecto/datos/archivo_prueba.txt | awk '{print $4}')"

# Probar herencia en web
sudo touch /proyecto/web/archivo_prueba.txt
echo "   Archivo en web/: $(ls -l /proyecto/web/archivo_prueba.txt | awk '{print $4}')"

# Limpiar archivos de prueba
sudo rm -f /proyecto/datos/archivo_prueba.txt /proyecto/web/archivo_prueba.txt

echo ""
echo "=========================================="
echo "VERIFICACIÓN COMPLETADA"
echo "=========================================="
