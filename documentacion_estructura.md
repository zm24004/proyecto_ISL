# Estructura de Directorios - Grupo 9

## Directorios Creados en `/proyecto/`

### 📁 Estructura Completa


### 🔐 Configuración de Permisos

#### Directorio `datos/`
- **Grupo propietario:** `soporte`
- **Permisos:** `drwxrwsr-x`
- **SETGID:** Activado ✓
- **Herencia:** Los archivos creados heredan grupo `soporte`

#### Directorio `web/`
- **Grupo propietario:** `web`
- **Permisos:** `drwxrwsr-x`  
- **SETGID:** Activado ✓
- **Herencia:** Los archivos creados heredan grupo `web`

#### Directorios `scripts/` y `capturas/`
- **Permisos:** `drwxr-xr-x`
- **Acceso:** Lectura/ejecución para todos

### 🧪 Comandos de Verificación
```bash
# Ver estructura completa
ls -la /proyecto/

# Ver permisos específicos
ls -ld /proyecto/datos/
ls -ld /proyecto/web/

# Probar herencia de grupos
sudo -u tecnico touch /proyecto/datos/prueba.txt
ls -l /proyecto/datos/prueba.txt
