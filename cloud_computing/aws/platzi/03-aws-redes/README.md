# Curso de Introducción a AWS: Redes, Gobernanza y Machine Learning

## Clases


### 1.

### 2. Qué son las redes

Las redes son cómo están conectadas las computadoras (y otros dispositivos tecnológicos) entre sí, y los servicios que permiten esto.

Una muy conocida es el Internet, que consiste en una red de computadoras abierta al mundo. Para que Internet funcione es necesario contar con direcciones IP, enrutadores, DNS y seguridad. AWS provee servicios que permiten la creación de redes y la entrega de contenido a los usuarios de manera rápida.

#### Redes en la nube
Entre los servicios de AWS para implementar redes en la nube encontramos:

- **Amazon Virtual Private Cloud (Amazon VPC)**: permite definir y aprovisionar una red privada para nuestros recursos de AWS
- **AWS Transit Gateway**: Permite conectar VPC con los recursos locales (on-premises) mediante un hub central
- **AWS PrivateLink**: proporciona conectividad privada entre las VPC y aplicaciones locales, sin exponer el tráfico al Internet público
- Amazon Route 53: permite alojar nuestro propio DNS administrado

#### Redes a escala
Estos servicios nos permiten escalar el tráfico de red según las necesidades:

- **Elastic Load Balancing**: permite distribuir automáticamente el tráfico de red a través de un grupo de recursos, con el fin de mejorar la escalabilidad.

- **AWS Global Accelerator**: redirige el tráfico a través de la red global de AWS para mejorar el rendimiento de las aplicaciones globales

- **Amazon CloudFront**: entrega de forma segura datos, videos y aplicaciones a clientes de todo el mundo con baja latencia.

`Contribución creada con aportes de: Ciro Villafraz, Gilberto Pérez Garrido y Christian Andres Moreno Ceballos.`

### 3. Qué es una VPC

Una VPC es una red virtual privada. Cada computadora que está conectada a otra computadora por medio de un cable, enrutador o antena de wifi, requiere de una interfaz de red para ser conectada. La interfaz de red es el puente entre nuestra computadora y la tecnología ya utilizada para conectarse a la otra computadora.

Una vez que conectamos las computadoras, debemos configurar la red, para lo cual necesitamos un rango de direcciones IP.

#### Qué es el rango de direcciones IP
El rango de direcciones IP es como una comunidad cerrada local, donde los equipos se podrán comunicar solo con otros equipos dentro de la misma red. A cada equipo se le asigna una dirección IPv4. Es decir, se le dan 4 números que varían del 0 al 255 separados por un punto. Para redes privadas ya se tienen especificados los rangos de IP:

- 10.0.0.1
- 172.16.0.1
- 192.168.0.1

#### Para qué sirve Amazon VPC
Amazon VPC permite crear una red virtual para poder conectarnos a todos los servicios de AWS que existan en un rango de direcciones IP locales (por ejemplo, 10.0.0.0/24, que representa del rango de IP entre 10.0.0.0 y 10.0.0.255). Esta red virtual será como una pequeña comunidad cerrada para nuestras máquinas virtuales y todos los servicios que tengamos dentro de AWS.

### Componentes de Amazon VPC
Amazon VPC posee los siguientes componentes para controlar el tráfico interno y externo de nuestras VPC

- **Nat Gateway**: si deseamos que nuestras máquinas virtuales puedan acceder a internet, debemos utilizar este componente
- **Internet Gateway**: permite que Internet pueda acceder a nuestra instancia de EC2
- **ACL Control List**: controla el tráfico que vamos a permitir dentro y fuera de la VPC

`Contribución creada con aportes de: Ciro Villafraz y Christian Andres Moreno Ceballos.`

### 4. Escogiendo CloudFront


Antes de hablar de CloudFront, recordemos cómo funciona AWS ElastiCache. ElastiCache es un servicio que almacena en memoria caché las solicitudes a la base de datos, para evitar el consultar la base de datos cada vez que se necesite acceder a información. Este servicio se ubica entre el sitio web y la base de datos

CloudFront funciona de manera similar, solo que este es un servicio intermedio entre el navegador (o el cliente) y el sitio web. El propósito de CloudFront es entregar datos, aplicaciones y sitios web en todos el mundo con baja latencia. Para esto, AWS cuenta con edge locations (o ubicaciones de borde), es decir, múltiples ubicaciones en el mundo desde las cuales CloudFront puede servir contenido.

### Casos de uso de CloudFront
Supongamos que un cliente accede a nuestro sitio web. En realidad, el cliente primero accede a CloudFront. Entonces CloudFront redirige automáticamente la solicitud de archivo desde el edge location más cercano. Los archivos se almacenan en la caché de la ubicación de borde primero, durante un periodo de tiempo limitado que nosotros necesitemos.

Si un cliente solicita el contenido que está almacenado en caché por más tiempo que el vencimiento especificado, CloudFront verifica en el servidor de origen para ver si hay una nueva versión del archivo disponible. Si el archivo ha sido modificado, se retorna la nueva versión del archivo. En caso contrario, se entrega la versión que estaba en caché.

Cualquier cambio que realicemos en los archivos se replicará en las ubicaciones de borde a medida que sus visitantes están entrando y solicitando el contenido. Esto es lo que mantiene a los sitios web rápidos sin importar la ubicación del usuario.

#### Características de CloudFront
- CloudFront es seguro: ofrece protección contra ataques DDOS, ya que los primeros servidores en recibir estos ataques serán los de CloudFront y no los tuyos. Además, CloudFront está protegido ante picos de tráfico.

- CloudFront también permite ejecutar funciones de AWS Lambda en las ubicaciones de borde.

- CloudFront ofrece múltiples métricas en tiempo real, y es rentable.

`Contribución creada con aportes de: Ciro Villafraz y Gilberto Pérez Garrido.`


### 5. Qué es Route 53

DNS es un sistema que asigna direcciones IP a nombres de dominio. Route 53 es un servicio de alojamiento de DNS, que cuesta tan solo $0.5 por nombre de dominio por mes. Route 53 cuenta con distintas opciones de política de enrutamiento.

#### Políticas de enrutamiento
Las políticas de enrutamiento nos permiten determinar a dónde se dirigirá un usuario cuando acceda a nuestro dominio. Estas políticas son:

**Ruteo simple**
El ruteo simple utiliza el servicio de DNS estándar. Es decir, el tráfico en un dominio se enruta hacia un recurso muy específico.

**Política ponderada**
La política ponderada (o weighted routing) te permite asociar múltiples recursos con un solo nombre de dominio, y ver qué tanto tráfico es dirigido a cada recurso. Esto se determina con un número del 0 al 255, donde el cero representa que el recurso no recibe ningún tráfico, y el 255 indica que el recurso recibe todo el tráfico.

Mediante la política ponderada podemos probar distintas versiones de nuestro sitio web con un número reducido de usuarios. Luego podemos realizar una transición lenta de nuestros usuarios hacia la nueva versión del sitio.

**Política de geolocalización**
Usando la política de geolocalización podemos escoger qué recursos servir en función de la ubicación geográfica de nuestros usuarios. Esto permite servir contenido específico según la región, así como restringir la distribución del mismo solo a las regiones permitidas.

**Política de latencia**
La política de latencia se trata de entregar los recursos desde la región de AWS que esté más cercana a la ubicación del usuario, a fin de reducir el tiempo de respuesta.

**Política de conmutación por error**
La política de conmutación por error redirige el tráfico a un recurso cuando este está en buen estado, o a uno diferente cuando el primer recurso no está en buen estado.

**Política de respuesta de múltiples valores**
La respuesta de múltiples valores permite devolver varios valores, como direcciones IP a los servidores web, en respuesta a las consultas de DNS. Se pueden especificar varios valores para casi cualquier registro, pero este direccionamiento también permite verificar el estado de cada recurso, por lo que Route 53 devuelve los valores únicamente para los recursos en buen estado.

Esta política no es sustituto de un balanceador de carga, pero la capacidad de devolver varias direcciones IP (cuyo estado sea comprobable) permite usar el DNS para mejorar la disponibilidad y el equilibrio de la carga.

#### Conclusión
Route 53 es un servicio complejo, pero útil para mantener nuestros sitios web rápidos y altamente disponibles. Es rentable, seguro, escalable, y posee distintas opciones de enrutamiento para distintos casos.

`Contribución creada con aportes de: Ciro Villafraz.`

### 6. Cómo crear el diagrama de una VPC


### 7. Cómo crear la VPC y el internet gateway


### 8. Cómo crear la tabla de enrutamiento y otros componentes

### 9. Administración y gobernanza con AWS

En el pasado, las empresas u organizaciones tenían que lograr un equilibrio entre innovar y mantener un control de los costos, la seguridad y el cumplimiento. Los servicios de administración y gobernanza de AWS sirven para simplificar este equilibrio. Estos servicios buscan que la administración de AWS sea lo más fácil y optimizada posible.

### Administración de cuentas
Entre los servicios que nos ayudan a administrar nuestras cuentas de AWS tenemos:

- **AWS Control Tower**: una manera fácil de configurar y gobernar un entorno seguro de AWS de múltiples cuentas
- **AWS Organizations**: nos brinda una forma de gobernar, de administrar de manera centralizada nuestros entornos en varias cuentas de AWS
- **AWS Budgets**: nos ayuda a planificar y realizar control de costos

#### Servicios de aprovisionamiento
Estos servicios facilitan el aprovisionamiento o la creación y configuración de nuevos recursos de AWS:

- **AWS CloudFormation**: permite modelar y aprovisionar todos sus recursos mediante código
- **AWS OpsWorks**: ayuda a automatizar todas las operaciones con Chef y Puppet
- **AWS Service Catalog**: un servicio para crear, organizar y gobernar nuestro propio catálogo curado de productos de AWS en toda nuestra organización
Marketplace: es donde vamos a poder encontrar, probar e implementar software que se ejecuta en AWS

#### Servicios para operar el entorno AWS
Estos servicios nos ayudan a operar nuestro entorno de AWS

- **Amazon CloudWatch**: permite observar nuestros servicios a través de métricas y registros
- **Amazon Config**: permite registrar y evaluar las configuraciones de nuestros recursos en AWS
- **AWS CloudTrail**: rastrea toda la actividad del usuario de la cuenta de AWS. Esto es importante en investigaciones de seguridad
- **Systems Manager**: optimiza el rendimiento y la seguridad mientras administramos una gran cantidad de sistemas
- **Amazon X-Ray**: analiza y depura aplicaciones en producción

`Contribución creada con aportes de: Ciro Villafraz.`


### 10. Qué es CloudFormation y cuáles son sus beneficios

CloudFormation es un servicio que permite provisionar servicios como máquinas virtuales o VPCs mediante código. Para esto se usan las CloudFormation Templates, que son plantillas en donde especificamos los recursos que queremos desplegar. Estas plantillas pueden estar en formato JSON o YAML, y en ellas se define un stack o pila de recursos a provisionar.

### Beneficios de CloudFormation
¿Por qué es útil desplegar infraestructura y recursos basados en una plantilla de CloudFormation? Porque ofrece las siguientes ventajas.

#### Control de versiones
Ya que podemos definir los recursos que queremos desplegar mediante código, este código lo podemos mantener en un sistema de control de versiones como Git y GitHub. Esto permite tener un historial completo de nuestros recursos en un solo archivo, así como la colaboración en el despliegue de la infraestructura.

#### Automatización
CloudFormation permite a los encargados de DevOps automatizar la creación de infraestructura y recursos en AWS.

#### Escala
Gracias a las plantillas podemos replicar la infraestructura en distintas cuentas de AWS y en distintas regiones. Solo debemos ajustar ciertos parámetros.

`Contribución creada con aportes de: Ciro Villafraz.`


### 11. Qué es Cloudwatch

CloudWatch es un servicio de supervision y observabilidad para AWS. Está diseñado para que podamos ver todo lo que sucede dentro de nuestra cuenta de AWS. En este sentido, CloudWatch ofrece la posibilidad de:

- Recopilar métricas o datos de sus servicios
- Integrar con unos 80 servicios de AWS
- Tener métricas predefinidas
- Recopilar y desplegar datos en una vista unificada con distintos gráficos.
- Configurar de alarmas de acuerdo a los graficos que nos muestre cloudWaatch
- Enviar archivos de registro y buscar de forma interactiva datos de registros. Posee un almacén de registros centralizado. Esto nos ayuda a encontrar y resolver problemas de manera eficaz.

#### Caso de uso de CloudWatch
Imagínate que tienes una máquina virtual a la cual se accede mediante SSH. Si queremos saber cuando alguien intenta piratear nuestra máquina virtual con SSH, podemos enviar los logs de inicio de sesión a CloudWatch.

Mediante CloudWatch, podemos usar un filtro para visualizar el número de intentos de sesión fallidos. Además, podemos configurar una alerta en el caso de que los intentos fallidos superen cierto límite en un periodo específico de tiempo.

`Contribución creada con aportes de: Ciro Villafraz y Christian Andres Moreno Ceballos.`


### 12. Cómo aplicar autoescalamiento

El auto escalamiento (autoscaling) nos permite escalar la capacidad de nuestras instancias de máquinas virtuales automáticamente, de acuerdo con nuestras condiciones definidas.

Podemos aumentar la cantidad de instancias que tenemos en ejecución durante los picos de demanda y disminuirlos cuando no los necesitemos. Esto trae una alta disponibilidad, tolerancia a fallos y un ahorro de costos.

#### Pasos para aplicar autoescalamiento
1. Para aprovechar el autoescalamiento, debemos crear un grupo de auto escalamiento que asocie nuestras instancias.
1. En este grupo especificaremos un tamaño mínimo (el número mínimo de instancias a correr), y una capacidad deseada (el número óptimo de instancias en función de las necesidades).
1. Entonces se agregarán más instancias según sea necesario hasta alcanzar un máximo.
Cabe destacar que el Load Balancer de AWS es lo que permite distribuir automaticamente las conexiones a medida que aparecen y desaparecen estos servidores.

Nota: EC2 no es el único servicio que tiene auto escalamiento. DynamoDB y Aurora también implementan este concepto.

`Contribución creada con aportes de: Ciro Villafraz y Christian Andres Moreno Ceballos.`

### 13. Laboratorio: empezando con CloudFormation

- AWSTemplateFormatVersion: este parámetro es opcional. Aquí especificamos la versión de la plantilla
- Description: cadena de texto que describe la plantilla. Debe ir después de AWSTemplateFormatVersion
- Metadata: objetos que proporcionan información adicional sobre la plantilla
- Parameters: valores que pasaremos a la plantilla al ejecutarse, ya sea durante la creación o actualización del *stack
- Mappings: permite asignar un conjunto de valores a una clave específica. Por ejemplo, para establecer valores en función de una región, podemos crear un mapping que usa el nombre de una región como clave y contiene los valores que deseemos especificar para cada región
- Conditions: controla que se creen recursos o se asignen valores a dichos recursos en función de una condición. Por ejemplo, podemos asignar valores distintos para entornos de producción o de prueba
- Transform: especifica las macros que AWS CloudFormation usa para procesar la plantilla
- Resources: aquí se declaran los recursos a incluir en el stack. Por ejemplo, instancias EC2 o buckets de S3.
- Outputs: declara valores de salida que pueden ser usados en otros stacks

#### Pasos para crear el stack
1. Nos dirigimos a la página de CloudFormation desde nuestra cuenta de AWS (en esta página podremos conocer más sobre el servicio en cuestión).
1. Aquí le damos a “Crear stack”.
1. Para crear el stack, en “Especificar plantilla” seleccionamos “Cargar un archivo de plantilla”, y cargamos el archivo createstack.json. Este archivo simplemente define un bucket de S3 llamado “platzilab”.


### 14. Laboratorio: actualizando y eliminando la stack


### 15.

### 16.

### 17.

### 18.


## References

- [Curso de Introducción a AWS: Redes, Gobernanza y Machine Learning](https://platzi.com/cursos/aws-redes/)
- [AWS Transit Gateway](https://aws.amazon.com/transit-gateway/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)
- [AWS PrivateLink](https://aws.amazon.com/privatelink/?privatelink-blogs.sort-by=item.additionalFields.createdDate&privatelink-blogs.sort-order=desc)
- [Platzi: Clases de redes: asignación direcciones IP](https://platzi.com/clases/2225-redes/35586-clases-de-redes/)
- [Working with stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html)
- [Uso de macros de AWS CloudFormation para realizar un procesamiento personalizado en plantillas](https://docs.aws.amazon.com/es_es/AWSCloudFormation/latest/UserGuide/template-macros.html)
- [createstack.json](https://github.com/platzi/aws-cloud-practitioner/blob/main/lab-cloudformation/createstack.json)
- [Tema 8.1.3 - División de subredes con prefijos /16 y /8.](https://kevin-linares.blogspot.com/2017/05/division-de-redes-IP-en-subredes-Division-de-una-red-IPv4-en-subredes-Division-de-subredes-con-prefijos-16-y-8.html)