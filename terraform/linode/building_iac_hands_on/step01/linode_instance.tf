# Set cloud provider information
terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
  }
}

# declare teh required token variable for linode
provider "linode" {
  token = var.linode_token
}

# create a Linode instance
resource "linode_instance" "terraform-web" {
  image           = "linode/ubuntu22.04"
  label           = "example-instance"
  region          = "us-east"
  type            = "g6-standard-1"
  root_pass       = var.root_password
  authorized_keys = [var.ssh_public_key]
  

  # Run a simple task to verify ssh connectivity is ready
  provisioner "remote-exec" {
    inline = ["cat /etc/os-release"]

    # Configure parameters for ssh so Terraform can connect to the new instance
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.ip_address
      private_key = file(var.ssh_private_key)
    }
  }

  # Run an Ansible playbook against the new instance
  # TODO: Pending the full command to execute ansible
  #provisioner "local-exec" {
  #  command = "ansible-playbook -u root -i '${self.ip_address},' -e 'ansible_python_interpreter=/usr/bin/py$'  "
  #}


}
