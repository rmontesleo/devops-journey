

### Step 1
```bash
{ clear && \
  echo -e "\n=== Kubernetes Status ===\n" && \
  kubectl get --raw '/healthz?verbose' && \
  kubectl version --short && \
  kubectl get nodes && \
  kubectl cluster-info; 
} | grep -z 'Ready\| ok\|passed\|running'


helm version --short
```


token
```bash

```

### step 2
```bash

helm repo add twuni https://helm.twun.io && helm repo list


helm install registry twuni/docker-registry \
--version 2.1.0 \
--namespace kube-system \
--set service.type=NodePort \
--set service.nodePort=31500


kubectl get service --namespace kube-system

export REGISTRY=2886752261-31500-host11nc.environments.katacoda.com

kubectl get deployments registry-docker-registry --namespace kube-system

curl $REGISTRY/v2/_catalog | jq -c


helm repo add incubator https://charts.helm.sh/incubator && helm repo list


helm install registry-proxy incubator/kube-registry-proxy \
  --version 0.3.4 \
  --namespace kube-system \
  --set registry.host=registry-docker-registry.kube-system \
  --set registry.port=5000 \
  --set hostPort=5000


kubectl apply -f ~/registry-ui.yaml



```


### step 3
```bash
git clone https://github.com/javajon/node-js-tekton

cd node-js-tekton

tree

less src/app.js | tee

less src/Dockerfile | tee

less src/deploy.yaml | tee


```

### step 4
```bash
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.34.1/release.yaml

watch kubectl get deployments,pods,services --namespace tekton-pipelines

clear

# New Custom Resources Definitions
kubectl get crds


kubectl get pipelineruns,pipelines,taskruns,tasks,pipelineresources

```

### step 5
```bash
kubectl apply -f ~/tekton-dashboard-release.yaml
```

### step 6
```bash
VERSION=0.23.1

curl -LO https://github.com/tektoncd/cli/releases/download/v${VERSION}/tkn_${VERSION}_Linux_x86_64.tar.gz

tar xvzf tkn_${VERSION}_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn

 tkn version

source <(tkn completion bash)

kubectl get pipelineresources

tkn resources list

tkn resources --help

```

### step 7
```bash

less pipeline/git-resource.yaml | tee

kubectl apply -f pipeline/git-resource.yaml

tkn resources list

```


### step 8
```bash
less pipeline/task-build-src.yaml | tee

less pipeline/task-deploy.yaml | tee

kubectl apply -f pipeline/task-build-src.yaml

kubectl apply -f pipeline/task-deploy.yaml

tkn tasks list

```

### step 9
```bash
less pipeline/pipeline.yaml | tee

kubectl apply -f pipeline/pipeline.yaml

tkn pipelines list

```

### step 10
```bash
kubectl apply -f pipeline/service-account.yaml

kubectl get ServiceAccounts
```

### step 11
```bash

less pipeline/pipeline-run.yaml | tee

kubectl apply -f pipeline/pipeline-run.yaml

tkn pipelineruns list

tkn pipelineruns describe application-pipeline-run



```

### step 12
```bash
kubectl get deployments,pods,services


```
- [Kubernetes Pipelines: Tekton Pipelines](https://learning.oreilly.com/scenarios/kubernetes-pipelines-tekton/9781492083900/)
- [Directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph)
- [tektoncd/cli](https://github.com/tektoncd/cli)
- [docker-registry](https://artifacthub.io/packages/helm/twuni/docker-registry)
- [Helm Chart](https://github.com/helm/charts/blob/master/incubator/kube-registry-proxy/README.md)
- [](https://kubernetes.io/docs/home/)