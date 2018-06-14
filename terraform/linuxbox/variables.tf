variable "name_prefix" {
  description = "Prefix to name all resources"
}

variable "location" {}

variable "resource_group" {
  default = "devops"
}

variable "subnet_id" {}

variable "pip_id" {}

variable "vm_size" {}
