data "azurerm_key_vault_secret" "test" {
  name = "test-key"
  vault_uri = "https://af-keyvault.vault.azure.net/"
}

module "sandbox_net" {
  source = "./network"

  name_prefix    = "af-sandbox"
  location       = "Brazil South"
  net_addr_space = "10.8.8.0/24"
}

module "linuxbox" {
  source = "./linuxbox"

  name_prefix = "af-sandbox"
  location    = "Brazil South"
  subnet_id   = "${module.sandbox_net.subnet_id}"
  pip_id      = "${module.sandbox_net.pip_id}"
  vm_size     = "Standard_B1ms"
  test_vm_count = 3
  key_data = "${data.azurerm_key_vault_secret.test.value}"
}
