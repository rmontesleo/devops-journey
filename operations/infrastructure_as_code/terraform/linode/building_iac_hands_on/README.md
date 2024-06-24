# Building with Infrastructure as Code | Terraform, Ansible, and Jenkins Hands-On Guide


1. Create a Linode with Jenkins from market place
2. Connect to the linode like root user
3. verify the content of secrets
```bash 
# list the files
ls /var/lib/jenkins/secrets

# get the initial password
cat /var/lib/jenkins/secrets/initialAdminPassword
```

4. Open a web browser and type the linode ip on the port 8080. Type the initial password, and press continue button
```bash
curl http://$linode_ip:8080
```

5. In the page, select install plugins and then fill the First Admin User form

6. Install terraform in your jenkins instance linode
```bash
#
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Install the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg


# Verify the key's fingerprint.
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# 
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

#
sudo apt update

sudo apt-get install terraform -y

#
terraform --version

```


7. Install ansible
```bash
sudo apt install ansible -y

ansible --version
```

8. working with the jenkins user
```bash
# switch from root to jenkins user
su - jenkins

# verify the jenkins home is /var/lib/jenkins 
echo $HOME

# creat your ssh key
ssh-keygetn -t ed25519

# verify your keys
ls .ssh

```

9. Go to linode web console, profile, API token and create a new one, with specific grants. Remember the token grants depend of each project. For this one the grants will be. Create your token and save it

Read/Write
- IP
- Linode
- Volume

Read Only
- Account
- Images
- Longview

None for the rest
- Databases
- Domain
- Events
- Firewalls
- kubernetes
- NodeBalancers
- Object storage
- stack scripts


10. Return to root user
```bash
logout

# create a directory for jenkis jobs
mkdir -p /jenkins/jobs/

# root is the owner
ls -la /jenkins/jobs

# change the owner for this folder user:group -R (recursive) folder name
chwon jenkins:jenkins -R /jenkins/jobs

# now jenkins is the owner
ls -la /jenkis/jobs

```

11. Swithc to jenkins user
```bash
su - jenkins
cd /jenkins/jobs

# create a folder named linode builds and go inside
mkdir linode_builds
cd linode_builds

# inside this directory you create the terraform files and add the content in step01/linode_instance.tf
touch linode_instance.tf
```

12. Create the variables.tf file
```bash
touch variables.tf
```

13. Create the apache.yml file
```bash
touch apache.yml
```

14. Create the ansigle.cfg
```bash
touch ansible.cfg
```

15. Init your terraform project and validate your tf files
```bash
terraform init
terraform plan
```




## References

- [Video: Building with Infrastructure as Code | Terraform, Ansible, and Jenkins Hands-On Guide](https://www.youtube.com/watch?v=ly-2nHKPEeU)
- [How To Use Ansible with Terraform for Configuration Management](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management)


- [An Introduction to Infrastructure as Code](https://www.linode.com/docs/guides/introduction-to-infrastructure-as-code/)
- [Plan Types - Choosing a Compute Instance Type and Plan](https://www.linode.com/docs/products/compute/compute-instances/plans/choosing-a-plan/)
- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)