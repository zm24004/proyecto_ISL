
#!/bin/bash

echo "=== VERIFICACIÓN CONFIGURACIÓN GRUPO 9 ==="
echo ""
echo "1. Hostname: $(hostname)"
echo ""
echo "2. Usuarios:"
echo "   - adminsys: $(id adminsys 2>/dev/null && groups adminsys || echo 'No existe')"
echo "   - tecnico: $(id tecnico 2>/dev/null && groups tecnico || echo 'No existe')"
echo "   - visitante: $(id visitante 2>/dev/null && groups visitante || echo 'No existe')"
echo ""
echo "3. Grupos:"
getent group soporte web
echo ""
echo "4. Servicios:"
docker --version 2>/dev/null && echo "Docker: Instalado" || echo "Docker: No instalado"
git --version 2>/dev/null && echo "Git: Instalado" || echo "Git: No instalado"
echo ""
echo "=== VERIFICACIÓN COMPLETADA ==="
