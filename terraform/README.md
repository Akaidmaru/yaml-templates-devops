# Documentación del Proyecto de Terraform

## Descripción

Este proyecto de Terraform crea una infraestructura en AWS que incluye una VPC, subredes públicas y privadas, instancias EC2, y un grupo de seguridad. La configuración está diseñada para proporcionar un entorno seguro y escalable.

### Componentes del Proyecto

1. **VPC**
   - **Archivo:** `terraform/vpc.tf`
   - **Descripción:** Crea una VPC con un bloque CIDR de `10.0.0.0/16` y un gateway de Internet.

2. **Subredes**
   - **Archivo:** `terraform/subnets.tf`
   - **Descripción:** Crea dos subredes públicas y dos privadas dentro de la VPC.

3. **Instancias EC2**
   - **Archivo:** `terraform/compute.tf`
   - **Descripción:** Crea dos instancias EC2 públicas en las subredes públicas.

4. **Tablas de Rutas**
   - **Archivo:** `terraform/routing.tf`
   - **Descripción:** Configura las tablas de rutas para las subredes públicas y privadas.

5. **Grupo de Seguridad**
   - **Archivo:** `terraform/security-group.tf`
   - **Descripción:** Crea un grupo de seguridad que permite tráfico SSH, HTTP y HTTPS.

6. **Variables**
   - **Archivo:** `terraform/variables.tf`
   - **Descripción:** Define las variables necesarias para la configuración, como el nombre del key pair.

7. **Proveedor**
   - **Archivo:** `terraform/provider.tf`
   - **Descripción:** Configura el proveedor de AWS y la región.

## Cómo Usarlo

### Requisitos Previos

1. **Terraform instalado:** Asegúrate de tener Terraform instalado en tu máquina.
2. **Credenciales de AWS:** Configura tus credenciales de AWS en `~/.aws/credentials`.
3. **Key Pair:** Crea un key pair en AWS.

### Archivo de Variables

Crea un archivo llamado `terraform.tfvars` en la raíz del proyecto y añade la siguiente línea para definir el nombre del key pair:

```hcl
key_pair_name = "nombre_de_tu_key_pair"
```

Asegúrate de reemplazar `"nombre_de_tu_key_pair"` con el nombre real de tu key pair.

### Inicialización del Proyecto

Para inicializar el proyecto y descargar los proveedores necesarios, ejecuta:

```bash
terraform init
```

### Planificación de la Infraestructura

Para ver un plan de la infraestructura que se creará, ejecuta:

```bash
terraform plan
```

### Aplicación de la Infraestructura

Para aplicar la configuración y crear la infraestructura en AWS, ejecuta:

```bash
terraform apply
```

### Destrucción de la Infraestructura

Para destruir la infraestructura creada, ejecuta:

```bash
terraform destroy
```

## Enlaces

- [Volver al README.md principal](../README.md)
- [Ir al README.md del Proyecto de Ansible](../ansible/README.md)
- [Ir al README.md del Proyecto de CloudFormation](../cloudformation/README.md)
- [Ir al README.md del Proyecto de Serverless](../serverless/README.md)
