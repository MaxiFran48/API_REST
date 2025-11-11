# 🚀 GUÍA RÁPIDA - CÓMO ENTREGAR EL TP

## 1️⃣ VERIFICAR QUE TODO FUNCIONA

```bash
cd /home/maxi/Escritorio/Facu/Java/productos-api

# Iniciar la aplicación
./mvnw spring-boot:run
```

Espera 30 segundos y verifica:
- ✅ Swagger UI: http://localhost:8080/swagger-ui.html
- ✅ H2 Console: http://localhost:8080/h2-console
- ✅ API: http://localhost:8080/api/productos

---

## 2️⃣ EJECUTAR PRUEBAS (OPCIONAL)

```bash
# Ejecutar todas las pruebas
./ejecutar-pruebas.sh

# Los resultados se guardan en: resultados-pruebas.txt
```

---

## 3️⃣ INICIALIZAR GIT

```bash
# Ejecutar el script de inicialización
./inicializar-git.sh
```

Este script:
- ✅ Inicializa el repositorio Git
- ✅ Agrega todos los archivos
- ✅ Crea el primer commit con descripción completa

---

## 4️⃣ CREAR REPOSITORIO EN GITHUB

1. Ir a: https://github.com/new
2. Crear repositorio llamado: `productos-api`
3. Dejar **sin inicializar** (no marcar README, .gitignore, ni license)
4. Click en "Create repository"

---

## 5️⃣ SUBIR A GITHUB

```bash
# Reemplazar TU-USUARIO con tu usuario de GitHub
git remote add origin https://github.com/TU-USUARIO/productos-api.git
git branch -M main
git push -u origin main
```

**Ejemplo:**
```bash
git remote add origin https://github.com/maximofran/productos-api.git
git branch -M main
git push -u origin main
```

---

## 6️⃣ VERIFICAR EN GITHUB

1. Ir a: https://github.com/TU-USUARIO/productos-api
2. Verificar que todos los archivos estén subidos:
   - ✅ src/ (con todas las clases Java)
   - ✅ README.md (con toda la documentación)
   - ✅ pom.xml
   - ✅ PRUEBAS.md
   - ✅ EVIDENCIAS-PRUEBAS.md
   - ✅ resultados-pruebas.txt
   - ✅ Scripts (.sh)

---

## 7️⃣ ENTREGAR EN MOODLE

1. Copiar la URL de tu repositorio:
   ```
   https://github.com/TU-USUARIO/productos-api
   ```

2. Ir a la tarea en Moodle

3. Pegar el link del repositorio

4. Agregar un comentario (opcional):
   ```
   Trabajo Práctico: API REST para Gestión de Productos
   
   Repositorio: https://github.com/TU-USUARIO/productos-api
   
   Incluye:
   - Código fuente completo (13 clases Java)
   - README.md con documentación completa y evidencias
   - Pruebas automatizadas con resultados
   - Documentación adicional en archivos MD
   
   Alumno: Maximo Fran
   Legajo: 50903
   ```

5. **Enviar la tarea**

---

## ✅ CHECKLIST FINAL

Antes de entregar, verificar:

- [ ] La aplicación compila sin errores
- [ ] Todos los endpoints funcionan correctamente
- [ ] Swagger UI es accesible
- [ ] README.md tiene toda la documentación
- [ ] El repositorio Git está inicializado
- [ ] Todos los archivos están en GitHub
- [ ] El link del repositorio funciona
- [ ] La tarea está enviada en Moodle

---

## 🆘 SOLUCIÓN DE PROBLEMAS

### Si la aplicación no inicia:
```bash
# Matar procesos anteriores
pkill -f productos-api

# Limpiar y recompilar
./mvnw clean package -DskipTests

# Iniciar nuevamente
./mvnw spring-boot:run
```

### Si Git da error de autenticación:
1. Ir a GitHub → Settings → Developer Settings → Personal Access Tokens
2. Crear un token con permisos de "repo"
3. Usar el token como contraseña al hacer push

### Si no puedes hacer push:
```bash
# Verificar remote
git remote -v

# Si está mal configurado, eliminarlo y agregarlo de nuevo
git remote remove origin
git remote add origin https://github.com/TU-USUARIO/productos-api.git
git push -u origin main
```

---

## 📋 ARCHIVOS IMPORTANTES

| Archivo | Descripción | Imprescindible |
|---------|-------------|----------------|
| README.md | Documentación principal con evidencias | ✅ SÍ |
| src/main/java/ | Todo el código fuente | ✅ SÍ |
| pom.xml | Dependencias Maven | ✅ SÍ |
| application.properties | Configuración | ✅ SÍ |
| PRUEBAS.md | Comandos de prueba | 📝 Recomendado |
| EVIDENCIAS-PRUEBAS.md | Capturas textuales | 📝 Recomendado |
| resultados-pruebas.txt | Salidas reales | 📝 Recomendado |

---

## 💡 CONSEJOS

✅ **HAZ:** Revisar el README.md antes de entregar  
✅ **HAZ:** Verificar que el link de GitHub funcione  
✅ **HAZ:** Hacer un último commit si agregas algo  
❌ **NO HAGAS:** Modificar archivos después de entregar sin nuevo commit  
❌ **NO HAGAS:** Olvidar agregar tu nombre y legajo  

---

## 🎯 ENTREGA EXITOSA

Si completaste todos los pasos:
1. ✅ Tu código está en GitHub
2. ✅ El README tiene toda la documentación
3. ✅ Las pruebas están documentadas
4. ✅ El link está en Moodle

**¡FELICITACIONES! TU TP ESTÁ ENTREGADO** 🎉

---

**Última actualización:** 11/11/2025  
**Autor:** Asistente para Maximo Fran (Legajo 50903)

