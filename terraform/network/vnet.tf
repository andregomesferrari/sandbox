resource "azurerm_virtual_network" "sandbox" {
  name                = "${var.name_prefix}-network"
  address_space       = ["${var.net_addr_space}"]
  resource_group_name = "${var.resource_group}"
  location            = "${var.location}"
}
