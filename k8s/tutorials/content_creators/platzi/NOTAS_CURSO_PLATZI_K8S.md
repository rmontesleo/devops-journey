# Curso de Kubernetes Platzi


## Introduccion a  Kubernetes


### 1/33: Todo lo que aprenderás sobre Kubernetes

```text
Kubernetes es la plataforma de orquestación con mayor éxito en el mercado.

Es necesario que tengas conocimiento o te sientas cómodo trabajando desde la línea de comandos o terminal y conocimientos básicos de Docker.

Objetivos:

Visión y entendimiento de la plataforma de Kubernetes
Uso y buenas prácticas de las distintas herramientas
Workflow aplicativo sobre la plataforma de Kubernetes
Puedes compartir tus conocimientos o logros con el hashtag #PlatziK8s
```

### 2/33: Repaso de contenedores e introducción a k8s


Los contenedores no son un first class citizen del kernel de Linux, un contenedor no es una entidad previamente definida. Es un concepto abstracto conformado por diferentes tecnologías que se potencian las unas a las otras y trabajando en conjunto componen esta tecnología.

**Cgroups o Control Groups**: Son los que permiten que un contenedor o proceso tenga aislado los recursos como memoria, I/O, Disco y más. Limitan los recursos del SO.

**Namespaces**: Permiten aislar el proceso para que viva en un sandbox y no pueda haber otros recursos de SO o contenedores.
	– **Mount Namespaces**: Permite que nuestro proceso tenga una visibilidad reducida de los directorios donde trabaja.
	– **Networking Namespaces**: Permite que cada contenedor tenga su stack de red.
	– **PID**.

**Chroot**: Cambia el root directory de un proceso.		


### 3/33: De pods a contenedores

**Docker & Kubernetes**
- Docker se encarga principalmente de gestionar los contenedores.
- Kubernetes es una evolución de proyectos de Google Borg & Omega.
- Kubernetes pertenece a la CNCF (Cloud Native Computing Foundation).
- Todos los cloud providers (GCP/AWS/Azure/DO) ofrecen servicios de managed k8s utilizando Docker como su container runtime
- Es la plataforma más extensiva para orquestación de servicios e infraestructura

**Kubernetes en la práctica**
- K8s permite correr varias réplicas y asegurarse que todas se encuentren funcionando.
- Provee un balanceador de carga interno o externo automáticamente para nuestros servicios.
- Definir diferentes mecanismos para hacer roll-outs de código.
- Políticas de scaling automáticas.
- Jobs batch.
- Correr servicios con datos stateful.
- Todos los contenedores que viven dentro de un mismo Pod comparten el mismo segmento de red.


### 4/33: ¿Cómo funciona la arquitectura de red de Kubernetes?


### 5/33: Modelos declarativos e imperativos

Los control managers se encargan de estar en un loop constante de reconciliación y tratar de converger a ese estado deseado, ese es un sistema declarativo. Un sistema imperativo parece un sistema fácil de seguir y está compuesto por una serie de pasos que deben seguirse a rajatabla.

- Kubernetes hace énfasis en ser un sistema declarativo
- Declarativo: “Quiero una taza de té”
- Imperativo: “Hervir agua, agregar hojas de té y servir en una taza”
- Declarativo parece sencillo (siempre y cuando uno sepa cómo hacerlo)
- Todo en Kubernetes se crea desde un spec que describe cuál es el estado deseado del sistema
- Kubernetes constantemente converge con esa especificación


### 6/33: Visión general del modelo de red

**`Check again this class after study some network topics`**

- Todo el cluster es una gran red del mismo segmento
- Todos los nodos deben conectarse entre si, sin NAT (Network Adress Translation)
- Todos los pods deben conectarse entre si, sin NAT
- kube-proxy es el componente para conectarnos a pods y contenedores (userland proxy/iptables)
- Los pods trabajan a capa 3 (transporte) y los servicios a capa 4 (protocolos)


### 7/33: Recomendaciones

```text
Durante este curso vamos a utilizar algunos comandos en nuestro cluster de Kubernetes para crear recursos y ejemplificar algunas situaciones de manera concreta. Esos comandos son a modo ejemplificativo y no hacen parte de nuestra aplicación de prueba.

Todo el contenido de nuestra aplicación y los manifest files que utilizamos a lo largo de las clases se encuentran en https://github.com/platzi/curso-kubernetes en sus respectivas carpetas de dockercoins y k8s.

En la clase de aplicación de prueba vamos a clonar este repositorio y trabajaremos sobre los archivos contenidos en las subsiguientes clases.

¡Continuemos con el curso!
```


### 8/33:


### 9/33:


### 10/33:


### 11/33:




### 12/33:

---


## Primer contacto con un cluster de Kubernetes


### 13/33


### 14/33:


### 15/33:


### 16/33:


### 17/33:


### 18/33:


### 19/33:


### 20/33:


### 21/33:


### 22/33:


### 23/33:


### 24/33:


### 25/33:


### 26/33:


### 27/33:


### 28/33:


### 29/33:


### 30/33:


### 31/33:


### 32/33:



---

## Bonus

### 33/ 33



---

## References

- [Curso de Kubernetes](https://platzi.com/cursos/k8s/)
- [Slides del curso](https://static.platzi.com/media/public/uploads/platzi-curso-k8s_d86c22d7-2f5f-4e41-b0f2-f9360e15a173.pdf)
- [GitHub Project](https://github.com/platzi/curso-kubernetes)
- [Play with Docker](https://labs.play-with-docker.com/)
- [Play with Kubernetes](https://labs.play-with-k8s.com/)



## Solving Problems


- []()
- []()
- []()
- []()