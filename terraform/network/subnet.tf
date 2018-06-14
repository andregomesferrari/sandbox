resource "azurerm_subnet" "sandbox" {
  name                      = "${var.name_prefix}-subnet1"
  resource_group_name       = "${var.resource_group}"
  virtual_network_name      = "${azurerm_virtual_network.sandbox.name}"
  address_prefix            = "${cidrsubnet(var.net_addr_space, 4, 1)}"
  network_security_group_id = "${azurerm_network_security_group.sandbox1.id}"
}
