# oc commands


## First hour.. Sander samples
```bash

oc whoami

oc get all

# You first create a project
oc new-project <PROYECT_NAME>

# You can add applications to this project with the new-app command
oc new-app rails-postgresql-example

# Use kubectl to deploy a simple K8s application
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.43 -- /agnhost serve-hostname

#
oc run testpod --image=nginx:1.23
kubectl get pods

#
oc run testpod --image=bitnami/nginx:1.23
oc get pods
oc delete pod testpod

#
oc run testpod --image=bitnami/nginx:1.23
oc get pods

# TODO: Fix this
#oc run sleepytest --image=busybox:1.36

#
oc get projects

#
oc get ns

```

## Second Hour
```bash
# 
oc get pods

#
oc get pods testpod -o yaml | less

#
oc api-resources
oc api-resources | wc -l

#
oc api-resource | less

#
oc api-resources | grep deploy


#
oc new-app --help | less
oc new-app --list | less
oc new-app mysql MYSQL_USER=user MYSQL_PASSWORD=pass MYSQL_DATABASE=testdb -l db=mysql

# 
oc get all
oc get all -A

#
oc get deployment

#
oc get deploymentconfig

## Section 7
#
oc get all

#
oc get pods

#
oc get pods -A

#
oc get pods mypod -o yaml

#
oc describe pods mypod

#
oc logs mypod

# 
source <(oc completion bash)

#
oc run somedb --image=mariadb
oc describe pod somedb
oc describe pod somedb | less
oc logs somedb
oc delete pod somedb

#
oc get deploymentconfig
oc delete deploymentconfig rails-postgresql-example


```


## 3th hour
```bash

# create a new app
oc new-app -h | less

#
oc new-app --name thenewapp --image=bitnami/nginx --dry-run -o yaml

oc new-app --name thenewapp --image=bitnami/nginx --dry-run -o yaml > thenewapp.yaml


# If you have administrative grants, you can create a new project
oc new-project newapp

# create new app with a yaml file
oc apply -f thenewapp.yaml

#
oc explain deploy.spec

#
oc create deploy theweb --image=bitnami/nginx

#
oc scale deploy theweb --replicas=3

#
oc get pods -o wide

# packet -> route -> service -> pod

#
oc get all

# a route is a load balancer

#
oc create -h | less

#
oc set -h | less

#
oc expose -h | less

#
oc expose service/thenewapp

#
oc get routes
curl thenewapp-rmontesleo-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com

#
oc new-app --as-deployment-config bitnami/nginx --name bitginx

#
oc describe svc bitginx

#
oc expose svc bitginx 

#
oc describe route bitginx

#
oc run -it ubix --image=ubi8 -- bash

#
oc run testusy --image=busybox -- cat /etc/resolv.conf

#
oc run testusy2 -it --image=busybox -- cat /etc/resolv.conf


```

## 4th hour
```bash



```

