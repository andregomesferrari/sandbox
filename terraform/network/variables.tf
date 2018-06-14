variable "name_prefix" {
  description = "Prefix to name all resources"
}

variable "location" {}

variable "resource_group" {
  default = "devops"
}

variable "net_addr_space" {
  description = "address space for the virtual network"
}
