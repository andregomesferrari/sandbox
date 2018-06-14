terraform {
  required_version = ">= 0.11.7"

  backend "azurerm" {
    resource_group_name  = "devops"
    storage_account_name = "afglasslewisdevops"
    container_name       = "terraform-state"
    key                  = "sandbox/terraform.tfstate"
  }
}
