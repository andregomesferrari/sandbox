resource "azurerm_network_security_group" "sandbox1" {
  name                = "${var.name_prefix}-sg"
  resource_group_name = "${var.resource_group}"
  location            = "${var.location}"
}
