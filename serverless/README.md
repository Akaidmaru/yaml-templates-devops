# Documentación del Proyecto Serverless

## Descripción

Este proyecto es una solución a un reto propuesto por Softtek. Combina datos de la API de Star Wars (SWAPI) con un sistema personalizado de gestión de vehículos utilizando AWS DynamoDB. El archivo `serverless.yaml` configura la infraestructura y las funciones necesarias para implementar la aplicación en AWS utilizando el framework Serverless.

### Estructura del Archivo `serverless.yaml`

- **Servicio:** Define el nombre del servicio como `swapi`.
- **Configuración Personalizada:**
  - Configura los puertos para el uso de `serverless-offline`.
  - Define el nombre de la tabla DynamoDB que se utilizará.

- **Proveedor:**
  - Especifica que se utilizará AWS como proveedor.
  - Define la región, el runtime y los permisos necesarios para interactuar con DynamoDB.

- **Funciones:**
  - **getPeopleSwapi:** Función para obtener y traducir datos de personajes de Star Wars.
  - **createVehicle:** Función para crear un nuevo vehículo en la base de datos.
  - **getVehicles:** Función para listar vehículos con paginación.
  - **getVehicleById:** Función para obtener un vehículo específico por ID.

- **Recursos:**
  - Define la tabla DynamoDB que almacenará los vehículos, incluyendo su esquema y capacidad de lectura/escritura.

- **Plugins:**
  - Utiliza el plugin `serverless-offline` para permitir la ejecución local de las funciones.

## Requerimientos

- **Node.js 20 o superior.**
- **Cuenta de AWS con acceso a DynamoDB.**
- **AWS CLI configurado con credenciales apropiadas.**
- **Variables de entorno configuradas (ver sección de **Configuration** en el proyecto).**

## Ejecución de la Aplicación

Para ejecutar la aplicación localmente, asegúrate de tener instalado el framework Serverless y ejecuta:

```bash
serverless offline
```

La aplicación estará disponible en <http://localhost:3003>.

## Enlace al Proyecto

Puedes encontrar el proyecto completo en GitHub: [swapiSofttek](https://github.com/Akaidmaru/swapiSofttek).

## Mejoras Futuras

- Implementar caché para solicitudes a SWAPI.
- Añadir manejo de errores y registro más completo.
- Implementar autenticación y autorización.
- Crear una aplicación frontend para interactuar con la API.

## Enlaces

- [Volver al README.md principal](../README.md)
- [Ir al README.md del Proyecto de Ansible](../ansible/README.md)
- [Ir al README.md del Proyecto de Serverless](../serverless/README.md)
- [Ir al README.md del Proyecto de Terraform](../terraform/README.md)
