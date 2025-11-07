#!/bin/bash


# Script para programar ejecución automática del reporte


echo "Programando monitoreo automático del sistema..."


# Crear directorio para logs si no existe

sudo mkdir -p /proyecto/datos/logs


# Agregar tarea cron para ejecutar cada hora

(crontab -l 2>/dev/null; echo "0 * * * * /proyecto/scripts/reporte_sistema.sh >> /proyecto/datos/logs/reporte_sistema.log 2>&1") | crontab -


# Agregar tarea para ejecutar al inicio del sistema

(crontab -l 2>/dev/null; echo "@reboot /proyecto/scripts/reporte_sistema.sh >> /proyecto/datos/logs/reporte_boot.log 2>&1") | crontab -


echo "Tareas programadas:"

crontab -l


echo ""

echo "Los reportes se guardarán en: /proyecto/datos/logs/"


