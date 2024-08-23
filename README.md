# Proyecto de Infraestructura como Código con Terraform

Este proyecto implementa una infraestructura en AWS utilizando Terraform. Se despliega una instancia EC2, una base de datos MySQL en RDS, y se configura una VPC con subredes y grupos de seguridad.

## Requisitos Previos

Antes de comenzar, asegúrate de tener los siguientes requisitos:

- Una cuenta de AWS.
- Terraform instalado.
- `AWS CLI` configurado con credenciales que tengan permisos adecuados.
- Un par de claves SSH para acceder a la instancia EC2.

## Recursos Desplegados

El proyecto despliega los siguientes recursos:

1. **VPC**: Red virtual en AWS.
2. **Subred Pública**: Subred dentro de la VPC para la instancia EC2.
3. **Subred Privada**: Subred dentro de la VPC para la base de datos RDS.
4. **Internet Gateway**: Permite la salida a Internet para los recursos dentro de la subred pública.
5. **Grupo de Seguridad para EC2**: Permite el tráfico SSH (puerto 22) y MySQL (puerto 3306).
6. **Instancia EC2**: Servidor virtual en la subred pública.
7. **Base de Datos MySQL en RDS**: Base de datos administrada en la subred privada.

