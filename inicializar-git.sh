#!/bin/bash

echo "=========================================="
echo "  Inicializando Repositorio Git"
echo "  Proyecto: productos-api"
echo "  Autor: Maximo Fran (Legajo 50903)"
echo "=========================================="
echo ""

cd /home/maxi/Escritorio/Facu/Java/productos-api

# Verificar si ya existe .git
if [ -d ".git" ]; then
    echo "⚠️  Ya existe un repositorio Git inicializado"
    read -p "¿Deseas reinicializar? (s/n): " respuesta
    if [ "$respuesta" != "s" ]; then
        echo "Cancelado."
        exit 0
    fi
    rm -rf .git
fi

echo "📦 Inicializando repositorio Git..."
git init

echo ""
echo "📝 Agregando archivos al staging..."
git add .

echo ""
echo "💾 Creando primer commit..."
git commit -m "feat: implementación completa API REST para gestión de productos

- Arquitectura en capas (model, dto, repository, service, controller, exception)
- Entidad Producto con JPA y enum Categoria
- DTOs con validaciones (ProductoDTO, ProductoResponseDTO, ActualizarStockDTO)
- Repository con Spring Data JPA
- Service con lógica de negocio y mappers
- Controller REST con todos los endpoints CRUD
- Manejo global de excepciones con @ControllerAdvice
- Documentación completa con Swagger/OpenAPI
- Base de datos H2 en memoria
- README.md profesional con ejemplos y evidencias
- Scripts de pruebas automatizadas
- Todas las pruebas pasando exitosamente

Desarrollado por: Maximo Fran
Legajo: 50903
Fecha: 11/11/2025"

echo ""
echo "✅ Repositorio Git inicializado exitosamente!"
echo ""
echo "📋 Próximos pasos para subir a GitHub:"
echo ""
echo "1. Crea un repositorio en GitHub (ejemplo: productos-api)"
echo ""
echo "2. Ejecuta estos comandos:"
echo "   git remote add origin https://github.com/TU-USUARIO/productos-api.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Tu repositorio estará disponible en:"
echo "   https://github.com/TU-USUARIO/productos-api"
echo ""
echo "=========================================="
echo "  Git inicializado correctamente ✅"
echo "=========================================="

