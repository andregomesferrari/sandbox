resource "azurerm_public_ip" "sandbox" {
  name                         = "${var.name_prefix}-pip"
  resource_group_name          = "${var.resource_group}"
  location                     = "${var.location}"
  public_ip_address_allocation = "static"
}
