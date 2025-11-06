# Proyecto ISL - Grupo 9
## Administración Básica del Sistema

### Especificaciones Implementadas:

#### 1. Hostname Configurado
- **Nombre del host:** servidor-grupo9

#### 2. Usuarios del Sistema
- **adminsys:** Usuario administrativo con privilegios sudo
- **tecnico:** Usuario técnico del área de soporte
- **visitante:** Usuario visitante para acceso web

#### 3. Grupos del Sistema
- **soporte:** Grupo para personal técnico
- **web:** Grupo para usuarios visitantes

#### 4. Asignaciones Realizadas
- adminsys → Grupo: sudo (privilegios administrativos)
- técnico → Grupo: soporte
- visitante → Grupo: web

#### 5. Comandos de Verificación
```bash
# Ver hostname
hostname

# Ver usuarios
getent passwd adminsys tecnico visitante

# Ver grupos
getent group soporte web

# Ver privilegios
groups adminsys tecnico visitante


