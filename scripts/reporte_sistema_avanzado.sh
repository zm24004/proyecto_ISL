
#!/bin/bash


echo "=========================================="

echo "  REPORTE AVANZADO DEL SISTEMA - GRUPO 9"

echo "=========================================="


# FUNCIÓN PARA FORMATO DE COLOR

verde() { echo -e "\033[32m$1\033[0m"; }

rojo() { echo -e "\033[31m$1\033[0m"; }

azul() { echo -e "\033[34m$1\033[0m"; }


# 1. INFORMACIÓN BÁSICA DEL SISTEMA

azul "📊 INFORMACIÓN BÁSICA:"

echo "   Hostname: $(hostname)"

echo "   Sistema: $(lsb_release -d | cut -f2)"

echo "   Kernel: $(uname -r)"

echo "   Arquitectura: $(uname -m)"

echo "   Uptime: $(uptime -p)"

echo ""


# 2. FECHA Y HORA

azul "📅 FECHA Y HORA:"

echo "   Actual: $(date)"

echo "   Zona Horaria: $(timedatectl show --property=Timezone --value)"

echo ""


# 3. USUARIOS Y SESIONES

azul "👥 USUARIOS:"

usuarios_unicos=$(who | awk '{print $1}' | sort | uniq | wc -l)

echo "   Conectados ahora: $(who | wc -l)"

echo "   Usuarios únicos: $usuarios_unicos"

echo "   Sesiones activas:"

who | awk '{print "   - " $1 " en " $5 " (" $3 " " $4 ")"}'

echo ""


# 4. ESTADO DEL DISCO

azul "💾 ALMACENAMIENTO:"

echo "   Disco principal (/):"

df -h / | awk 'NR==2 {print "     Total: " $2 " | Usado: " $3 " | Libre: " $4 " | " $5}'


# Espacio en /proyecto si existe

if [ -d "/proyecto" ]; then

    echo "   Directorio /proyecto/:"

    du -sh /proyecto | awk '{print "     Tamaño: " $1}'

fi

echo ""


# 5. MEMORIA Y SWAP

azul "🧠 MEMORIA:"

echo "   RAM:"

free -h | awk 'NR==2 {print "     Total: " $2 " | Usado: " $3 " | Libre: " $4 " | Cache: " $6}'

echo "   Swap:"

free -h | awk 'NR==3 {print "     Total: " $2 " | Usado: " $3 " | Libre: " $4}'

echo ""


# 6. CONTENEDORES DOCKER

azul "🐳 DOCKER:"

if command -v docker &> /dev/null; then

    contenedores_activos=$(docker ps -q | wc -l)

    contenedores_totales=$(docker ps -a -q | wc -l)

    imagenes=$(docker images -q | wc -l)

    

    echo "   Contenedores activos: $contenedores_activos"

    echo "   Contenedores totales: $contenedores_totales"

    echo "   Imágenes descargadas: $imagenes"

    

    if [ $contenedores_activos -gt 0 ]; then

        echo "   Contenedores en ejecución:"

        docker ps --format "     - {{.Names}} ({{.Image}}) [{{.Status}}]"

    fi

else

    rojo "   Docker no está instalado"

fi

echo ""


# 7. CARGA DEL SISTEMA

azul "⚡ CARGA DEL SISTEMA:"

echo "   Load Average: $(uptime | awk -F'load average:' '{print $2}')"

echo "   Procesos activos: $(ps aux | wc -l)"

echo ""


# 8. CONEXIONES DE RED

azul "🌐 RED:"

interfaz_principal=$(ip route | grep default | awk '{print $5}' | head -1)

if [ ! -z "$interfaz_principal" ]; then

    ip_address=$(ip addr show $interfaz_principal | grep 'inet ' | awk '{print $2}')

    echo "   Interfaz principal: $interfaz_principal"

    echo "   Dirección IP: $ip_address"

else

    echo "   No se detectó interfaz de red principal"

fi

echo ""


echo "=========================================="

verde "  REPORTE GENERADO: $(date)"

echo "=========================================="



