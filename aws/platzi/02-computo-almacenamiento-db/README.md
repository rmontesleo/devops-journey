# Curso de Introducción a AWS: Cómputo, Almacenamiento y Bases de Datos

## Classes

### 1. Intro

### 2. Cómputo en AWS

AWS describe su capacidad de cómputo como “cómputo para cualquier carga de trabajo”. **Cómputo se refiere a usar una computadora para procesamiento**, ya sea sumar dos números o alojar un sitio web. Entre los servicios de cómputo se encuentran:

#### Instancias o máquinas virtuales
Una máquina virtual es un software que simula un sistema operativo, y que puede ejecutar programas dentro de dicho sistema como si fuera una computadora real. Los servicios de máquinas virtuales (o instancias) en AWS son:

- **Amazon EC2**: máquinas virtuales seguras y redimensionables.
- **Amazon EC2 Spot**: cargas de trabajo tolerante a fallas, por hasta el 90% del precio normal (nota: Amazon puede reclamar estas instancias en cualquier momento con solo dos minutos de anticipación).
- **Amazon EC2 AutoScaling**: agrega o elimina automáticamente la capacidad informática para satisfacer tus necesidades bajo demanda.
- **Amazon EC2 LightSail**: plataforma en la nube fácil de usar para crear una aplicación o un sitio web.

#### Contenedores
Un contenedor es una unidad de software que empaca un software en específico junto con sus dependencias. Se diferencian de las máquinas virtuales en que estas virtualizan el hardware, mientras que los contenedores virtualizan el sistema operativo. Los servicios de contenedores de AWS son:

- **Amazon Elastic Container Services (ECS)**: servicio para correr contenedores confiables y escalables.
- **Amazon Elastic Container Registry (ECR)**: servicio para almacenar, administrar e implementar imágenes de contenedores.
- **Amazon Elastic Kubernetes Service (EKS)**: servicio de Kubernetes administrado por AWS.

#### Serverless
La computación serverless se refiere a que la responsabilidad de administrar servidores o máquinas virtuales se le delega al proveedor de nube, por lo que sólo debemos precuparnos por el código de nuestras aplicaciones. Amazon Lambda nos permite ejecutar piezas de código sin servidores.

#### Servicios de borde (Edge)
El **Edge Computing** se refiere al cómputo y procesamiento de datos en una ubicación cercana a la necesaria para el negocio. Los servicios de borde o edge computing de AWS son:

- **Amazon Outposts**: permite ejecutar los servicios de AWS en nuestros propios servidores en lugar de Amazon.
- **Amazon Snow Family**: es una familia de dispositivos desde un disco duro portátil hasta un semi-remolque completo lleno de discos de almacenamiento. Estos dispositivos te permiten cargar archivos en ellos, para luego ser enviados a Amazon y cargados en sus servidores.
- **AWS Wavelength**: permite acceder a los servicios AWS desde dispositivos 5G sin pasar por Internet.
- **VMWare AWS**: permite migrar cargas de trabajo de VMWare a AWS.
- **AWS Local Zones**: permite ejecutar las aplicaciones más cerca de los usuarios finales, a una menor latencia.

Conclusión
Exploramos una gran cantidad de servicios de computación en AWS. En las próximas clases veremos estos servicios más en detalle.

`Contribución creada con los aportes de: Jesús Ignacio García Fernández, Eduardo Zamarron Muñoz y Ciro Villafraz.`

### 3. Conoce qué es Amazon EC2

EC2 permite alquilar máquinas virtuales, llamadas instancias EC2. Puedes elegir diferentes tipos de EC2 con diferente CPU, RAM y almacenamiento. Hay instancias optimizadas para cómputo, memoria y almacenamiento, entre otras.

En EC2, el sistema de pago más común es por hora o por segundo, dependiendo el tipo de instancia. Por ejemplo, para una instancia que cueste $0.1 la hora, puedes pagar, ya sea una instancia por 24 horas o 24 instancias por una hora. En ambos casos pagas lo mismo (24 * 0.10 = $2.4).

#### Opciones y precios bajo demanda
Las instancias pueden redimiensionarse. Puedes empezar por una instancia de bajo costo, y si necesitas aumenta su capacidad, apagas la instancia y seleccionas un nuevo tipo de instancia. Cuando enciendas de nuevo la instancia, verás su capacidad aumentada. La siguiente tabla muestra algunos tipos de instancias.

`Contribución creada por Ciro Villafraz.`

### 4. Contenedores de software

El propósito de un contenedor es crear un paquete de tu programa y todas sus librerías y dependencias con las versiones específicas con las que has trabajado, para producir una imagen que pueda ser ejecutada en cualquier máquina.

Un problema común del desarrollo de software es utilizar distintas versiones de diferentes librerías/lenguajes de programación/programas. Docker nos permite crear contenedores para resolver este problema.

#### Amazon ECS
Amazon ECS es un servicio de contenedores, donde puedes implementar tus imágenes en contenedores en AWS. Cuando corras tus contenedores en AWS, no notarás diferencia entre tu máquina local y el entorno de AWS.

`Contribución creada por Ciro Villafraz.`

### 5. AWS Lambda

AWS Lambda es un servicio serverless que nos permite ejecutar código en respuesta a eventos, sin preocuparnos por servidores o infraestructura. Estos eventos pueden ser temporizadores, visitas a alguna sección de nuestra aplicación, solicitudes HTTP, entre otros.

Entre sus casos de uso encontramos el (pre)procesamiento de datos a escala, y la ejecución de backends web, móviles y de IoT interactivos. Lambda se puede combinar con otros servicios de AWS para crear experiencias en línea seguras, estables y escalables.

#### ¿Cómo se factura Lambda?
Lambda se factura por milisegundos, y el precio depende del uso de RAM. Por ejemplo, 128MB RAM x 30 millones de eventos por mes resultan en un costo de $11.63 al mes.

`Contribución creada por: Ciro Villafraz.`

### 6.

### 7.

### 10.

### 11.

### 12.

### 13.

### 14.

### 15.

### 16.


## Resources

- [Curso de Introducción a AWS: Cómputo, Almacenamiento y Bases de Datos](https://platzi.com/cursos/aws-computo/)
- [PDF Slides](https://static.platzi.com/media/public/uploads/curso-de-introduccion-a-aws-computo-almacenamiento-y-bases-de-datos_591b2667-5cc8-478c-aea6-3f08a6d7a74e.pdf)

- [AWS IoT](https://aws.amazon.com/es/iot/)
- [Preguntas frecuentes sobre AWS Lambda](https://aws.amazon.com/es/lambda/faqs/)
- [Utilización de AWS Lambda con otros servicios](https://docs.aws.amazon.com/es_es/lambda/latest/dg/lambda-services.html#intro-core-components-event-sources)
- [What are Containers?](https://cloud.google.com/learn/what-are-containers)