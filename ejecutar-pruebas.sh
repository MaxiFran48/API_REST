#!/bin/bash

echo "======================================"
echo "INICIANDO APLICACIÓN"
echo "======================================"

cd /home/maxi/Escritorio/Facu/Java/productos-api

# Matar procesos anteriores
pkill -f productos-api 2>/dev/null
sleep 3

# Iniciar aplicación
./mvnw spring-boot:run > /tmp/app-output.log 2>&1 &
APP_PID=$!

echo "Esperando que la aplicación inicie (40 segundos)..."
sleep 40

# Verificar que la app está corriendo
if ! curl -s http://localhost:8080/api/productos > /dev/null 2>&1; then
    echo "ERROR: La aplicación no está respondiendo"
    tail -100 /tmp/app-output.log
    exit 1
fi

echo ""
echo "======================================"
echo "1. CREAR PRODUCTOS"
echo "======================================"

echo ""
echo "--- Creando Laptop HP Pavilion ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Laptop HP Pavilion","descripcion":"Laptop HP Pavilion 15, Intel Core i5, 8GB RAM, 256GB SSD","precio":45999.99,"stock":15,"categoria":"ELECTRONICA"}' | jq '.'

echo ""
echo "--- Creando Samsung Galaxy S23 ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Samsung Galaxy S23","descripcion":"Smartphone Samsung Galaxy S23, 128GB, 8GB RAM","precio":89999.99,"stock":25,"categoria":"ELECTRONICA"}' | jq '.'

echo ""
echo "--- Creando Remera Nike ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Remera Nike Deportiva","descripcion":"Remera deportiva Nike Dri-FIT, varios colores","precio":8999.99,"stock":50,"categoria":"ROPA"}' | jq '.'

echo ""
echo "--- Creando Arroz Gallo Oro ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Arroz Gallo Oro 1kg","descripcion":"Arroz blanco largo fino Gallo Oro","precio":1299.99,"stock":100,"categoria":"ALIMENTOS"}' | jq '.'

echo ""
echo "--- Creando Pelota de Fútbol ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Pelota de Fútbol Adidas","descripcion":"Pelota de fútbol profesional Adidas UCL","precio":15999.99,"stock":30,"categoria":"DEPORTES"}' | jq '.'

echo ""
echo "======================================"
echo "2. LISTAR TODOS LOS PRODUCTOS"
echo "======================================"
curl -s http://localhost:8080/api/productos | jq '.'

echo ""
echo "======================================"
echo "3. OBTENER PRODUCTO POR ID (ID=1)"
echo "======================================"
curl -s http://localhost:8080/api/productos/1 | jq '.'

echo ""
echo "======================================"
echo "4. FILTRAR POR CATEGORÍA (ELECTRONICA)"
echo "======================================"
curl -s http://localhost:8080/api/productos/categoria/ELECTRONICA | jq '.'

echo ""
echo "======================================"
echo "5. ACTUALIZAR PRODUCTO COMPLETO (PUT)"
echo "======================================"
curl -s -X PUT http://localhost:8080/api/productos/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Laptop HP Pavilion 15 ACTUALIZADA","descripcion":"Laptop HP Pavilion 15, Intel Core i7, 16GB RAM, 512GB SSD","precio":65999.99,"stock":10,"categoria":"ELECTRONICA"}' | jq '.'

echo ""
echo "======================================"
echo "6. ACTUALIZAR STOCK (PATCH)"
echo "======================================"
curl -s -X PATCH http://localhost:8080/api/productos/1/stock \
  -H "Content-Type: application/json" \
  -d '{"stock":100}' | jq '.'

echo ""
echo "======================================"
echo "7. ELIMINAR PRODUCTO (ID=5)"
echo "======================================"
curl -s -X DELETE http://localhost:8080/api/productos/5 -w "\nHTTP Status: %{http_code}\n"

echo ""
echo "======================================"
echo "8. PRUEBAS DE VALIDACIÓN - ERROR 400"
echo "======================================"

echo ""
echo "--- Error: Nombre vacío ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"","descripcion":"Test","precio":100.0,"stock":10,"categoria":"ELECTRONICA"}' | jq '.'

echo ""
echo "--- Error: Precio negativo ---"
curl -s -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Producto Test","descripcion":"Test","precio":-100.0,"stock":10,"categoria":"ELECTRONICA"}' | jq '.'

echo ""
echo "======================================"
echo "9. PRUEBA DE ERROR 404"
echo "======================================"
curl -s http://localhost:8080/api/productos/999 | jq '.'

echo ""
echo "======================================"
echo "TODAS LAS PRUEBAS COMPLETADAS"
echo "======================================"

# Matar la aplicación
kill $APP_PID 2>/dev/null

