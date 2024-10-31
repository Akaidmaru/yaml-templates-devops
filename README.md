# Proyecto de Infraestructura como Código (IaC)

Este repositorio contiene ejemplos prácticos de Infraestructura como Código utilizando diversas herramientas de automatización y despliegue.

## 🎯 Objetivo

El propósito de este proyecto es proporcionar ejemplos prácticos de implementación de IaC utilizando diferentes tecnologías, permitiendo el aprendizaje y la experimentación con herramientas modernas de DevOps.

## 🛠 Tecnologías Utilizadas

- **AWS CloudFormation**: Para la definición y provisión de infraestructura en AWS
- **Ansible**: Para la configuración y gestión de servidores
- **Serverless Framework**: Para el desarrollo y despliegue de aplicaciones serverless
- **Servicios AWS**:
  - EC2 (Elastic Compute Cloud)
  - S3 (Simple Storage Service)
  - DynamoDB
  - IAM (Identity and Access Management)

## 📁 Estructura del Proyecto
```
proyecto-iac/
│
├── ansible/
│ ├── inventory # Archivo de inventario de Ansible
│ ├── apachePlaybook.yaml # Playbook para instalación de Apache
│ └── ec2CreationPlaybook.yaml # Playbook para creación de instancias EC2
│
├── cloudformation/
│ ├── s3ec2.yaml # Template para S3 y EC2
│ └── instanceEnvironments.yaml # Template con configuraciones por ambiente
│
├── serverless/
│ ├── src/
│ │ └── main.ts # Código fuente de las funciones Lambda
│ └── serverless.yaml # Configuración del framework Serverless
│
└── README.md
```

## 🚀 Ejemplos Incluidos

### CloudFormation

- Creación de bucket S3 y instancias EC2
- Instancias EC2 con configuraciones basadas en ambiente (Dev/Test/Prod)

### Ansible

- Instalación y configuración de Apache
- Creación automatizada de instancias EC2

### Serverless

- API REST con integración a DynamoDB
- Endpoints para gestión de vehículos
- Integración con SWAPI (Star Wars API)

## 📝 Prerrequisitos

- Cuenta AWS con credenciales configuradas
- AWS CLI instalado y configurado
- Node.js y npm (para Serverless Framework)
- Ansible instalado
- Python 3.x

## 🔧 Configuración

1. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/proyecto-iac.git
```

2. Configurar credenciales AWS:

```bash
aws configure
```

3. Instalar dependencias del proyecto Serverless:

```bash
cd serverless
npm install
```

## 📚 Documentación Adicional

- [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
- [Ansible Documentation](https://docs.ansible.com/)
- [Serverless Framework](https://www.serverless.com/framework/docs/)

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue para discutir los cambios propuestos.
