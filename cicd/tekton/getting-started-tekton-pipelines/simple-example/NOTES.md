

```bash
#------------------------------------------------------------------------
# list your pipelines
tkn p ls

# describe the pipeline
tkn pipeline describe sum-three-pipeline
tkn p describe sum-three-pipeline

# show logs of the pipeline
tkn pipeline logs  sum-three-pipeline
tkn p logs sum-three-pipeline

#----------------------------------------------------------------

# list your pipeline run
tkn pr ls

# get the logs oy sum-three-pipeline-run
tkn pr logs sum-three-pipeline-run 

# describe the pipeline run
tkn pr describe sum-three-pipeline-run

#--------------------------------------------------------------------------------
# install tekton dashboard
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml

# go to tekton dashboard
kubectl proxy
go to http://localhost:8001/api/v1/namespaces/tekton-pipelines/services/tekton-dashboard:http/proxy/


#-----------------------------------------------------------------------------------------
# list your tasks
tkn tasks list
tkn t ls

# describe some task
tkn tasks describe $TASK_NAME
tkn t describe $TASK_NAME


```


## Resources
- [Installing Tekton Dashboard](https://github.com/tektoncd/dashboard/blob/main/docs/install.md)