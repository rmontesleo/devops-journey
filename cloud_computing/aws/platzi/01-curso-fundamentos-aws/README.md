# Curso de Introducción a AWS: Fundamentos de Cloud Computing


---

## Clases

### 1.

### 2. Visión general de las TI tradicionales

### 3. Qué es la computacion en la nubes

### 4. Los diferentes tipos de cómputo: IaaS vs. PaaS vs. SaaS

3 Precios fundamentales
 - computo
 - almacenamiento
 - información transferida fuera de la nube.


### 5. Una pequeña historia de AWS

### 6. Una visión global: regiones y zonas de disponibilidad

Servicios Globales
- IAM
- Route 53
- Cloudfront
- WAF

Servicios Regionales
- EC2
- Beanstalk
- Lambda
- Rekognition

### 7. Laboratorio: crea tu cuenta en AWS

### 8. Seguridad e identidad

Uno de los aspectos más importantes al trasladar aplicaciones en la nube es la seguridad. Es crucial que nuestros datos estén protegidos contra amenazas para así permitir que los usuarios accedan a nuestro sistema y encuentren solo los recursos que necesitan.

#### Servicios de protección de datos
A continuación, conocerás algunos servicios de protección de AWS y sus funciones para mover nuestras plataformas en la nube:

- **Amazon Macie**: descubre y protege datos sensibles
- **AWS Key Management Service**: almacena y administra claves de cifrado
- **AWS CloudHSM**: proporciona almacenamiento de claves basado en hardware
- **AWS Certificate Manager**: provee, administra e implementa certificados SSL/TLS
- **AWS Secrets Manager**: traslada, gestiona y recupera datos (contraseñas, por ejemplo)

#### Servicios de protección de la infraestructura
Es fundamental que cuides de la infraestructura de tu sitio web y AWS ofrece los siguientes servicios de seguridad:

- **AWS Shield**: protege contra ataques de Denegación de Servicio (DDOS)
- **AWS Web Aplication Firewall (WAF)**: filtra el tráfico de sitios web maliciosos
- **AWS Firewall Manager**: administra las reglas del firewall de forma centralizada

#### Servicios de detección de amenazas
En todo momento nuestra plataforma está expuesta a grandes amenazas y por eso AWS desarrolló los siguientes servicios:

- **Amazon GuarDuty**: detecta automáticamente las amenazas
- **Amazon Inspector**: analiza la seguridad de la aplicación
- **Amazon Config**: registra y evalúa configuraciones de nuestros recursos
- **Amazon CloudTrail**: rastrea la actividad del usuario y el uso de las API que ocupamos en nuestra cuenta.

### Servicios de gestión de identidad
Por último, existen distintas herramientas de gestión de identidad que provee AWS:

- **AWS Identity and Access Management (IAM)**: administra de forma segura el acceso a una cuenta, servicios y recursos

- **AWS Inicio de sesión único**: implementa el inicio de sesión único (Single Sign On/SSO)

- **Amazon Cognito**: permite a los usuarios administrar la identidad dentro de las aplicaciones
AWS Servicio de Directorio: implementa y administra un Active Directory service

- **AWS Organizaciones**: funciona para gobernar y administrar de distintas cuentas de AWS de forma centralizada

`Contribución creada con los aportes de: Jesús Ignacio García Fernández y Ciro Villafraz.`


### 9. IAM ilustrado

**Identity and Access Management (IAM)** es un servicio gratuito que nos ayuda a administrar los accesos a los servicios y recursos de tu cuenta en AWS. A su vez, puedes crear usuarios, grupos y establecer permisos de acceso a los recursos mediante el uso de políticas.

#### Usuarios y grupos de usuarios de IAM
Los usuarios y grupos de usuarios son de los principales componentes de IAM. Al crear tu cuenta de AWS te proporcionan un usuario Root que tiene acceso a todos los recursos,

Este usuario puede generar otros perfiles y cada uno con un acceso único a distintos recursos de AWS. Además, Root también puede configurar grupos de usuarios, donde cada miembro tiene y puede compartir permisos de acceso.

#### Ejemplos de políticas de IAM

El acceso a recursos se otorga mediante políticas. Este es un ejemplo de una política que otorga acceso de administrador.
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
```

También está este ejemplo de políticas de acceso a un bucket de S3 (almacenamiento)
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:53 ::: bucket-name"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3: GetObject",
                "s3: PutObject",
            ],
            "Resource": "arn:aws:53 ::: bucket-name /*"
        }
    ]
}
```

#### IAM Roles
Además de todas estas funciones, IAM de AWS permite asumir roles y otorgar permisos a otras tecnologías. Por ejemplo, podemos conceder a una máquina virtual el acceso a una base de datos mediante un rol de IAM.

`Contribución creada con los aportes de: Ciro Villafraz.`




### 10. Secrets Manager

**Secrets Manager** es un servicio de AWS que nos ayuda a proteger los datos secretos (contraseñas, claves y tokens) necesarios para acceder a nuestras aplicaciones, servicios y recursos.

También nos permite compartir automáticamente esta información cuando queramos. Además, este servicio evita que tengamos que copiar y pegar los secretos directamente en nuestro código.

`Contribución creada por Ciro Villafraz.`

### 11. Demostración del servicio de directorio

Un directorio es una base de datos que contiene información de inicio de sesión de todos los usuarios de una red y puede implementar políticas de seguridad.

Dado que Windows es el sistema operativo más usado a nivel mundial, Microsoft lanzó Active Directory. Este servicio permite que las empresas gestionen los inicios de sesión de sus empleados.

#### AWS Directory Service
Es una oferta de servicio administrado de AWS que posibilita que sus recursos utilicen Active Directory y ofrecen:

Un directorio activo administrado sin tener que ejecutar servidores manualmente
La opción de directorio activo simple
El conector AD que brinda a usuarios inicio de sesión en aplicaciones de AWS con sus credenciales
Un Servicio distribuido con error automático que funciona si hay fallas en los servidores
El AWS Directory Service ss compatible con otros servicios de AWS
Para más información de AWS Directory, visita la documentación del servicio

`Contribución creada con los aportes de: Ciro Villafraz.`

### 12. Laboratorio: crea usuarios y grupos en AWS

### 13. Laboratorio: crea una alerta de facturación

### 14.

### 15. Toma el Curso de Almacenamiento, Cómputo y Bases de Datos en AWS


---

## Resources

- [Curso de Introducción a AWS: Fundamentos de Cloud Computing](https://platzi.com/cursos/aws-fundamentos/)

- [Slides](https://static.platzi.com/media/public/uploads/aws-fundamentals-slides__e4d1a25c-3467-4652-bdad-92e64fb59f98.pdf)

- [Infraestructura global de AWS](https://aws.amazon.com/es/about-aws/global-infrastructure/?p=ngi&amp;loc=0)
- [Servicios de AWS por región](https://aws.amazon.com/es/about-aws/global-infrastructure/regional-product-services/)

- [AWS Ping Test (Latency)](https://cloudpingtest.com/aws)
- [cloudping.info](https://www.cloudping.info/)