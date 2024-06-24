# Paste Bin

## Commands
```bash
  514  crc start
  515  wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.30.0/crc-macos-installer.pkg
  516  crc delete crc-macos-installer.pkg*
  517  rm  crc-macos-installer.pkg*
  518  wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/2.30.0/crc-macos-installer.pkg
  519  crc setup
  520  crc start -p pull-secret.txt -m 12244
  521  eval $(crc oc-env)
  522  oc login -u developer https://api.crc.testing:6443
  523  oc login -u kubeadmin -p woRQa-hBL7p-EnqQN-WrQ4v
  524  crc stop
  525  crc start
  526  oc login -u kubeadmin -p woRQa-hBL7p-EnqQN-WrQ4v
  527  oc login -u developer https://api.crc.testing:6443
  528  oc new-project myproject
  529  oc run testpod --image=nginx:1.23
  530  kubectl get pods
  531  kubectl get pods
  532  kubectl get pods
  533  oc run testpod --image=bitnami/nginx:1.23
  534  oc delete pod testpod
  535  oc run testpod --image=bitnami/nginx:1.23
  536  oc get pods
  537  oc get pods
  538  oc get pods
  539  oc run sleepytest --image=bitnami/busybox:1.27
  540  oc whoami
  541  oc get projects
  542  oc get ns
  543  oc login -u kubeadmin -p woRQa-hBL7p-EnqQN-WrQ4v
  544  oc get projects
  545  oc get ns
  546  oc login -u developer https://api.crc.testing:6443
  547  cd ../Documents/books\ and\ vids/
  548  ls
  549  cd github/
  550  cp -R openshift openshift.demo
  551  ls -l opens*
  552  cd openshift.demo/
  553  ls
  554  cp ../luth/countdown .
  555  ./countdown 12
  556  oc get pods
  557  oc get pods testpod -o yaml | less
  558  oc api-resources | wc -l
  559  oc api-resources | less
  560  oc api-resources | grep eploy
  561  oc new-project anotherone
  562  oc new-app rails-postgresql-example
  563  oc get all
  564  oc get pods
  565  oc get deploy
  566  oc get deploymentconfig
  567  oc get all
  568  oc get all
  569  oc -h | less
  570  oc new-app -h
  571  oc new-app -h | less
  572  history
  573  oc run somedb --image=mariadb
  574  kubectl get all
  575  source <(oc completion bash)
  576  oc describe pod pod/rails-postgresql-example-1-hook-pre
  577  oc describe pod/rails-postgresql-example-1-hook-pre
  578  oc get all
  579  oc describe pod/somedb
  580  oc logs pod/somedb
  581  oc get all
  582  oc delete pod somedb
  583  oc -h | less
  584  oc new-app -h | less
  585  oc get all
  586  oc delete deploymentconfig rails-postgresql-example
  587  oc delete deploymentconfig postgresql-1
  588  oc get all
  589  oc delete deploymentconfig postgresql
  590  source <(oc completion bash)
  591  oc completion -h | less
  592  oc completion bash > $(brew --prefix)/etc/bash_completion.d/oc
  593  history
  594  ./countdown 12
  595  oc new-app -h | less
  596  oc new-app thenewapp --image=bitnami/nginx
  597  oc new-app thenewapp --image=bitnami/nginx --dry-run=client -o yaml
  598  oc new-app thenewapp --image=bitnami/nginx --dry-run -o yaml
  599  oc new-app --name thenewapp --image=bitnami/nginx --dry-run -o yaml
  600  oc new-app --name thenewapp --image=bitnami/nginx --dry-run -o yaml > thenewapp.yaml
  601  vim thenewapp.yaml 
  602  oc get all
  603  oc new-project newapp
  604  oc apply -f thenewapp.yaml 
  605  oc apply -f thenewapp.yaml 
  606  vim thenewapp.yaml 
  607  oc explain deploy.spec
  608  oc create deploy theweb --image=bitnami/nginx
  609  oc get all
  610  oc scale deploy theweb --replicas=3
  611  oc get pods -o wide
  612  # packet -> route -> service -> pod
  613  oc get all
  614  oc create -h | less
  615  oc set -h | less
  616  oc expose -h | less
  617  oc get all
  618  oc expose service/thenewapp
  619  oc get routes
  620  curl thenewapp-newapp.apps-crc.testing
  621  history
  622  oc new-project myroute
  623  oc new-app --as-deployment-config quay.io/bitnami/nginx --name bitginx 
  624  oc new-app --as-deployment-config bitnami/nginx --name bitginx 
  625  oc get all
  626  oc describe svc bitginx
  627  oc expose svc bitginx
  628  oc describe route bitginx
  629  oc run -it ubix --image=ubi8 -- bash
  630  oc run testusy --image=busybox -- cat /etc/resolv.conf
  631  oc run testusyy -it --image=busybox -- cat /etc/resolv.conf
  632  oc get pods
  633  oc describe pod ubix
  634  crc start -h | less
  635  crc stop
  636  crc delete
  637  cd ~/Downloads/
  638  crc start -p pull-secret.txt -m 12244 -d 64
  639  eval $(crc oc-env)
  640  oc login -u kubeadmin -p 3NP4M-IK89s-Df7bb-sr7B6
  641  oc login -u developer https://api.crc.testing:6443
  642  oc login -u developer https://api.crc.testing:6443
  643  oc new-project hello
  644  oc new-app php~https://github.com/sandervanvugt/simpleapp --name=simple
  645  oc get all
  646  oc get all
  647  oc get all
  648  oc get all
  649  oc get all
  650  oc expose svc simple
  651  oc get route
  652  curl simple-hello.apps-crc.testing
  653  oc start-build simple
  654  oc get all
  655  oc get all
  656  curl simple-hello.apps-crc.testing
  657  history
```
