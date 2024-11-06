# Documentación del Proyecto CloudFormation

## Descripción

Este proyecto de CloudFormation crea una infraestructura en AWS que incluye un bucket de S3 y dos instancias EC2. Además, se proporciona una plantilla que permite seleccionar el tipo de entorno (Producción, Pruebas o Desarrollo) para la creación de una instancia EC2.

### Estructura del Proyecto

1. **Creación de un Bucket S3 y dos instancias EC2**
   - **Archivo:** `cloudformation/s3ec2.yaml`
   - **Descripción:** Esta plantilla crea un bucket de S3 llamado `my-private-bucket` y dos instancias EC2 en la zona de disponibilidad `us-east-1a`.

   #### Recursos
   - **MyPrivateBucket:** 
     - Tipo: `AWS::S3::Bucket`
     - Configuración: 
       - Permite el acceso público (configuración de bloqueo de acceso público).
       - Habilita la versión del bucket.
   - **MyFirstEC2 y MySecondEC2:** 
     - Tipo: `AWS::EC2::Instance`
     - Configuración: 
       - Tipo de instancia: `t2.micro`
       - Imagen: `ami-0866a3c8686eaeeba`
       - Comportamiento de apagado: `terminate`
       - Clave: `EC2KeyPair`

2. **Instancia que cambia según el tipo de entorno**
   - **Archivo:** `cloudformation/instanceEnvironments.yaml`
   - **Descripción:** Esta plantilla permite crear una instancia EC2 que varía según el tipo de entorno seleccionado (Producción, Pruebas o Desarrollo).

   #### Parámetros
   - **EnvironmentType:** 
     - Tipo: `String`
     - Valores permitidos: `Production`, `Testing`, `Development`
     - Valor por defecto: `Production`

   #### Mapeos
   - **Environment:** 
     - Define el tipo de instancia y la imagen según el tipo de entorno seleccionado.

   #### Recursos
   - **OneInstanceToRuleThemAll:** 
     - Tipo: `AWS::EC2::Instance`
     - Configuración: 
       - Tipo de instancia y imagen determinados por el mapeo según el parámetro `EnvironmentType`.
       - Comportamiento de apagado: `terminate`
       - Clave: `EC2KeyPair`

## Cómo Usar las Plantillas

### Creación de la Infraestructura

Para crear la infraestructura definida en las plantillas de CloudFormation, sigue estos pasos:

1. **Accede a la Consola de AWS:**
   - Inicia sesión en tu cuenta de AWS y navega a la consola de CloudFormation.

2. **Crear una nueva pila:**
   - Haz clic en "Crear pila" y selecciona "Con nuevos recursos (estándar)".

3. **Sube la plantilla:**
   - Selecciona la opción para cargar un archivo y elige `s3ec2.yaml` o `instanceEnvironments.yaml` según lo que desees implementar.

4. **Configura los parámetros:**
   - Si utilizas `instanceEnvironments.yaml`, selecciona el tipo de entorno deseado.

5. **Revisa y crea:**
   - Revisa la configuración y haz clic en "Crear pila" para iniciar la creación de los recursos.

### Destrucción de la Infraestructura

Para eliminar la infraestructura creada, simplemente elimina la pila desde la consola de CloudFormation.

## Enlaces

- [Volver al README.md principal](../README.md)
- [Ir al README.md del Proyecto de Ansible](../ansible/README.md)
- [Ir al README.md del Proyecto de Serverless](../serverless/README.md)
- [Ir al README.md del Proyecto de Terraform](../terraform/README.md)
