# Kind

## Basic usage


### This operation create a cluste of one node
```bash
kind create cluster
```


### Lets define a cluster of 4 nodes one master and 3 workers
```bash
vim kind-multi-node.yaml
```

### Manifest content of the kind-multi-node.yaml
```yaml
### Four node (three workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
- role: worker
```

### Create the cluster using the manifest
```bash
kind create cluster  --config manifest/kind-multi-node.yaml
```

### In newer versions you can use your cluster with
```bash
kubectl cluster-info --context kind-kind
```

### In previous versions you must set the KUBECONFIG environment variable
```bash
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
```


### Get information about your nodes
```bash
kubectl get nodes -o wide
```

### Delete your cluster
```bash
kind delete cluster
```


## References


- [How to Download a File on Ubuntu Linux using the Command Line](https://vitux.com/how-to-download-a-file-on-ubuntu-linux-using-the-command-line/)

- [Go](https://go.dev/)

- [Download and install](https://go.dev/doc/install)

- [kind](https://kind.sigs.k8s.io/)

- [Installing From Release Binaries 🔗︎](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

- [Kubernetes with kind](https://www.baeldung.com/ops/kubernetes-kind)
