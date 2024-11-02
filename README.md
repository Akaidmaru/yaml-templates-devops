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
│ └── serverless.yaml # Configuración del framework Serverless
│
├── terraform/
│ ├── vpc.tf # Configuración de VPC
│ ├── compute.tf # Configuración de instancias EC2
│ ├── routing.tf # Configuración de tablas de enrutamiento
│ ├── subnets.tf # Configuración de subredes
│ ├── provider.tf # Configuración del proveedor
│ ├── variables.tf # Variables del proyecto
│ └── security-group.tf # Configuración de grupos de seguridad
│
└── README.md
```

## 📚 Documentación Adicional

- [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
- [Ansible Documentation](https://docs.ansible.com/)
- [Serverless Framework](https://www.serverless.com/framework/docs/)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue para discutir los cambios propuestos.

## 📄 Documentación de Subproyectos

- [Ansible](ansible/README.md)
- [CloudFormation](cloudformation/README.md)
- [Serverless](serverless/README.md)
- [Terraform](terraform/README.md)