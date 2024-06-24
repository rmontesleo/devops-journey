# Kubernetes


This notes were taken and based from  [KUBERNETES De NOVATO a PRO! (CURSO COMPLETO EN ESPAÑOL)](https://www.youtube.com/watch?v=DCoBcpOA7W4&t=1s).

This notes are for sharing and keep learning.


---

## Step 1: Create your K8s Cluster on Digital Ocean


### Step 2: Check the current kubectl configuration
```bash
kubectl config view
```

### Step3: Check version of kubectl
```bash
kubectl version --client=true
```


### Step 4:  Read the kubeconfig to point to some cloud
```bash
export KUBECONFIG=<FULL_PATH_WITH_THE_CONFIGURATION_FILE>
```

### Step 5:  After that, with get nodes you will see the nodes of your cloud.
```bash
kubectl get nodes
```

### Step 6: Get resources and help

```bash
kubectl --help |less
```

```bash
kubectl get --help | less
```

#### Step :  Edit resources on the server
```bash
kubectl edit --help
```

#### Step :  Delete resources on the server
```bash
kubectl delete --help
```

#### Step :  Apply a manifest on kubernetes
```bash
kubectl apply --help
```

#### Step :  exec , execute command on the pod
```bash
kubectl exec --help
```

#### Step :  Show the logs of the pod
```bash
kubectl logs --help
```

#### Step :  copy files from local directory to the container
```bash
kubectl cp --help
```

```bash
kubectl port-forward --help
```

```bash
kubectl drain --help
```

```bash
kubectl cordon --help
```

```bash
kubectl uncordon --help
```

### Step : Get info about the context of your kubeconfig files
```bash
kubectl config get-contexts
```

### Step :  Check tools for kubernetes 
- [lens :Graphic interface for kubectl](https://k8slens.dev/)
- [Kubecolor](https://github.com/hidetatz/kubecolor)



### Step : Namespace: Logic partitions of your cluster. Split your loads.


### Step 10: check all your namespace. The ones that start with kube-* are reserved for kubernetes
```bash
kubectl get ns
```

### Step : See the pods that run on namespace kube-system
```bash
kubectl -n kube-system get pods
```


### Step : Get more information about the pods that run in your system
```bash
kubectl -n kube-system get pods -o wide
```

### Step 13: Delete some pod
```bash
kubectl -n kube-system delete pod <POD_ID>
```

### Step : Check again what happend with the nodes
```bash
kubectl -n kube-system get pods -o wide
```


### Step : Apply some manifest
```bash
kubectl apply -f <FULL_PATH>/<FILE_NAME>.yaml
```



### Step : Check your pods
```bash
kubectl get pods
```

### Step : Go inside the pod and execute sh
```bash
kubectl exec -it <POD_ID> -- sh
```

### Step : For the previous sample the pod name is nginx
```bash
kubectl exec -it nginx -- sh
```

### Step : inside the pod the prompt is
```bash
/ #
```


### Step : inside the pod type env
```bash
/ # env
```



### Step : Delete the pod
```bash
kubectl delete pod <POD_ID>
```

### Step : Delete the pod ngixn
```bash
kubectl delete pod ngixn
```

### Step : Check the other pod manyfest

vim manifest/02-pod.yaml


kubectl apply -f manifest/02-pod.yaml


kubectl exec -it nginx -- sh

```bash
env

echo $PRASE

echo $MY_VARIABLE
```



### Step : Get the description of the pod and display in yaml format
```bash
kubectl get pod <POD_ID> -o yaml

kubectl get pod nginx -o yaml
```

### Step  Delete again the pod ngixn
```bash
kubectl delete pod ngixn
```

```bash
kubectl delete -f manifest/02-pod.yaml
```


vim manifest/03-deployment.yaml

### Apply the deployment
```bash
kubectl apply -f manifest/03-deployment.yaml
```

### delete some pod of the deployment
```bash
kubectl delete pod nginx-deployment-<REPLICASET_ID>-<POD_ID> 

kubectl delete pod nginx-deployment-66c9c7669-kbv6d
```

### Step : check again the pods
```bash
kubectl get pods
```

## Step : create the daemonset in each node of the deployment. this is useful to monitor each node
```bash
kubectl apply -f manifest/04-daemonset.yaml
```


### Step : To delete a deployment use the deployment ID or the manifest file
```bash
kubectl delete deployment <DEPLOYMENT_ID>

kubectl delete -f <DEPLOYMENT_FILE>.yaml
```

### step : Create a steatefull set
```bash
kubectl apply -f manifest/05-statefulset.yaml
```

### Step : Describe the pod, see the states and events in the pod
```bash
kubectl describe pod <POD_ID>
```

### Step 21: For PVC (persistent volume claim, the pvc is the request of a virtual distk to the cloud provider), we can check information about the created volume in the cloud provider. Get information of all pvc
```bash
kubectl get pvc
```

```bash
kubectl get pvc <PVC_NAME>
```

```bash
kubectl describe pvc <PVC_NAME>
```




### Describe the pvc events
```bash
kubectl describe pvc <PVC_ID>
```

### Get the stateful sets
```bash
kubectl get statefulsets

kubectl gt sts
```

### Delete stateful set
```bash
kubectl delete sts <STATEFULSET_ID>
```


### GET THE PVC
```bash
kubectl get pvc
```


### Delete the pvc and check in digital ocean in the volume section the pvc has been deleted
```bash
kubectl delete pvc <PVC_NAME>
```

---

### Networking

TODO: Study the kubernetes networking

---

### Services

- `Cluster IP`: static ip inside the cluster. Works like a load balancer between the pods assigned in a service
- `Node Port`: open a port in a node to send the trafic to selected pods 
- `Load Balancer`: related with the cloud providers. Create a load balancer in the cloud provider and redirect the trafic to the pods.

---

## Sample Cluster IP service

###
### TODO: Verify what happend with this manifest and the ubuntu creation
```bash
kubectl apply -f  manifest/06-randompod.yaml
```


###
```bash
kubectl apply -f manifest/07-hello-deployment-svc-clusterIP.yaml
```

###
```
kubectl get all -o wide
```

### show the ips, the endpoints of these pods
```bash
kubectl describe svc hello
```

###
```bash
kubectl get pods -o wide
```

### go to the ubuntu pod
```bash
kubkectl exec -it ubuntu -- bash
```

### inside the container
```bash
# ping to service hello
ping hello

# execute curl to hello
curl http://hello:8080
```

### delete the previous deployment and service
```bash
kubectl delete -f manifest/07-hello-deployment-svc-clusterIP.yaml 
```


---

## NodePort Serive

###
```bash
kubectl apply -f manifest/08-hello-deployment-svc-nodePort.yaml
```

```bash
kubectl get all -o wide
```

```bash
kubectl get node -o wide
```

### send a curl from your machine point to the port 3000

```bash

curl http://<NODE_01_IP>:30000
curl http://<NODE_02_IP>:30000
curl http://<NODE_03_IP>:30000
```

### clean this deployment
```bash
kubectl delete -f manifest/08-hello-deployment-svc-nodePort.yaml
```

---

## Load balancer service

```bash
kubectl apply -f manifest/09-hello-deployment-svc-loadBalancer.yaml 
```

```bash
kubectl get pods -o wide
```

### the LoadBalancer service get an public IP of Digital Ocean to access the Load Blancer
```bash
kubectl get svc -o wide
```

```bash
kubectl describe svc hello
```

### check then in Digital ocean , networking, load balancer to find the load balancer created by kubernetes

###
```bash
curl http://<LOAD_BALANCER_EXTERNAL_IP>:8080
```
---

# TODO:  Check againt the configuration of ingress
## Ingres


### Go to digital ocean, your k8s cluster, market place, find and install nginx ingress controller

### after installation create a new namespace call ingress-nginx
```bash
kubectl get ns
```

### the ingress autoconfigure the resources type ingress
```bash
kubectl -n ingress-nginx get pods
```


###
```bash
kubectl apply -f manifest/10-hello-v1-v2-deployment-svc.yaml
```

```bash
kubectl apply -f manifest/11-hello-ingress.yaml       
```

### ask by ingress resources in the default namespace

```bash
kubectl get ing
```

### get the services of the namespace ingress-nginx
```bash
kubectl -n ingress-nginx get svc
```

###
```bash
curl http://<INGRESS-NGINX-CONTROLLER-EXTERNAL-IP>/v1

curl http://<INGRESS-NGINX-CONTROLLER-EXTERNAL-IP>/v2
```


---

## Config Map


## TODO: Fix the sample

```
kubectl apply -f manifest/12-configmap.yaml 

kubectl apply -f manifest/13-pod-configmap.yaml
```

kubectl get pods

kubectl exec -it nginx -- sh

### your prompt will change to 
```bash
/#
```

### see the environment variables
```bash
env
```

### se the volume mount config on /config
```bash
ls /config
```

### see the content of the two properties files mounted
```bash
cat /config/game.properties
cat /config/user-interface.properties
```

---

## Secrets

kubectl apply -f manifest/14-secrets.yaml

kubectl apply -f manifest/15-pod-secret.yaml

kubectl exec -it ngixn -- sh

env


---

## References

- [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

- [Pelado Nerd, Kubernees ](https://www.youtube.com/watch?v=oTf0KxK1QNo&list=PLqRCtm0kbeHA5M_E_Anwu-vh4NWlgrOY_&index=1)

- [¿QUE ES KUBERNETES? - Introducción al orquestador más usado](https://www.youtube.com/watch?v=oTf0KxK1QNo)

- [KUBERNETES 2021 - De NOVATO a PRO! (CURSO COMPLETO)](https://www.youtube.com/watch?v=DCoBcpOA7W4)

- [GitHub Pelado Nerd Kubernetes  2021](https://github.com/pablokbs/peladonerd/tree/master/kubernetes/35)



