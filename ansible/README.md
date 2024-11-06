# Documentación del Proyecto de Ansible

## Descripción

Este subproyecto incluye dos playbooks de Ansible: uno para la instalación de Apache y otro para la creación de instancias EC2 en AWS.

### Playbook de Apache

- **Archivo:** `ansible/apachePlaybook.yaml`
- **Descripción:** Este playbook instala y configura el servidor Apache en los hosts definidos en el inventario.

#### Tareas

1. **Actualizar la caché de paquetes**
2. **Instalar Apache**
3. **Iniciar el servicio de Apache**

### Playbook de Creación de EC2

- **Archivo:** `ansible/ec2CreationPlaybook.yaml`
- **Descripción:** Este playbook crea una instancia EC2 en AWS utilizando los parámetros especificados.

#### Tareas

- Crear una instancia EC2 con el nombre "AnsibleInstance" y el tipo de instancia `t2.micro`.

## Cómo Usarlo

### Requisitos Previos

1. **Ansible instalado:** Asegúrate de tener Ansible instalado en tu máquina.
2. **Acceso a AWS:** Necesitas tener configuradas las credenciales de AWS en tu entorno.
3. **Inventario configurado:** Asegúrate de que el archivo de inventario (`ansible/inventory`) esté correctamente configurado con los hosts.

### Ejecución del Playbook de Apache

Para ejecutar el playbook de Apache, utiliza el siguiente comando:

```bash
ansible-playbook ansible/apachePlaybook.yaml -i ansible/inventory
```

### Ejecución del Playbook de Creación de EC2

Para ejecutar el playbook de creación de EC2, utiliza el siguiente comando:

```bash
ansible-playbook ansible/ec2CreationPlaybook.yaml
```

## Inventario

- **Archivo:** `ansible/inventory`
- **Descripción:** Este archivo define los hosts que se utilizarán en el playbook de Apache.

## Enlaces

- [Volver al README.md principal](../README.md)
- [Ir al README.md del Proyecto de CloudFormation](../cloudformation/README.md)
- [Ir al README.md del Proyecto de Serverless](../serverless/README.md)
- [Ir al README.md del Proyecto de Terraform](../terraform/README.md)
