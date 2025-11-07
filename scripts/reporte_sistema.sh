#!/bin/bash

echo "=========================================="
echo "     REPORTE DEL SISTEMA - GRUPO 9"
echo "=========================================="

# 1. FECHA Y HORA ACTUAL
echo "📅 Fecha y Hora Actual: $(date)"
echo ""

# 2. NOMBRE DEL HOST DEL SISTEMA
echo "🖥️  Nombre del Host: $(hostname)"
echo ""

# 3. NÚMERO DE USUARIOS CONECTADOS
usuarios_conectados=$(who | wc -l)
echo "👥 Usuarios Conectados: $usuarios_conectados"
echo "   Detalle:"
who | awk '{print "   - " $1 " desde " $5 " (" $3 " " $4 ")"}'
echo ""

# 4. ESPACIO LIBRE EN EL DISCO PRINCIPAL
echo "💾 Espacio en Disco:"
df -h / | awk 'NR==2 {print "   Total: " $2 ", Usado: " $3 ", Libre: " $4 ", Porcentaje: " $5}'
echo ""

# 5. MEMORIA RAM DISPONIBLE
echo "🧠 Memoria RAM:"
free -h | awk 'NR==2 {print "   Total: " $2 ", Usado: " $3 ", Libre: " $4}'
echo ""

# 6. NÚMERO DE CONTENEDORES DOCKER ACTIVOS
if command -v docker &> /dev/null; then
    contenedores_activos=$(docker ps -q | wc -l)
    contenedores_totales=$(docker ps -a -q | wc -l)
    echo "🐳 Contenedores Docker:"
    echo "   Activos: $contenedores_activos"
    echo "   Totales: $contenedores_totales"
    
    # Mostrar contenedores activos si hay alguno
    if [ $contenedores_activos -gt 0 ]; then
        echo "   Contenedores en ejecución:"
        docker ps --format "   - {{.Names}} ({{.Image}})"
    fi
else
    echo "🐳 Docker: No instalado o no disponible"
fi

echo ""
echo "=========================================="
echo "     REPORTE GENERADO: $(date)"
echo "=========================================="


