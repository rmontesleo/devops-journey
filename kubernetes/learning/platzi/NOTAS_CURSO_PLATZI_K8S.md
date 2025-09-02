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
kubectl run --dry-run=client -o yaml pingpong --image=alpine -- ping 1.1.1.1

# create the yaml of a deployment
kubectl create deployment --dry-run=client -o yaml pingpong --image=alpine -- ping 1.1.1.1

```


---

## Balanceo de carga y service discovery


### 16/33: Accediendo a nuestros PODS a través de servicios


El tipo de servicio en Kubernetes pueden ser de cuatro formas diferentes:

- **Cluster IP**: Una IP virtual es asignada para el servicio
- **NodePort**: Un puerto es asignado para el servicio en todos los nodos
- **Load Balancer**: Un balanceador externo es provisionado para el servicio. Solo disponible cuando se usa un servicio con un balanceador
- **ExternalName**: Una entrada de DNS manejado por CoreDNS


####
```bash

# if using minikube 
minikube start  --vm-driver=docker --nodes 6

# this cluster will fail because the image is wrong
kubectl create deployment httpenv --image jpetazzo/httpenc

# see the details of error to see what happend
kubectl describe pod $pod_name

kubectl delete deploy httpenv


# use the right image
kubectl create deployment httpenv --image jpetazzo/httpenv



kubectl scale deployment httpenv --replicas=10

kubectl get pods -o wide --selector app=httpenv


curl http://$pod_ip:8888

curl http://$pod_ip:8888 | jq ""

# kubectl create a service of type ClusterIP
kubectl expose deployment httpenv --port=8888 

curl http://$cluster_ip:8888

curl http://$cluster_ip:8888 | jq ""

curl http://$cluster_ip:8888 | jq "".HOSTNAME

for i in $(seq 10); do curl -s http://$cluster_ip:8888 | jq .HOSTNAME; done


```



#### get pod info, service ip ( from platzi student)
```bash
# Curl al primer POD
curl http://$(kubectl get po -l app=httpenv -o jsonpath="{.items[0].status.podIP}"):8888 | jq ""

#Curl al service
curl http://$(kubectl get service/httpenv -o jsonpath='{.spec.clusterIP}'):8888 | jq ""

#Ciclo para revisar el Curl extrayendo cual sea la IP 
for i in $(seq 10); do curl -s http://$(kubectl get service/httpenv -o jsonpath='{.spec.clusterIP}'):8888 | jq ".HOSTNAME"; done

```


### 17/33: Enrutando el tráfico utilizando servicios (CHECK AGAIN THIS CLASS)

```bash
# iptables: see different iptables, in this case nat and list the output rules
sudo iptables -t nat -L OUTPUT

# this inside the cluster the the nat rules list kube-services without names 
sudo iptables -t nat -nL KUBE-SERVICES

sudo iptables -t nat -nl KUBE-SVC-$SOME_SERVICE_ID


kubectl describe service httpenv

```




### 18/33: Desplegando nuestra app en k8s


-[DOcker Image](https://hub.docker.com/u/dockercoins)

```bash
kubectl create deployment redis --image=redis

kubectl create deployment hasher --image=dockercoins/hasher:v0.1

kubectl create deployment rng --image=dockercoins/rng:v0.1

kubectl create deployment webui --image=dockercoins/webui:v0.1

kubectl create deployment worker --image=dockercoins/worker:v0.1

kubectl get pods

kubectl logs $worker_pod_id

kubectl expose deployment redis --port 6379

kubectl expose deployment rng --port 80

kubectl expose deployment hasher --port 80

kubectl logs $worker_pod_id

kubectl logs $worker_pod_id --tail 20 -f


kubectl expose deploy webui --type=NodePort --port=80

curl http://$node_public_ip:$webui_service_port


# if you are using minikube
minikube service webui --url

# the url will be  http://127.0.0.1:$webui_service_port




```

- [Accessing apps](https://minikube.sigs.k8s.io/docs/handbook/accessing/)


---

## Escalando nuestra aplicación


### Check again this class
### 19/33: Exponiendo servicios interna y externamente (kubectl-proxy)

- **kubectl-proxy**: es un proxy que corre foreground y nos permite acceder a la API de kubernetes de manera autenticada.
- **kubectl port-forward** : nos permite realizar lo mismo que kubectl-proxy, pero accediendo a cualquier puerto del servicio expuesto en nuestro cluster

#### 
```bash
#
kubectl get svc kubernetes

#  start a service check the ip and port to access this proxy
kubecl proxy &

# see the API
curl http://$kube_proxy_ip:$kube_proxy_port

#
curl http://$kube_proxy_ip:$kube_proxy_port/version

#
kubectl proxy --help


kubectl port-forward svc/redis  10000:6379 &

# check this again
telnet localhost 10000

```


### 20/33: Kubernetes dashboard (CHECK THIS AGAIN)

- [On Securing the Kubernetes Dashboard](https://blog.heptio.com/on-securing-the-kubernetes-dashboard-16b09b1b7aca)


####
```bash
cd curso-kubernetes/k8s/

# apply a manifest to install k8s dashboard 
kubectl apply -f kubernetes-dashboard.yaml

# it wont appear in default namespace
kubectl get services

kubectl get ns
kubectl get service -n kube-system

kubectl edit serice kubernetes-dashboard -n kube-system
```

#### edit the service in yaml format, change the service from ClusterIP to NodePort
```yaml
type: NodePort
```

###
```bash

kubectl get service -n kube-system
```


### 21/33: Balanceo de carga y Daemon sets

```bash

# see the deployment definition of rng 
kubectl get deploy rng -o yaml

kubectl get deploy rng -o yaml  > rng.yaml

# do some changes in this file
vim rng.yaml
```

#### original 
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2023-03-06T14:18:10Z"
  generation: 1
  labels:
    app: rng
  name: rng
  namespace: default
  resourceVersion: "10068"
  uid: 3a33870e-869b-49bb-8d56-1767c30bc0c6
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: rng
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: rng
    spec:
      containers:
      - image: dockercoins/rng:v0.1
        imagePullPolicy: IfNotPresent
        name: rng
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  availableReplicas: 1
  conditions:
  - lastTransitionTime: "2023-03-06T14:18:10Z"
```

### Changing to DaemonSet and remove the status fields
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: null
  generation: 1
  labels:
    app: rng
  name: rng
  namespace: default
  resourceVersion: "10068"
spec:  
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: rng
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: rng
    spec:
      containers:
      - image: dockercoins/rng:v0.1
        imagePullPolicy: IfNotPresent
        name: rng
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30

```

```bash
# use the validate flag to allow deploy the yaml
kubectl apply -f rng.yaml --validate=false

kubectl get pods -o wide 

# chech the label app=rng, it allows the load balancing
kubectl describe svc rng

kubectl get pods --selector app=rng -o wide

kubectl delete pod $original_rng_pod

# you will see the pod is recreated
kubectl get pods --selector app=rng -o wide

# now remove the label of one specific pod
kubectl label pod $second_from_original_rng_pod app-

# kubectl creates a new one
kubectl get pods --selector app=rng -o wide


```

### 22/33: Despliegues controlados

```bash
# Using rolling updates

kubectl get deploy -o json


# 
kubectl get deploy -o json \
| jq ".items[] | {name: .metadata.name , maxSurge:.spec.strategy.rollingUpdate.maxSurge, maxUnavailable: .spec.strategy.rollingUpdate.maxUnavailable    }"

# see the initial state of all the deployment
kubectl get deployment

#
kubectl get pods -o wide --selector app=worker -w

# scale de deployment
kubectl scale deployment worker --replicas 10


# see the next state of all the deployment
kubectl get deployment

# try to update with a wrong version
kubectl set image deploy worker worker=dockercoints/worker:v0.2    

# update the version image of the deployment
kubectl set image deploy worker worker=dockercoins/worker:v0.2

# try to update to other version
kubectl set image deploy worker worker=dockercoins/worker:v0.3

# return to previous version
kubectl rollout undo deploy worker

# verify your deployment
kubectl get deploy

kubectl edit deploy worker
```

#### initial strategy state
```yaml
 strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
```

#### new state, only 1 pod can be offline, create new,  one bye one
```yaml
strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
    type: RollingUpdate
```

#### verify the new status
```bash
kubectl rollout status deployment worker


# apply again the wrong version
kubectl set image deploy worker worker=dockercoins/worker:v0.3

# you will see 10 active pods and 1 failed, trying to create
kubectl get pods -o wide --selector app=worker 

# rollback to previous  version
kubectl rollout undo deploy worker

```


### 23/33: Healthchecks (VERIFY AGAIN THIS TOPIC)

**Healthchecks**: es un organismo que tiene kubernetes para saber si nuestra aplicación está funcionando de una manera correcta para saber si debe removerla o reiniciarla al no estar en un estado deseable.

####
```bash
kubectl get all -o wide

# edit redis deployment
kubectl edit deploy redis
```

#### original
```yaml
 containers:
      - image: redis
        imagePullPolicy: Always
        name: redis        
        resources: []    
```


#### with the change
```yaml
 containers:
      - image: redis
        imagePullPolicy: Always
        name: redis
        livenessProbe:
          exec:
            command: [ "redis-cli", "ping" ]
        resources: []    
```

####
```bash

kubectl get pods -o wide

kubectl get pod $redis_pod

kubectl describe pod $reis_pod

# edit again redis deployment
kubectl edit deploy redis
```

#### verifying the redis deployment
```yaml
containers:
      - image: redis
        imagePullPolicy: Always
        livenessProbe:
          exec:
            command:
            - redis-cli
            - ping
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        name: redis
        resources: {}
```

#### edit the deployment
```yaml
containers:
      - image: redis
        imagePullPolicy: Always
        livenessProbe:
          exec:
            command:
            - chanchito
            - asdfagdgh
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        name: redis
        resources: {}
```

#### 
```bash
kubectl describe pod $redis_pod

kuectl exec -it $redis_pod -- bash
```


---

## Optimizando el uso de nuestro cluster


### 24/33: Gestionar stacks con Helm  ( Check again this class and update the steps to install helm  and install charts)

#### Commandos from the class
```bash
// Instalar helm
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

// Verificar si tenemos helm instalado
helm

// Configurar helm
helm init

// Verificar si Tiller está instalado
kubectl get pods -n kube-system

// Dar permisos a helm
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

// Buscar paquetes
helm search

// Ejemplo de cómo instalar un paquete
helm search prometheus
helm inspect stable/prometheus | less
helm install stable/prometheus --set server.service.type=NodePort --set server.persistentVolume.enabled=false

// Obtener servicios
kubectl get svc

// Crear helm chart
helm create dockercoins
cd dockercoins
mv templates/ templates-old
mkdir templates
cd ..
kubectl get -o yaml --export deployment worker
```

#### script
```bash
while read kind name; do
kubectl get -o yaml --export $kind $name > dockercoins/templates/$name-$kind.yaml
done <<EOF
deployment worker
deployment hasher
daemonset rng
deployment webui
deployment redis
service hasher
service rng
service webui
service redis
EOF
```

####
- [Installing Helm](https://helm.sh/docs/intro/install/)
- [Quick Start with Helm](https://helm.sh/docs/intro/quickstart/)


####
```bash
minikube service list

helm create dockercoins
mv dockercoins/templates/  dockercoins/templates-old
```


### 25/33: Gestionando la configuracion aplicativas utilizando Config Maps

Tenemos diferentes formas de configurar nuestras aplicaciones:

- Argumentos por línea de comandos
- Variables de entorno (env map en el spec)
- Archivos de configuración (config maps)
  – Guardan tanto archivo como valores clave/valor


####
```bash
# 
cd curso-kubernetes

#
kubectl create configmap haproxy --from-file=haproxy.cfg

#
kubectl get configmap haproxy -o yaml | less

#
cat haproxy.yaml

# create the new pod
kubectl apply -f haproxy.yaml


kubectl get pod haproxy -o wide

#
curl http://$pod_ip

#
kubectl create configmap registry --from-literal=http.addr=0.0.0.0:80

cd curso-kubernetes

cat registry.yaml

kubectl apply -f registry.yaml

kubectl get pods -o wide  

curl http://$pod_ip:80/v2 


```



### 26/33: Volumenes

Un `volumen` nos va a permitir compartir archivos entre diferentes pods o en nuestro host. Estos se usan para que los archivos vivan a lo largo del tiempo y el pod pueda seguir haciendo uso de estos archivos de logs, archivos de configuración o cualquier otro.

`Docker`:
- Permiten compartir información entre contenedores del mismo host
- Permiten acceder a mecanismo de storage
- Docker config y docker secrets

`Kubernetes`:
- Permiten compartir información entre contenedores del mismo pod
- Permite acceder también a mecanismo de storage
- Se utilizan para el manejo de secrets y configuraciones

`Ciclo de Vida`
-El volumen se crea cuando el pod se crea.
  – Esto aplica principalmente para los volúmenes emptyDir.
  – Para otro tipo se conectan en vez de crearse.
- Un volumen se mantiene aún cuando se reinicie el contenedor.
- Un volumen se destruye cuando el pod se elimina.

####
```bash
cd curso-kubernetes
cat nginx-with-volume.yaml
kubectl apply -f nginx-with-volume.yaml

kubectl get pods
kubectl get pod nginx-with-volume
kubectl describe pod nginx-with-volume

kubectl get pods -o wide
curl http://$nginx_ip


```


---

## Autorizacion y Namespaces


### 27/33: Introduccion a namespaces (Check again)

- [kube-ps1: Kubernetes prompt for bash and zsh](https://github.com/jonmosco/kube-ps1)

```bash
kubectl create namespace blue

kubectl -n blue get svc

kubectl get svc

kubectl config get-contexts 

kubectl config set-context --current --namespace=blue

kubectl config get-contexts

```


### 28/33: Despliegue multiples instancias de las misma aplicacion en un solo cluster (Check again)

- Los namespaces no proveen aislación de recursos
- Un pod en un namespace A puede comunicarse con otro namespace B
- Un pod en el namespace default puede comunicarse con otro en el kube-system

```bash
helm install dockercoins

kubectl get svc
kubectl get namespace

kubectl config set-context --current --namespace=blue
kubectl get pods -o wide
helm install dockercoins

kubectl get pods
kubectl get svc

```



### 29/33: Autenticacion y autorizacion (Check again)

`Autenticación` es el método por el cual Kubernetes deja ingresar a un usuario.
`Autorización` es el mecanismo para que un usuario tenga una serie determinada de permisos para realizar ciertas acciones sobre el cluster.

- Cuando el API server recibe un request intenta autorizarlo con uno o más de uno de los siguientes métodos: Certificados TLS, Bearer Tokens, Basic Auth o Proxy de autenticación.
- Si cualquier método rechaza la solicitud, se devuelve un 401.
- Si el request no es aceptado o rechazado, el usuario es anónimo.
- Por defecto el usuario anónimo no puede hacer ninguna operación en el cluster.


```bash
kubectl get all -o wide --all-namespaces

kubectl get all -o wide -A

#
kubectl config view --raw -o json | jq -r .users[0].user[\"client-certificate-data\"]

#
kubectl config view --raw -o json | jq -r .users[0].user[\"client-certificate-data\"] | base64 -d

#
kubectl config view --raw -o json | jq -r .users[0].user[\"client-certificate-data\"] | base64 -d | openssl x509 =text

#
kubectl config view --raw -o json | jq -r .users[0].user[\"client-certificate-data\"] | base64 -d | openssl x509 =text | grep Subject

```


### 30/33: Service account tokens (Check again)

`Service Account Tokens` es un mecanismo de autenticación de kubernetes y vive dentro de la plataforma, nos permite dar permisos a diferentes tipos de usuarios.

- Existen en la API de kubernetes. kubectl get serviceaccount.
- Pueden crearse, eliminarse y actualizarse.
- Un service account está asociado a secretos kubectl get secrets.
- Son utilizados para otorgar permisos a aplicaciones y servicios.

```bash
kubectl get sa
kubectl get serviceaccounts

kubectl get sa default -o yaml

kubectl get sa default -o json | jq -r .secrets[0].name

kubectl get secret $defaul_token_name -o yaml

token=$( kubectl get secret $defaul_token_name -o json | jq -r .data.token | base64 -d )

kubectl get pods -n default

kuectl get svc -n default

curl -k https://$K8S_SERVICE_IP

curl -k https://$K8S_SERVICE_IP -H "Authorization: Bearer $token"

```


### 31/33: RBAC (Check again)


`Role based access control(RBAC)` es un mecanismo de kubernetes para gestionar roles y la asociación de estos a los usuarios para delimitar las acciones que pueden realizar dentro de la plataforma.

- Un rol es un objeto que contiene una lista de rules
- Un rolebiding asocia un rol a un usuario
- Pueden existir usuarios, roles y rolebidings con el mismo nombre
- Una buena práctica es tener un 1-1-1 bidings
- Los Cluster-scope permissions permiten definir permisos a nivel de cluster y no solo namespace
- Un pod puede estar asociado a un service-accoun

```bash
kubectl create sa viewer

kubectl get sa

kubectl create rolebingding viewercanvirew --clusterrole=view --serviceaccount=default:viewer

kubectl run eyepod --rm -it --restart=Never --serviceaccount=viewer --image=alpine
```

#### inside the pod
```bash
curl https://storage.googleapis.com/kubernetes-release/release/stable.txt

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl

chmod -x ./kubectl

kubectl get all 

./kubectl create deployment testrab --image nginx

./kubectl auth can-i list nodes

./kubectl auth can-i create pods

./kubectl auth can-i  get pods

./kubectl auth can-i  list nodes --as kube-admin

exit

```

```bash
kubectl get clusterrolebindings -o yaml | grep -e kkuberenetes-admin -e system:masters

kubectl describe clusterrolebing cluster-admin
```

### create the pod with a YAML file
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: eyedpod
  labels:
    purpose: demonstrate-serviceaccount-demo
spec:
  serviceAccountName: viewer
  containers:
  - name: serviceaccount-demo
    image: alpine:3.9
    command: ["sleep", "10000"]
  restartPolicy: OnFailure
```

---

## Fin del curso


### 32/33: Recomendaciones para implementar Kubernetes en tu organizacion o proyectos

**Próximos pasos**

- `Establece una cultura de containers en la organización`
  – Escribir Dockerfiles para una aplicación
  – Escribir compose files para describir servicios
  – Mostrar las ventajas de correr aplicaciones en contenedores
  – Configurar builds automáticos de imágenes
  – Automatizar el CI/CD (staging) pipeline

- `Developer Experience`: Si tienes una persona nueva, debe sentirse acompañada en este proceso de por qué usamos kubernetes y quieres mantener la armonía de ese proceso.

- `Elección de un cluster de producción`: Hay alternativas como Cloud, Managed o Self-managed, también puedes usar un cluster grande o múltiples pequeños.

- `Recordar el uso de namespaces`: Puedes desplegar varias versiones de tu aplicación en diferentes namespaces.

- `Servicios con estados (stateful)`
  – Intenta evitarlos al principio
  – Técnicas para exponerlos a los pods (ExternalName, ClusterIP, Ambassador)
  – Storage provider, Persistent volumens, Stateful set

- `Gestión del tráfico Http`
  – Ingress controllers (virtual host routing)

- `Configuración de la aplicación`
  – Secretos y config maps

- `Stacks deployments`
  – GitOps (infraestructure as code)
  – Heml, Spinnaker o Brigade




---

## Bonus

### 33/ 33: Clase en vivo: workflows de Kubernetes usando git


`GitOps` es una práctica que gestiona toda la configuración de nuestra infraestructura y nuestras aplicaciones en producción a través de Git. Git es la fuente de verdad. Esto implica que todo proceso de infraestructura conlleva code reviews, comentarios en los archivos de configuración y enlaces a issues y PR.

- Infraestructura como código
- Mecanismo de convergencia
- Uso de CI como fuente de verdad
- Pull vs Push
- Developers y operaciones(git)
- Actualizaciones atómicas

`GitOps` tomo tanta popularidad en la comunidad de DevOps por el impacto que genera.

- Poder desplegar features nuevos rápidos
- Reducir el tiempo para arreglar bugs
- Generar el sentimiento de control y empoderamiento. Confidencia y control
- 20 deploys por día
- 80% en ahorro del tiempo para arreglar errores en producción

- [Flux v1](https://github.com/fluxcd/flux)

```bash
kubectl get nodes

kubectl get pods

git clone git@github.com:weaveworks/flux.git

cat flux/deploy/flux-deployment.yaml

kubectl apply -f deploy/

kubectl get pods

kubectl logs deploy flux

# copy the ssh key 

```




---

## References

- [Curso de Kubernetes](https://platzi.com/cursos/k8s/)
- [Slides del curso](https://static.platzi.com/media/public/uploads/platzi-curso-k8s_d86c22d7-2f5f-4e41-b0f2-f9360e15a173.pdf)
- [GitHub Project](https://github.com/platzi/curso-kubernetes)
-[DOcker Image](https://hub.docker.com/u/dockercoins)

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

- [Accessing apps](https://minikube.sigs.k8s.io/docs/handbook/accessing/)
- [GitHub Helm](https://github.com/helm/helm)
- [Helm. The package manager for Kubernetes](https://helm.sh/)
- [Installing Helm](https://helm.sh/docs/intro/install/)
- [Prometheus](https://prometheus.io/)
- [ArtifactHub: Prometheus](https://artifacthub.io/packages/helm/prometheus-community/prometheus)
- [Helm 3.0.0 has been released!](https://helm.sh/blog/helm-3-released/)
- [Setup Prometheus and Grafana monitoring on Kubernetes cluster using Helm](https://medium.com/globant/setup-prometheus-and-grafana-monitoring-on-kubernetes-cluster-using-helm-3484efd85891)
- [kube-ps1: Kubernetes prompt for bash and zsh](https://github.com/jonmosco/kube-ps1)
- [Flux v1](https://github.com/fluxcd/flux)

## Solving Problems


- [Cannot copy or paste commands in labs.play-with-kubernetes free intance](https://stackoverflow.com/questions/69718912/cannot-copy-or-paste-commands-in-labs-play-with-kubernetes-free-intance)
- [Kubectl Export is deprecated . Any alternative](https://stackoverflow.com/questions/61392206/kubectl-export-is-deprecated-any-alternative)

- []()