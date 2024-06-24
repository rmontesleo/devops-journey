variable "linodeToken" {
  type        = string
  description = "Linode Token V0"
  sensitive   = true
}

#
variable "region" {
  type        = string
  description = "Region for Linode instance"
  default     = "us-east"
}


variable "linodeInstancePwd" {
  type        = string
  description = "Password for created Linode instance"
  sensitive   = true
}

variable "instance_type" {
  type        = string
  description = "Type of Linode instance"
  default     = "g6-nanode-1"
}

variable "instance_image" {
  type        = string
  description = "Image for Linode instance"
  default     = "linode/ubuntu22.04"
}

#
variable "jenkins_image" {
  type        = string
  description = "Image for Jenkins Linode instance"
  default     = "linode/debian11"
}

#
variable "jenkins_stackscript_id" {
  type        = number
  description = "Stackscript ID for Jenkins Linode instance"
  default     = 607401

}