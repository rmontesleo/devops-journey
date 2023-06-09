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

### 6. Almacenamiento de datos en AWS

El almacenamiento de datos en la nube consiste en subir tus datos a dicha red de servidores, donde se te proporcionan herramientas para que puedas acceder a ellos de diferentes maneras.

#### Tipos de almacenamiento y sus servicios
Podemos utilizar distintos tipos almacenamiento datos, y para estos hay servicios de AWS. Los tipos de almacenamiento son:

- **Basado en archivos**: el más conocido por todos. Archivos organizados por carpetas y subcarpetas (sistema de ficheros). En esta categoría encontramos a Amazon Elastic File System (EFS) y Amazon FSx for Windows File Server.
- **Bloque**: los archivos se almacenan en volúmenes por fragmentos de datos de igual tamaño, sin procesar. Este tipo de almacenamiento es utilizado como disco duro de nuestros servidores o máquinas virtuales. En esta categoría está Amazon Elastic Block Store (EBS).
- **Objetos**: la información almacenada se almacena como objetos, de manera que cada objeto recibe un identificador único y se almacena en un modelo de memoria plana. Un ejemplo de esto es Amazon Simple Storage Service (S3).

#### Respaldo de datos
Amazon Backup administra y automatiza de forma centralizada las copias de seguridad en los servicios de AWS.

#### Servicios de transferencia de datos
¿Qué pasa si necesitamos transferir datos de nuestros servidores hacia AWS (o viceversa)? AWS ofrece distintos servicios para la transferencia de datos.

- **AWS Storage Gateway**: un conjunto de servicios de almacenamiento en la nube híbrida que brinda acceso en las instalaciones al almacenamiento en la nube.
- **AWS DataSync**: acelera el traslado de datos desde y hacia AWS hasta diez veces más rápido de lo normal.
- **AWS Transfer Family**: escala de forma segura tus transferencias recurrentes de archivos de Amazon S3 y Amazon EFS con los protocolos FTP, SFTP y FTPS.

#### Conclusión
Exploramos de manera breve los distintos servicios de almacenamiento de AWS, así como los tipos de almacenamiento que podemos utilizar.

`Contribución creada con los aportes de: Jesús Ignacio García Fernández y Ciro Villafraz.`


### 7. S3 y S3 Glacier

Amazon S3 es un servicio de almacenamiento de objetos, líder en la industria. Otorga una garantía de no pérdida de datos del 99.999999999% (11 9’s).

#### Clases de almacenamiento en S3
Amazon nos ofrece distintas clase de almacenamiento S3 en función de nuestras necesidades de acceso y disponibilidad de los datos.

- **S3 Standard**: almacenamiento de objetos de alta durabilidad, disponibilidad y rendimiento para datos a los que se obtiene acceso con frecuencia.
- **S3 Standard-IA**: se utiliza con datos a los que se accede con menos frecuencia, pero que requieren un acceso rápido cuando es necesario.
- **S3 Zone-IA**: similar a Standard-IA, pero con un menor costo de almacenamiento ya que solo usa una zona de disponibilidad. Distinto de las demás clases de almacenamiento de S3, que almacenan datos en un mínimo de tres zonas de disponibilidad (AZ).
- **S3 Glacier**: ofrece el almacenamiento de menor costo para los datos de larga duración y acceso poco frecuente. Tiene un costo de $1 por TB al mes. Tiene tres opciones para la recuperación de datos (estándar, masiva y acelerada).
- **S3 Glacier Deep Archive**: la clase de almacenamiento más económica de Amazon S3. Admite la retención a largo plazo y la conservación digital de datos a los que se accede una o dos veces al año.
- **S3 Intelligent-Tiering**: un tipo de almacenamiento que intenta ahorrar costos moviendo archivos entre los distintos tipos de almacenamiento S3, basado en los patrones de uso de los archivos.

#### Conclusión
Tenemos variedad de opciones para escoger la clase de almacenamiento S3 en función de nuestras necesidades. Si necesitamos un almacenamiento altamente disponible y duradero, S3 Standard es la mejor opción, mientras que si necesitamos un almacenamiento a largo plazo y de acceso infrecuente, podemos usar S3 Glacier. Escoge la mejor opción según tu caso de uso.

`Contribución creada con los aportes de: Jesús Ignacio García Fernández y Ciro Villafraz.`


### 8. Explicando el Amazon Elastic File System (EFS)

**Amazon Elastic File System (EFS)** brinda un sistema de archivos elástico, sencillo, sin servidor y práctico basado en NFS para las máquinas virtuales de EC2.

NFS es un protocolo de archivos en red que permite acceder a archivos y directorios que no están en tu sistema. Esto permite que miles de máquinas puedan conectarse a EFS y procesar los datos que allí se encuentran.

#### Características de EFS
EFS es altamente disponible y duradero. Provee protección contra una interrupción de la zona de disponibilidad, replicando los archivos en múltiples zonas dentro de una región.

Adicionalmente:

- EFS brinda dos clases de almacenamiento: Standar y Standar IA (para acceso poco frecuente). Puedes implementar políticas para que tus archivos se muevan de Standar a Standar IA después de cierto tiempo.
- Los datos están encriptados de manera automática.

`Contribución creada por Ciro Villafraz.`

### 9. AWS Storage Gateway

AWS Storage Gateway nos brinda acceso a almacenamiento en la nube prácticamente ilimitado desde nuestra propia infraestructura.

Storage Gateway se compone de tres puertas de acceso diferentes:

#### File Gateway
File Gateway provee interfaces SMB y NFS para amazon S3, tanto en Windows como en Linux. Gracias a File Gateway, en ambos sistemas operativos veremos un sistema de archivos tal cual como si fuera un disco montado en nuestros computadores, los cuales escriben archivos al sistema, y File Gateway se encarga de guardarlos en S3.

Gracias a esto podemos guardar archivos a S3 como si se tratara de guardar archivos locales. Los archivos S3 luego pueden ser usados por cualquier servicio de AWS.

### Tape Gateway
Supón que tienes copias de seguridad en cintas físicas. Tape Gateway te permite migrar copias de seguridad a una bibliteca de cintas virtuales en AWS. Tape Gateway es compatible con los principales software de respaldo.

Los contenidos de tus cintas se guardan en S3, lo que te permite implementar S3 Glacier y S3 Glacier Deep Archive para guardar tus copias de seguridad a largo plazo. Una vez que implementas Tape Gateway, puedes olvidarte de los costos relacionados a mantener las cintas físicas.

### Volume Gateway
Volume Gateway otorga almacenamiento en bloque con protocolo iSCSI, respaldado en la nube. Almacena datos en S3 de acuerdo a dos modos:

- **Modo caché**: almacena los datos principales en S3, mientras que los datos de acceso frecuente se guardan localmente y en caché.
- **Modo almacenado**: todos los datos se guardan localmente, mientras que se hace una copia de seguridad de manera asíncrona en S3.

#### Conclusión
Vimos tres posibilidades de uso de Amazon Storage Gateway. Para cada caso de uso, hay una puerta de acceso adecuada, ya sea File, Tape o Volume Gateway.

`Contribución creada por Ciro Villafraz.`

### 10. Laboratorio: crea tu primer bucket de S3 para guardar objetos

### 11. Laboratorio: versionamiento



### 12. Bases de datos en AWS

Las bases de datos son colecciones estructuradas de datos. Almacenan datos eletrónicamente, y se acceden a ellos desde un sistema informático. AWS cuenta con más de quince motores de bases de datos diferentes, seguros y altamente disponibles.

#### Bases de datos relacionales
Los servicios de bases de datos relacionales en AWS son:

- **Amazon Aurora**: base de datos relacional compatible con MySQL y PostgreSQL creada para la nube.

- **Amazon Relational Database Service (Amazon RDS)**: servicio de bases de datos relacionales administrado para MySQL, PostgreSQL, MariaDB, Oracle BYOL o SQL Server. Facilita la configuración, el uso y el escalado de varios motores de bases de datos.

- **Amazon Redshift**: ideal para analítica. Usa SQL para analizar datos estructurados y semiestructurados en almacenamientos de datos, bases de datos operativas y lagos de datos, con hardware y machine learning diseñados por AWS para ofrecer rendimiento al mejor precio a cualquier escala. A propósito, Platzi tiene un curso de Redshift

#### Bases de datos clave-valor
**Amazon DynamoDB** es una base de datos de documentos y valores clave que ofrece un rendimiento de milisegundos de un solo dígito a cualquier escala. Está dirigida a aplicaciones de web de alto tráfico, sistemas de comercio electrónico y aplicaciones de juego.

#### Bases de datos en memoria
**Amazon ElastiCache** es un servicio de almacenamiento de caché en memoria completamente administrado que admite casos de uso flexibles y en tiempo real. Se usa para almacenar en caché administración de sesiones, tablas de clasificación de juegos y aplicaciones Geo-Espaciales. En ElastiCache encontramos ElastiCache para Memcached y ElastiCache para Redis.

#### Bases de datos basadas en documentos
**Amazon DocumentDB** es un servicio de base de datos de larga duración, de alta disponibilidad, rápida, escalable y completamente administrado para operar cargas de trabajo de MongoDB esenciales. Entre sus casos de uso se encuentra la gestión de contenidos, catálogos y perfiles de usuario.

#### Conclusión
Definimos de manera breve algunos tipos de bases de datos en AWS. En las siguientes clases veremos un poco más en detalle estos servicios.

`Contribución creada con los aportes de: Gilberto Pérez Garrido y Ciro Villafraz.`

`


### 13. Ventajas de Amazon RDS

Amazon RDS permite crear, ejercutar y ejecutar bases de datos relacionales en la nube. Las bases de datos relacionales son aquellas en las que los datos almacenados poseen una relación entre sí. Los datos se pueden consultar con un lenguaje de consulta llamado SQL.

En Amazon RDS puedes escoger entre 6 motores de bases de datos relacionales diferentes: MYSQL, MariaDB, PostgreSQL, Oracle, SQL Server y Amazon Aurora.

#### Ventajas de Amazon RDS
Una de las ventajas de Amazon RDS es que facilita la configuración, siendo un servicio completamente administrando (PAAS). Además:

- RDS es altamente escalable, y puede ser usado en múltiple zonas de disponibilidad.
- Permite crear réplicas de bases de datos de solo lectura.
- RDS realiza copias de seguridad automática, y es tolerante a fallos.
- En RDS solo** pagas por lo que usas.**

`Contribución creada por Ciro Villafraz.

### 14. La base de datos DynamoDB

DynamoDB es una base de datos NOSQL de documentos clave-valor, que ofrece un rendimiento en milisegundos de un solo dígito. Entre sus casos de uso tenemos manejo de datos actualizados en tiempo real.

Una base de datos clave-valor almacena datos en forma de claves y valores/atributos. En un documento de Dynamo DB podemos tener claves y una cantidad de atributos distinta para cada clave. Estos atributos también pueden ser de distintos tipos.

#### Características de DynamoDB
DynamoDB es completamente administrado (PAAS). Funciona en múltiples regiones y puede manejar hasta 20 millones de solicitudes por segundo. Además, cuenta con seguridad, respaldo y restauración integrados.

`Contribución creada con el aporte de Ciro Villafraz.`


### 15. ¿Qué es ElastiCache?

**Amazon ElastiCache** es un servicio de almacenamiento en memoria 100% administrado que admite casos de uso flexibles y en tiempo real.

Es una base de datos en memoria que almacena datos a los que se ha accedido previamente en memoria caché, para mejorar la rapidez de acceso a estos datos. Consultar datos en caché siempre es más rápido que consultar directamente la base de datos.

Un ejemplo de uso es el de un sitio de noticias, al cual se accede miles de veces al día. Si los artículos se mantienen en una base de datos en memoria, se podrá acceder a estos mucho más rápido.

ElastiCache posee dos motores, Redis y Memcached. Ambos se monitorean a sí mismos continuamente, y pueden ser escalados hacia arriba o abajo en función de la demanda de la aplicación.

`Contribución creada por Ciro Villafraz.`





## Resources

- [Curso de Introducción a AWS: Cómputo, Almacenamiento y Bases de Datos](https://platzi.com/cursos/aws-computo/)
- [PDF Slides](https://static.platzi.com/media/public/uploads/curso-de-introduccion-a-aws-computo-almacenamiento-y-bases-de-datos_591b2667-5cc8-478c-aea6-3f08a6d7a74e.pdf)

- [AWS IoT](https://aws.amazon.com/es/iot/)
- [Preguntas frecuentes sobre AWS Lambda](https://aws.amazon.com/es/lambda/faqs/)
- [Utilización de AWS Lambda con otros servicios](https://docs.aws.amazon.com/es_es/lambda/latest/dg/lambda-services.html#intro-core-components-event-sources)
- [What are Containers?](https://cloud.google.com/learn/what-are-containers)

- [Amazon Elastic File System](https://aws.amazon.com/es/efs/)
- [Amazon FSx para Windows File Server](https://aws.amazon.com/es/fsx/windows/)
- [Amazon Elastic Block Store (EBS)](https://aws.amazon.com/es/ebs/)
- [Amazon S3](https://aws.amazon.com/es/s3/)
- [Clases de almacenamiento de Amazon S3](https://aws.amazon.com/es/s3/storage-classes/?nc=sn&loc=3)
- [Sistema de archivos de red, NFS](https://www.computerweekly.com/es/definicion/Sistema-de-archivos-de-red-NFS)
- [Server Message Block](https://es.wikipedia.org/wiki/Server_Message_Block)
- [File Gateway](https://aws.amazon.com/es/storagegateway/file/)
- [Tape Gateway](https://aws.amazon.com/es/storagegateway/vtl/)
- [Volume Gateway](https://aws.amazon.com/es/storagegateway/volume/)
- [¿Qué es el almacenamiento iSCSI y cómo crear una SAN iSCSI?](https://community.fs.com/es/blog/iscsi-storage-basics-plan-iscsi-san.html)
- [AWS Storage Gateway](https://aws.amazon.com/es/storagegateway/)
- [Bases de datos relacional ¿Qué es y sus características?](https://ayudaleyprotecciondatos.es/bases-de-datos/relacional/)
- [Información general sobre el almacenamiento en caché](https://aws.amazon.com/es/caching/?nc1=h_ls)
- [Amazon RDS](https://aws.amazon.com/es/rds/?p=ft&amp;c=db&amp;z=3)
- [Cree aplicaciones modernas con las bases de datos gratuitas en AWS](https://aws.amazon.com/es/free/database/)
- [Fundamentos de las bases de datos NoSQL](https://www.mongodb.com/es/nosql-explained)
- [Redis](https://redis.io/)
- [Memcached](https://memcached.org/)
