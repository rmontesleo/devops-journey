# Azure DevOps from Zero to Hero


## Azure Boards

---

## Azure Repos

---

## Azure Pipelines

###
```bash
# Inside your repository create a file call azure-pipelines.yml
```

### azure-pipelines.yml  (Work this version with azure, azure defender and see how to fix images vulnerabilities)
```yaml
trigger:
- main

pool:
	vmImage: 'ubuntu-latest'


stages:
- stage: BuildApp
	jobs:
	- job: BuildPushImage
	  steps:
	  - task: Docker@2
	    inputs:
	   	  containerRegistry: 'ACR Demo'
	   	  repository: 'adodemo.azurecr.io'
	   	  command: 'buildAndPush'
	   	  Dockerfile: '**/Dockerfile'
	   	  tags: '$(Build.BuildId)'

- stage: ScanImage
  jobs:
  - job: ScanImage
    steps:
    - task: AzureCLI@2
      inputs:
      	azureSubscription: 'Azure'
      	scriptType: 'pscore'
      	scriptLocation: 'scriptPath'
      	scriptPath: '$(Build.SourceDirectory)/scripts/ImageScanSummaryAssesmentGate.ps1'
      	arguments: '-registryName ADODemo -repository adodemo.azurecr.io -tag $(Build.BuildId)'  

```

### azure-pipelines.yml  (Quick pipeline, Version 1)
```yaml
trigger:
- main

pool:
	vmImage: 'ubuntu-latest'

stages:

- stage: BuildApp
	jobs:
	- job: BuildPushImage
	  steps:
	  - task: Docker@2
	    inputs:
	   	  containerRegistry: 'ACR Demo'
	   	  repository: 'adodemo.azurecr.io'
	   	  command: 'buildAndPush'
	   	  Dockerfile: '**/Dockerfile'
	   	  tags: '$(Build.BuildId)'

- stage: DeployDev
  jobs:
  - job: DeployDev
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-Dev'
      	DockerNamespace: 'ACR Demo'
      	DockerRepository: 'adodemo.azurecr.io'
      	DockerImageTag: '$(Build.BuildId)'

```

### azure-pipelines.yml  (Quick pipeline, Version 2)
```yaml
trigger:
- main

pool:
	vmImage: 'ubuntu-latest'

variables:
  IMAGE_REGISTRY_CONNECTON: 'ACR Demo'
  IMAGE_REGISTRY: 'ADODemo'
  IMAGE_REPOSITORY: 'adodemo.azurecr.io'
  TAG: '$(Build.BuildId)' 	

stages:

- stage: BuildApp
	jobs:
	- job: BuildPushImage
	  steps:
	  - task: Docker@2
	    inputs:
	   	  containerRegistry: '$(IMAGE_REGISTRY_CONNECTON)'
	   	  repository: '$(IMAGE_REPOSITORY)'
	   	  command: 'buildAndPush'
	   	  Dockerfile: '**/Dockerfile'
	   	  tags: '$(TAG)'

- stage: DeployDev
  jobs:
  - job: DeployDev
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-dev'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

- stage: DeployTest
  jobs:
  - job: DeployTest
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-test'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'


```

### azure-pipelines.yml  (Quick pipeline, Version 3)
```yaml
trigger:
- main

pool:
	vmImage: 'ubuntu-latest'

variables:
  IMAGE_REGISTRY_CONNECTON: 'ACR Demo'
  IMAGE_REGISTRY: 'ADODemo'
  IMAGE_REPOSITORY: 'adodemo.azurecr.io'
  TAG: '$(Build.BuildId)' 
  PUBLIC_IP_EC2_INSTANCE: '<SET_THE_PUBLIC_IP>'	

stages:

- stage: BuildApp
	jobs:
	- job: BuildPushImage
	  steps:
	  - task: Docker@2
	    inputs:
	   	  containerRegistry: '$(IMAGE_REGISTRY_CONNECTON)'
	   	  repository: '$(IMAGE_REPOSITORY)'
	   	  command: 'buildAndPush'
	   	  Dockerfile: '**/Dockerfile'
	   	  tags: '$(TAG)'

- stage: DeployDev
  jobs:
  - job: DeployDev
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-dev'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

- stage: DeployTest  
  jobs:
  - job: DeployTest
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-test'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

- stage: DeployProdAzure
  jobs:
  
  - job: ApproveRelease
    timeoutInMinutes: 420 # job times out in 3 days, Timeout can be define in job level
    pool: server # this job is executed in a linux server
    steps:
    - task: ManualValidation@0
      timeoutInMinutes: 1440 # task times out in 1 day. Timeout can be define in task level
      inputs:
      	notifyUsers: 'someuser@someemail.com'
      	instructions: 'Please validate and approve deployment to Production'

  	
  - job: DeployProd
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-prod'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

- stage: DeployProdAWS
  jobs:
  
  - job: ApproveRelease
    timeoutInMinutes: 420 # job times out in 3 days, Timeout can be define in job level
    pool: server # this job is executed in a linux server
    steps:
    - task: ManualValidation@0
      timeoutInMinutes: 1440 # task times out in 1 day. Timeout can be define in task level
      inputs:
      	notifyUsers: 'someuser@someemail.com'
      	instructions: 'Please validate and approve deployment to Production'

  	
  - job: DeployProd
    steps:
	- task: DownloadSecureFile@1
	  name: sshKey
	  inputs:
	  	secureFile: 'adodemo-key.pem'

	- script: |
	   sudo chmod 400 $(sshKey.secureFilePath)
	   ssh -o StrictHostKeyChecking=no -i $(sshKey.secureFilePath) ubuntu@$(PUBLIC_IP_EC2_INSTANCE) "
	     docker ps -aq | xargs docker stop | xargs docker rm && 
		 docker run -d -p 8080:80 $(IMAGE_REGISTRY)/$(IMAGE_REPOSITORY):$(TAG) "


```

### azure-pipelines.yml  (Quick pipeline, Version 4)
```yaml
trigger:
- main

pool:
	vmImage: 'ubuntu-latest'

variables:
  IMAGE_REGISTRY_CONNECTON: 'ACR Demo'
  IMAGE_REGISTRY: 'ADODemo'
  IMAGE_REPOSITORY: 'adodemo.azurecr.io'
  TAG: '$(Build.BuildId)' 	

stages:

- stage: BuildApp
	jobs:
	- job: BuildPushImage
	  steps:
	  - task: Docker@2
	    inputs:
	   	  containerRegistry: '$(IMAGE_REGISTRY_CONNECTON)'
	   	  repository: '$(IMAGE_REPOSITORY)'
	   	  command: 'buildAndPush'
	   	  Dockerfile: '**/Dockerfile'
	   	  tags: '$(TAG)'

- stage: DeployDev
  jobs:
  - job: DeployDev
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-dev'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

- stage: DeployTest
  condition: and( succeeded(), eq( variables['Build.Reason'], 'Schedule' )) 
  jobs:
  - job: DeployTest
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-test'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

- stage: DeployProd
  jobs:
  
  - job: ApproveRelease
    timeoutInMinutes: 420 # job times out in 3 days, Timeout can be define in job level
    pool: server # this job is executed in a linux server
    steps:
    - task: ManualValidation@0
      timeoutInMinutes: 1440 # task times out in 1 day. Timeout can be define in task level
      inputs:
      	notifyUsers: 'someuser@someemail.com'
      	instructions: 'Please validate and approve deployment to Production'

  	
  - job: DeployProd
    steps:
    - task: AzureRmWebAppDeployment@4
      inputs:
      	ConnectionType: 'AzureRM'
      	azureSubscription: 'Azure'
      	appType: 'webAppContainer'
      	WebAppName: 'ADODemo-prod'
      	DockerNamespace: '$(IMAGE_REGISTRY)'
      	DockerRepository: '$(IMAGE_REPOSITORY)'
      	DockerImageTag: '$(TAG)'

```



---


## Azure Artifacts

---

## Azure Test Plans


---

## Resources

- [Azure DevOps: Zero to Hero Tutorial](https://www.youtube.com/watch?v=DoWhZO7nbCY)

- [Tech world with Nana and Azure DevOps](https://www.microsoft.com/en-us/dev-community/Event/Register?eventId=TechWorldwithNana_VgvSHbwHWnRA&ocid=aid3038567)

- [Configure and pay for parallel jobs](https://learn.microsoft.com/en-us/azure/devops/pipelines/licensing/concurrent-jobs?view=azure-devops&tabs=ms-hosted#microsoft-hosted-cicd)

- [Azure Pipelines](https://azure.microsoft.com/en-us/products/devops/pipelines/)

- [What is Kubernetes?](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-kubernetes/#resources)

- [Azure Pipelines documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/?view=azure-devops&viewFallbackFrom=azure-devops%3FWT.mc_id%3Dmodinfra-74865-apedward)

- [Azure Repos documentation](https://learn.microsoft.com/en-us/azure/devops/repos/?view=azure-devops&viewFallbackFrom=azure-devops%3FWT.mc_id%3Dmodinfra-74865-apedward)

- [What is Azure Boards?](https://learn.microsoft.com/en-us/azure/devops/boards/get-started/what-is-azure-boards?view=azure-devops&viewFallbackFrom=azure-devops%3FWT.mc_id%3Dmodinfra-74865-apedward)

- [Azure DevOps documentation](https://learn.microsoft.com/en-us/azure/devops/?WT.mc_id=modinfra-74865-apedward&view=azure-devops)

- [Create your first pipeline](https://learn.microsoft.com/en-us/azure/devops/pipelines/create-first-pipeline?view=azure-devops&tabs=java%2Ctfs-2018-2%2Cbrowser)

- [Sign up for Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/user-guide/sign-up-invite-teammates?toc=%2Fazure%2Fdevops%2Fget-started%2Ftoc.json&view=azure-devops)


- [Get started with Azure Artifacts: Maven](https://learn.microsoft.com/en-us/azure/devops/artifacts/start-using-azure-artifacts?view=azure-devops&tabs=maven)

- [Troubleshoot pipeline runs](https://learn.microsoft.com/en-us/azure/devops/pipelines/troubleshooting/troubleshooting?view=azure-devops)

- [Billing FAQs](https://learn.microsoft.com/en-us/azure/devops/organizations/billing/billing-faq?view=azure-devops#user-assignment-based-billing)


- [Add & use variable groups](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/variable-groups?view=azure-devops&tabs=yaml)

- [How to add Bash or PowerShell script to Azure DevOps pipeline](https://stackoverflow.com/questions/56059144/how-to-add-bash-or-powershell-script-to-azure-devops-pipeline)

- [Parallel jobs in Azure DevOps](https://faun.pub/parallel-jobs-in-azure-devops-824e697bff18)

- [Parallel jobs pricing in Azure DevOps](https://www.azuredevopsguide.com/parallel-jobs-pricing-in-azure-devops/)