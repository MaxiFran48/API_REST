# Pruebas de la API REST - Productos

## 1. Crear productos

### Crear Laptop
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Laptop HP Pavilion",
    "descripcion": "Laptop HP Pavilion 15, Intel Core i5, 8GB RAM, 256GB SSD",
    "precio": 45999.99,
    "stock": 15,
    "categoria": "ELECTRONICA"
  }'
```

### Crear Smartphone
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Samsung Galaxy S23",
    "descripcion": "Smartphone Samsung Galaxy S23, 128GB, 8GB RAM",
    "precio": 89999.99,
    "stock": 25,
    "categoria": "ELECTRONICA"
  }'
```

### Crear Remera
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Remera Nike Deportiva",
    "descripcion": "Remera deportiva Nike Dri-FIT, varios colores",
    "precio": 8999.99,
    "stock": 50,
    "categoria": "ROPA"
  }'
```

### Crear Arroz
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Arroz Gallo Oro 1kg",
    "descripcion": "Arroz blanco largo fino Gallo Oro",
    "precio": 1299.99,
    "stock": 100,
    "categoria": "ALIMENTOS"
  }'
```

### Crear Pelota
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Pelota de Fútbol Adidas",
    "descripcion": "Pelota de fútbol profesional Adidas UCL",
    "precio": 15999.99,
    "stock": 30,
    "categoria": "DEPORTES"
  }'
```

## 2. Listar todos los productos
```bash
curl http://localhost:8080/api/productos | jq
```

## 3. Obtener un producto por ID
```bash
curl http://localhost:8080/api/productos/1 | jq
```

## 4. Filtrar por categoría
```bash
curl http://localhost:8080/api/productos/categoria/ELECTRONICA | jq
```

## 5. Actualizar producto completo (PUT)
```bash
curl -X PUT http://localhost:8080/api/productos/1 \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Laptop HP Pavilion 15 ACTUALIZADA",
    "descripcion": "Laptop HP Pavilion 15, Intel Core i7, 16GB RAM, 512GB SSD",
    "precio": 65999.99,
    "stock": 10,
    "categoria": "ELECTRONICA"
  }' | jq
```

## 6. Actualizar stock (PATCH)
```bash
curl -X PATCH http://localhost:8080/api/productos/1/stock \
  -H "Content-Type: application/json" \
  -d '{"stock": 100}' | jq
```

## 7. Eliminar producto
```bash
curl -X DELETE http://localhost:8080/api/productos/5
```

## 8. Pruebas de validación (errores esperados)

### Error 400 - Nombre vacío
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "",
    "descripcion": "Test",
    "precio": 100.0,
    "stock": 10,
    "categoria": "ELECTRONICA"
  }' | jq
```

### Error 400 - Precio negativo
```bash
curl -X POST http://localhost:8080/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Producto Test",
    "descripcion": "Test",
    "precio": -100.0,
    "stock": 10,
    "categoria": "ELECTRONICA"
  }' | jq
```

### Error 404 - Producto no existe
```bash
curl http://localhost:8080/api/productos/999 | jq
```

## Accesos importantes

- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **H2 Console**: http://localhost:8080/h2-console
  - JDBC URL: `jdbc:h2:mem:productosdb`
  - Usuario: `sa`
  - Password: (vacío)
- **API Docs (JSON)**: http://localhost:8080/api-docs

