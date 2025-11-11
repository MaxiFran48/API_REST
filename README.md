  "path": "/api/productos"
}
```

**Intento de obtener producto inexistente (404 Not Found):**
```json
{
  "timestamp": "2025-11-11 00:16:45",
  "status": 404,
  "error": "Not Found",
  "mensaje": "No se encontró el producto con ID: 999",
  "path": "/api/productos/999"
}
```

---

## 📸 Pruebas y Resultados de la API

A continuación se muestran las salidas de consola de todas las pruebas realizadas sobre la API:

### 1. Creación de Productos (POST)

**Creando Laptop HP Pavilion:**
```json
{
  "id": 1,
  "nombre": "Laptop HP Pavilion",
  "descripcion": "Laptop HP Pavilion 15, Intel Core i5, 8GB RAM, 256GB SSD",
  "precio": 45999.99,
  "stock": 15,
  "categoria": "ELECTRONICA"
}
```
✅ **Código de respuesta: 201 Created**

**Creando Samsung Galaxy S23:**
```json
{
  "id": 2,
  "nombre": "Samsung Galaxy S23",
  "descripcion": "Smartphone Samsung Galaxy S23, 128GB, 8GB RAM",
  "precio": 89999.99,
  "stock": 25,
  "categoria": "ELECTRONICA"
}
```
✅ **Código de respuesta: 201 Created**

**Creando Remera Nike Deportiva:**
```json
{
  "id": 3,
  "nombre": "Remera Nike Deportiva",
  "descripcion": "Remera deportiva Nike Dri-FIT, varios colores",
  "precio": 8999.99,
  "stock": 50,
  "categoria": "ROPA"
}
```
✅ **Código de respuesta: 201 Created**

**Creando Arroz Gallo Oro:**
```json
{
  "id": 4,
  "nombre": "Arroz Gallo Oro 1kg",
  "descripcion": "Arroz blanco largo fino Gallo Oro",
  "precio": 1299.99,
  "stock": 100,
  "categoria": "ALIMENTOS"
}
```
✅ **Código de respuesta: 201 Created**

**Creando Pelota de Fútbol Adidas:**
```json
{
  "id": 5,
  "nombre": "Pelota de Fútbol Adidas",
  "descripcion": "Pelota de fútbol profesional Adidas UCL",
  "precio": 15999.99,
  "stock": 30,
  "categoria": "DEPORTES"
}
```
✅ **Código de respuesta: 201 Created**

### 2. Listar Todos los Productos (GET)

**Solicitud:** `GET /api/productos`

**Respuesta:**
```json
[
  {
    "id": 1,
    "nombre": "Laptop HP Pavilion",
    "descripcion": "Laptop HP Pavilion 15, Intel Core i5, 8GB RAM, 256GB SSD",
    "precio": 45999.99,
    "stock": 15,
    "categoria": "ELECTRONICA"
  },
  {
    "id": 2,
    "nombre": "Samsung Galaxy S23",
    "descripcion": "Smartphone Samsung Galaxy S23, 128GB, 8GB RAM",
    "precio": 89999.99,
    "stock": 25,
    "categoria": "ELECTRONICA"
  },
  {
    "id": 3,
    "nombre": "Remera Nike Deportiva",
    "descripcion": "Remera deportiva Nike Dri-FIT, varios colores",
    "precio": 8999.99,
    "stock": 50,
    "categoria": "ROPA"
  },
  {
    "id": 4,
    "nombre": "Arroz Gallo Oro 1kg",
    "descripcion": "Arroz blanco largo fino Gallo Oro",
    "precio": 1299.99,
    "stock": 100,
    "categoria": "ALIMENTOS"
  },
  {
    "id": 5,
    "nombre": "Pelota de Fútbol Adidas",
    "descripcion": "Pelota de fútbol profesional Adidas UCL",
    "precio": 15999.99,
    "stock": 30,
    "categoria": "DEPORTES"
  }
]
```
✅ **Código de respuesta: 200 OK** - Se listaron 5 productos correctamente

### 3. Obtener Producto por ID (GET)

**Solicitud:** `GET /api/productos/1`

**Respuesta:**
```json
{
  "id": 1,
  "nombre": "Laptop HP Pavilion",
  "descripcion": "Laptop HP Pavilion 15, Intel Core i5, 8GB RAM, 256GB SSD",
  "precio": 45999.99,
  "stock": 15,
  "categoria": "ELECTRONICA"
}
```
✅ **Código de respuesta: 200 OK** - Producto encontrado exitosamente

### 4. Filtrar por Categoría (GET)

**Solicitud:** `GET /api/productos/categoria/ELECTRONICA`

**Respuesta:**
```json
[
  {
    "id": 1,
    "nombre": "Laptop HP Pavilion",
    "descripcion": "Laptop HP Pavilion 15, Intel Core i5, 8GB RAM, 256GB SSD",
    "precio": 45999.99,
    "stock": 15,
    "categoria": "ELECTRONICA"
  },
  {
    "id": 2,
    "nombre": "Samsung Galaxy S23",
    "descripcion": "Smartphone Samsung Galaxy S23, 128GB, 8GB RAM",
    "precio": 89999.99,
    "stock": 25,
    "categoria": "ELECTRONICA"
  }
]
```
✅ **Código de respuesta: 200 OK** - Filtro por categoría funcionando correctamente

### 5. Actualizar Producto Completo (PUT)

**Solicitud:** `PUT /api/productos/1`
```json
{
  "nombre": "Laptop HP Pavilion 15 ACTUALIZADA",
  "descripcion": "Laptop HP Pavilion 15, Intel Core i7, 16GB RAM, 512GB SSD",
  "precio": 65999.99,
  "stock": 10,
  "categoria": "ELECTRONICA"
}
```

**Respuesta:**
```json
{
  "id": 1,
  "nombre": "Laptop HP Pavilion 15 ACTUALIZADA",
  "descripcion": "Laptop HP Pavilion 15, Intel Core i7, 16GB RAM, 512GB SSD",
  "precio": 65999.99,
  "stock": 10,
  "categoria": "ELECTRONICA"
}
```
✅ **Código de respuesta: 200 OK** - Producto actualizado completamente

### 6. Actualizar Solo Stock (PATCH)

**Solicitud:** `PATCH /api/productos/1/stock`
```json
{
  "stock": 100
}
```

**Respuesta:**
```json
{
  "id": 1,
  "nombre": "Laptop HP Pavilion 15 ACTUALIZADA",
  "descripcion": "Laptop HP Pavilion 15, Intel Core i7, 16GB RAM, 512GB SSD",
  "precio": 65999.99,
  "stock": 100,
  "categoria": "ELECTRONICA"
}
```
✅ **Código de respuesta: 200 OK** - Stock actualizado correctamente (de 10 a 100)

### 7. Eliminar Producto (DELETE)

**Solicitud:** `DELETE /api/productos/5`

**Respuesta:**
```
HTTP Status: 204 No Content
```
✅ **Código de respuesta: 204 No Content** - Producto eliminado exitosamente

### 8. Pruebas de Validación - Error 400

**Error: Nombre vacío**

**Solicitud:** `POST /api/productos` con nombre vacío
```json
{
  "nombre": "",
  "descripcion": "Test",
  "precio": 100.0,
  "stock": 10,
  "categoria": "ELECTRONICA"
}
```

**Respuesta:**
```json
{
  "path": "/api/productos",
  "mensaje": "Error de validación",
  "error": "Bad Request",
  "errores": {
    "nombre": "El nombre debe tener entre 3 y 100 caracteres"
  },
  "timestamp": "2025-11-11T00:30:23.375357941",
  "status": 400
}
```
✅ **Código de respuesta: 400 Bad Request** - Validación funcionando correctamente

**Error: Precio negativo**

**Solicitud:** `POST /api/productos` con precio negativo
```json
{
  "nombre": "Producto Test",
  "descripcion": "Test",
  "precio": -100.0,
  "stock": 10,
  "categoria": "ELECTRONICA"
}
```

**Respuesta:**
```json
{
  "path": "/api/productos",
  "mensaje": "Error de validación",
  "error": "Bad Request",
  "errores": {
    "precio": "El precio debe ser mayor a 0"
  },
  "timestamp": "2025-11-11T00:30:23.401870032",
  "status": 400
}
```
✅ **Código de respuesta: 400 Bad Request** - Validación de precio funcionando

### 9. Prueba de Error 404

**Solicitud:** `GET /api/productos/999` (producto inexistente)

**Respuesta:**
```json
{
  "timestamp": "2025-11-11 00:30:23",
  "status": 404,
  "error": "Not Found",
  "mensaje": "No se encontró el producto con ID: 999",
  "path": "/api/productos/999"
}
```
✅ **Código de respuesta: 404 Not Found** - Manejo de excepciones funcionando

### Resumen de Pruebas

| Prueba | Endpoint | Método | Resultado | Código HTTP |
|--------|----------|--------|-----------|-------------|
| Crear producto | `/api/productos` | POST | ✅ Exitoso | 201 |
| Listar productos | `/api/productos` | GET | ✅ Exitoso | 200 |
| Obtener por ID | `/api/productos/1` | GET | ✅ Exitoso | 200 |
| Filtrar por categoría | `/api/productos/categoria/ELECTRONICA` | GET | ✅ Exitoso | 200 |
| Actualizar completo | `/api/productos/1` | PUT | ✅ Exitoso | 200 |
| Actualizar stock | `/api/productos/1/stock` | PATCH | ✅ Exitoso | 200 |
| Eliminar producto | `/api/productos/5` | DELETE | ✅ Exitoso | 204 |
| Validación nombre | `/api/productos` | POST | ✅ Error esperado | 400 |
| Validación precio | `/api/productos` | POST | ✅ Error esperado | 400 |
| Producto no existe | `/api/productos/999` | GET | ✅ Error esperado | 404 |

**✅ TODAS LAS PRUEBAS PASARON EXITOSAMENTE**

### Verificación en H2 Console

La base de datos H2 almacena correctamente los productos. Para verificar:

1. Acceder a `http://localhost:8080/h2-console`
2. Conectar con:
   - JDBC URL: `jdbc:h2:mem:productosdb`
   - Usuario: `sa`
   - Password: (vacío)
3. Ejecutar query: `SELECT * FROM productos;`

**Resultado esperado:** Tabla con los 4 productos restantes (después de eliminar el ID 5)

---

## 🔗 Acceso a Swagger UI y H2 Console

### Swagger UI
Accede a la documentación interactiva de la API:
```
http://localhost:8080/swagger-ui.html
```

Desde Swagger UI puedes:
- Ver todos los endpoints disponibles
- Probar cada endpoint directamente desde el navegador
- Ver los modelos de datos (schemas)
- Ver los códigos de respuesta posibles

### H2 Console
Accede a la consola de la base de datos:
```
http://localhost:8080/h2-console
```

Configuración de conexión:
- **JDBC URL:** `jdbc:h2:mem:productosdb`
- **Usuario:** `sa`
- **Contraseña:** *(dejar en blanco)*

---

## 💭 Conclusiones Personales

Este proyecto me permitió:

1. **Comprender la arquitectura en capas** de una aplicación Spring Boot moderna, separando claramente las responsabilidades entre controladores, servicios y repositorios.

2. **Aplicar los principios REST** correctamente, utilizando los métodos HTTP apropiados para cada operación y retornando los códigos de estado correctos.

3. **Implementar validaciones robustas** usando Bean Validation, mejorando la calidad y consistencia de los datos.

4. **Manejar excepciones de forma centralizada** con `@ControllerAdvice`, proporcionando mensajes de error claros y consistentes.

5. **Trabajar con DTOs** para desacoplar la capa de presentación de la capa de persistencia, mejorando la seguridad y mantenibilidad.

6. **Documentar automáticamente la API** con Swagger/OpenAPI, facilitando el consumo de la API por otros desarrolladores.

7. **Utilizar JPA y Spring Data** para simplificar el acceso a datos y trabajar con bases de datos relacionales de forma eficiente.

El desarrollo de esta API me ha dado una base sólida para construir aplicaciones backend profesionales y escalables.

---

## 👤 Autor

**Maximo Fran**  
Legajo: 50903  
Tecnicatura Universitaria en Programación

---

## 📦 Estructura de la Base de Datos

### Tabla: productos

| Campo | Tipo | Restricciones |
|-------|------|---------------|
| id | BIGINT | PRIMARY KEY, AUTO_INCREMENT |
| nombre | VARCHAR(100) | NOT NULL |
| descripcion | VARCHAR(500) | |
| precio | DOUBLE | NOT NULL |
| stock | INTEGER | NOT NULL |
| categoria | ENUM | NOT NULL |

---

## 🔍 Testing

La aplicación puede ser probada exhaustivamente usando:

1. **Swagger UI** - Interfaz gráfica interactiva
2. **Postman** - Importar la colección desde OpenAPI
3. **cURL** - Línea de comandos (ejemplos incluidos arriba)
4. **H2 Console** - Verificar persistencia de datos

---

**¡Gracias por revisar este proyecto!** 🚀
# 🛒 API REST para Gestión de Productos

**Trabajo Práctico - Programación III**

Desarrollado por: **Maximo Fran**  
Legajo: **50903**

---

## 📝 Descripción del Proyecto

API REST completa para un sistema de e-commerce básico que permite gestionar productos. El sistema implementa operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre productos, con validaciones, manejo de excepciones y documentación automática con Swagger/OpenAPI.

---

## ⚙️ Tecnologías Utilizadas

- **Java 21**
- **Spring Boot 3.5.7**
- **Spring Data JPA** - Persistencia de datos
- **H2 Database** - Base de datos en memoria
- **Spring Validation** - Validación de datos
- **Lombok** - Reducción de código boilerplate
- **SpringDoc OpenAPI** - Documentación automática de la API
- **Maven** - Gestión de dependencias

---

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una arquitectura en capas:

```
com.utn.productosapi
├── model/              # Entidades JPA
│   ├── Producto.java
│   └── Categoria.java
├── dto/                # Data Transfer Objects
│   ├── ProductoDTO.java
│   ├── ProductoResponseDTO.java
│   └── ActualizarStockDTO.java
├── repository/         # Capa de acceso a datos
│   └── ProductoRepository.java
├── service/            # Lógica de negocio
│   └── ProductoService.java
├── controller/         # Controladores REST
│   └── ProductoController.java
└── exception/          # Manejo de excepciones
    ├── ProductoNotFoundException.java
    ├── StockInsuficienteException.java
    ├── ErrorResponse.java
    └── GlobalExceptionHandler.java
```

---

## 🚀 Instrucciones para Clonar y Ejecutar

### Prerrequisitos

- Java 17 o superior
- Maven 3.6+

### Pasos

1. **Clonar el repositorio:**
```bash
git clone https://github.com/tu-usuario/productos-api.git
cd productos-api
```

2. **Compilar el proyecto:**
```bash
./mvnw clean package
```

3. **Ejecutar la aplicación:**
```bash
./mvnw spring-boot:run
```

4. **La aplicación estará disponible en:**
- API: `http://localhost:8080`
- Swagger UI: `http://localhost:8080/swagger-ui.html`
- H2 Console: `http://localhost:8080/h2-console`
  - JDBC URL: `jdbc:h2:mem:productosdb`
  - Usuario: `sa`
  - Contraseña: *(vacía)*

---

## 🌐 Tabla de Endpoints

| Método | Ruta | Descripción | Códigos de Respuesta |
|--------|------|-------------|---------------------|
| `GET` | `/api/productos` | Listar todos los productos | 200 OK |
| `GET` | `/api/productos/{id}` | Obtener producto por ID | 200 OK, 404 Not Found |
| `GET` | `/api/productos/categoria/{categoria}` | Filtrar por categoría | 200 OK |
| `POST` | `/api/productos` | Crear nuevo producto | 201 Created, 400 Bad Request |
| `PUT` | `/api/productos/{id}` | Actualizar producto completo | 200 OK, 404 Not Found, 400 Bad Request |
| `PATCH` | `/api/productos/{id}/stock` | Actualizar solo el stock | 200 OK, 404 Not Found, 400 Bad Request |
| `DELETE` | `/api/productos/{id}` | Eliminar producto | 204 No Content, 404 Not Found |

### Categorías Disponibles
- `ELECTRONICA`
- `ROPA`
- `ALIMENTOS`
- `HOGAR`
- `DEPORTES`

---

## 📋 Ejemplos de Uso

### Crear un Producto (POST)

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

### Listar Todos los Productos (GET)

```bash
curl http://localhost:8080/api/productos
```

### Obtener Producto por ID (GET)

```bash
curl http://localhost:8080/api/productos/1
```

### Filtrar por Categoría (GET)

```bash
curl http://localhost:8080/api/productos/categoria/ELECTRONICA
```

### Actualizar Producto (PUT)

```bash
curl -X PUT http://localhost:8080/api/productos/1 \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Laptop HP Pavilion 15",
    "descripcion": "Laptop HP Pavilion 15, Intel Core i7, 16GB RAM, 512GB SSD",
    "precio": 55999.99,
    "stock": 10,
    "categoria": "ELECTRONICA"
  }'
```

### Actualizar Stock (PATCH)

```bash
curl -X PATCH http://localhost:8080/api/productos/1/stock \
  -H "Content-Type: application/json" \
  -d '{"stock": 25}'
```

### Eliminar Producto (DELETE)

```bash
curl -X DELETE http://localhost:8080/api/productos/1
```

---

## ✅ Validaciones Implementadas

### ProductoDTO
- **nombre**: No nulo, no vacío, entre 3 y 100 caracteres
- **descripcion**: Máximo 500 caracteres
- **precio**: No nulo, mínimo 0.01
- **stock**: No nulo, mínimo 0
- **categoria**: No nula

### Ejemplos de Errores de Validación

**Intento de crear producto sin nombre (400 Bad Request):**
```json
{
  "timestamp": "2025-11-11 00:15:30",
  "status": 400,
  "error": "Bad Request",
  "mensaje": "Error de validación",
  "errores": {
    "nombre": "El nombre no puede estar vacío"
  },

