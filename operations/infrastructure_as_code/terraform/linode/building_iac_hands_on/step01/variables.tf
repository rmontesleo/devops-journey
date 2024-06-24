# Set varaible contents for use with Terraform and linode

variable "linode_token" {
    type = string
    description = "(optional) describe your variable"
    sensitive = true
}

variable "root_password" {
    type = string
    description = "(optional) describe your variable"
    sensitive = true
    default = "value"
}

variable "ssh_private_key" {
    type = string
    description = "(optional) describe your variable"
    default = "/var/lib/jenkins/.ssh/id_ed25519"
}

variable "ssh_public_key" {
    type = string
    description = "(optional) describe your variable"
    default = "<THE_VALUE_OF_YOUR_PUBLIC_SSH_KEY>"
}