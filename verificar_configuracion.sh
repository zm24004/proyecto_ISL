#!/bin/bash

echo "=========================================="
echo "VERIFICACIÓN CONFIGURACIÓN - GRUPO 9"
echo "=========================================="

# Verificar hostname
echo "✓ Hostname: $(hostname)"
echo ""

# Verificar usuarios
echo "✓ USUARIOS CREADOS:"
echo "  - adminsys: $(if id "adminsys" &>/dev/null; then echo "EXISTE"; else echo "NO EXISTE"; fi)"
echo "  - tecnico: $(if id "tecnico" &>/dev/null; then echo "EXISTE"; else echo "NO EXISTE"; fi)"
echo "  - visitante: $(if id "visitante" &>/dev/null; then echo "EXISTE"; else echo "NO EXISTE"; fi)"
echo ""

# Verificar grupos
echo "✓ GRUPOS CREADOS:"
echo "  - soporte: $(if getent group "soporte" &>/dev/null; then echo "EXISTE"; else echo "NO EXISTE"; fi)"
echo "  - web: $(if getent group "web" &>/dev/null; then echo "EXISTE"; else echo "NO EXISTE"; fi)"
echo ""

# Verificar privilegios y membresías
echo "✓ PRIVILEGIOS Y MEMBRESÍAS:"
echo "  - adminsys: $(groups adminsys 2>/dev/null || echo 'Usuario no existe')"
echo "  - tecnico: $(groups tecnico 2>/dev/null || echo 'Usuario no existe')"
echo "  - visitante: $(groups visitante 2>/dev/null || echo 'Usuario no existe')"
echo ""

# Verificar sudo privileges
echo "✓ VERIFICACIÓN SUDO:"
if groups adminsys | grep -q "sudo"; then
    echo "  - adminsys: TIENE privilegios sudo ✓"
else
    echo "  - adminsys: NO TIENE privilegios sudo ✗"
fi
echo ""

echo "=========================================="
if [ "$(hostname)" = "servidor-grupo9" ] && \
   id adminsys &>/dev/null && \
   id tecnico &>/dev/null && \
   id visitante &>/dev/null && \
   getent group soporte &>/dev/null && \
   getent group web &>/dev/null && \
   groups adminsys | grep -q "sudo"; then
    echo "✅ CONFIGURACIÓN EXITOSA - TODO CORRECTO"
else
    echo "❌ HAY ERRORES EN LA CONFIGURACIÓN"
fi
echo "=========================================="
