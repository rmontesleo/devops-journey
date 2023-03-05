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


### 8/33: Introducción a aplicación de prueba

- [Platzi Project](https://github.com/platzi/curso-kubernetes/)


### 9/33: Instalando nuestro primer cluster con Minikube, Kubeadm

**Minikube** es una herramienta para desplegar un cluster en tu máquina local.
**kubeadm** es un boostrap, un utilitario que permite realizar todo lo mostrado en el repositorio de Kelsey.

#### Lecturas recomendadas

- [GitHub - kelseyhightower/kubernetes-the-hard-way: Bootstrap Kubernetes the hard way on Google Cloud Platform. No scripts.](https://github.com/kelseyhightower/kubernetes-the-hard-way)

- [GitHub - kubernetes/minikube: Run Kubernetes locally](https://github.com/kubernetes/minikube)


- [Minikube start](https://minikube.sigs.k8s.io/docs/start/)


#### some options to start minikube
```bash

minikube start --memory=3g --nodes 4  --cpus=4 --vm-driver=docker

minikube start  --nodes 4  --vm-driver=docker 

# if you want other profile
minikube start -p platzi2

```

#### some options with minikube
```bash
minikube help

minikube ip

minikube status

```

### some kubectl options
```bash

# get pods from all namespaces	
kubectl get po -A

kubectl get all -o wide

kubectl get nodes -o wide

kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080
kubectl run hello-minikube2 --image=k8s.gcr.io/echoserver:1.4 --port=8080
kubectl run hello-minikube3 --image=k8s.gcr.io/echoserver:1.4 --port=8080
kubectl run hello-minikube4 --image=k8s.gcr.io/echoserver:1.4 --port=8080

kubectl get pods
kubectl get pods -o wide
kubectl delete pods hello-minikube hello-minikube2 hello-minikube3 hello-minikube4

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort


service_ip=$(minikube ip)

kubectl get all --selector app=hello-minikube -o wide

# find by service port 

curl $servcie_ip:$service_port


# or using minikube service
minikube service hello-minikube

# if you are using WSL 
 http://127.0.0.1:$service_port


```


### 10/33: Instalando nuestro primer cluster con Kubeadm

- [Creating a cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)


**`ctrl + insert to copy and shift + insert to paste  in play with K8s `**


```bash
 completely the user's responsibilites.

 You can bootstrap a cluster as follows:

 1. Initializes cluster master node:

 kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16
    

 2. Initialize cluster networking:

kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml


 3. (Optional) Create an nginx deployment:

 kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml


                          The PWK team.
```


#### In the node 1 (master)
```bash
kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16

# Then you will see a token.. copy and paste the command in the worker node
```

#### In the node2 (woerker)
```bash
kubeadm join 192.168.0.18:6443 --token p2ecpi.ll2g085lx722lc9e  --discovery-token-ca-cert-hash sha256:8201ff8e06f9340ad898a5d9cc87958a36e74b6b691b9e25b116c0592eb31a5f
```

#### In the node 1 (master)
```bash
# see the status of the nodes
kubectl get nodes -o wide

# see what is failling in the node1
kubectl describe node node1

# initialize the networking
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
kubectl get nodes -o wide

# when the nodes are ready you can schedule work on the nodes
kubectl create deployment my-nginx --image=nginx --replicas=2 --port=80

```


#### For more options.. and try to use at least 3 virtual machines...
- [How to Install a Kubernetes Cluster with Kubeadm on Rocky Linux](https://www.howtoforge.com/how-to-setup-kubernetes-cluster-with-kubeadm-on-rocky-linux/)



### 11/33: Desplegando el Cluster en AWS con EKS (CHECK THIS CLASS AGAIN)


```bash

```


- [AWS EKS Tutorial | Kubernetes on AWS | Create EKS Step by Step for Beginners | K21Academy](https://www.youtube.com/watch?v=DcnviAwmzM4)
- [AWS EKS - Create Kubernetes cluster on Amazon EKS | the easy way](https://www.youtube.com/watch?v=p6xDCz00TxU)



### 12/33: Desplegando una aplicación de prueba con EKS  (CHECK THIS CLASS AGAIN, DO THE TUTORIAL)

- [Kubernetes Examples guestbook-go](https://github.com/kubernetes/examples/tree/master/guestbook-go)


---


## Primer contacto con un cluster de Kubernetes


### 13/33: Usando kubectl

**Kubectl** es la herramienta CLI para interactuar con el cluster de kubernetes, puede usarse para desplegar pods de pruebas, acceder a los contenedores y realizar algunos comandos como get nodes o get services

En $HOME/.kube es donde se encuentra nuestro archivo config, la configuración de kubernetes.

- `kubectl get nodes`: lista todos los nodos que tiene nuestro cluster
- `kubectl --config`: puedes pasarle el archivo de configuración en caso de estar usando uno diferente.
- `kubectl --server --user`: especificas la configuración sin necesidad de darle un archivo.
- `kubectl get nodes -a wide`: muestra más datos de los nodos
- `kubectl describe nodes node1`: da mucha información de ese nodo en especifico.
- `kubectl explain node`: permite ver la definición de todo lo relacionado a ese nodo

####
```bash
kubectl get nodes
kubectl get node
kubectl get no

kubectl get nodes -o wide
kubectl get nodes -o yaml

kubectl describe nodes $node_name


kubectl explain node
kubectl explain node.kind
kubectl explain node.metadata
kubectl explain node.spec
kubectl explain node --recursive
```


### 14/33: Creación y manejo de pods

#### create and handle pods
```bash

kubectl get nodes

kubectl get pods
kubectl get pods -A
kubectl get pods --all-namespaces
kubectl get pods -n kube-system

# this run a single pod
kubectl run pingpong --image alpine ping 1.1.1.1
kubectl logs pingpong 
kubectl logs pingpong  -f


kubectl create deployment pingpong --image=alpine -- ping 1.1.1.1
kubectl get all --selector app=pingpong -o wide

# For logs. In this way taka a random pod in the deployment
kubectl logs deploy/pinpongdep


# take the exact name of the pod
kubectl logs $pod_name

# get the last 20 lines of logs
kubectl logs $pod_name --tail 20

# -f follow the logs in the pod
kubectl logs $pod_name --tail 20 -f

# see the logs of many pods with the label app
kubectl logs -l  app=pingpong

```


### 15/33: Deployments y replica sets

####
```bash
kubectl get all 
kubectl get all -o wide

kubectl scale deploy/pingpong --replicas=3
kubectl get pods 

kubectl scale deploy pingpong --replicas=6
kubectl get pods --selector app=pingpong

kubectl scale deploy pingpong --replicas=10
kubectl get pods --selector app=pingpong -o wide

# watch flag similar to follow 
kubectl get pods -w


kubectl describe pod $pod_name

kubectl get pod $pod_name
kubectl get pod $pod_name -o yaml

## use the flag dry-run to generate the yaml of the pod or deployment

# create the yaml of a pod
kubectl run --dry-run=true -o yaml pingpong --image=alpine -- ping 1.1.1.1

# create the yaml of a deployment
kubectl create deployment --dry-run=true -o yaml pingpong --image=alpine -- ping 1.1.1.1

```


---

## Balanceo de carga y service discovery


### 16/33:


### 17/33:


### 18/33:


---

## Escalando nuestra aplicación

### 19/33:


### 20/33:


### 21/33:


### 22/33:


### 23/33:

---

## Optimizando el uso de nuestro cluster


### 24/33:


### 25/33:


### 26/33:

---

## Autorizacion y Namespaces


### 27/33:


### 28/33:


### 29/33:


### 30/33:


### 31/33:

---

## Fin del curso


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
- [Creating a cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
- [How to Install a Kubernetes Cluster with Kubeadm on Rocky Linux](https://www.howtoforge.com/how-to-setup-kubernetes-cluster-with-kubeadm-on-rocky-linux/)
- [AWS EKS Tutorial | Kubernetes on AWS | Create EKS Step by Step for Beginners | K21Academy](https://www.youtube.com/watch?v=DcnviAwmzM4)
- [Getting started with Amazon EKS – AWS Management Console and AWS CLI](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html)
- [Amazon EKS cluster IAM role](https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html#create-service-role)
- [Provision an EKS Cluster (AWS)](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)
- [AWS EKS - Create Kubernetes cluster on Amazon EKS | the easy way](https://www.youtube.com/watch?v=p6xDCz00TxU)
- [Getting started with Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)
- [Deploy a sample application](https://docs.aws.amazon.com/eks/latest/userguide/sample-deployment.html)
- [Kubernetes Examples](https://github.com/kubernetes/examples)
- [Kubernetes Examples guestbook-go](https://github.com/kubernetes/examples/tree/master/guestbook-go)


## Solving Problems


- [Cannot copy or paste commands in labs.play-with-kubernetes free intance](https://stackoverflow.com/questions/69718912/cannot-copy-or-paste-commands-in-labs-play-with-kubernetes-free-intance)
- []()
- []()
- []()