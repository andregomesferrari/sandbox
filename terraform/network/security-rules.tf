data "external" "client_ip" {
  program = ["PowerShell", "-Command", "(Invoke-WebRequest -Uri https://api.ipify.org/?format=json -UseBasicParsing).Content"]
}

resource "azurerm_network_security_rule" "sandbox_allow_ssh_in" {
  name                        = "${var.name_prefix}-ssh-in"
  resource_group_name         = "${var.resource_group}"
  network_security_group_name = "${azurerm_network_security_group.sandbox1.name}"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefixes     = ["${data.external.client_ip.result["ip"]}"]
  destination_address_prefix  = "${azurerm_subnet.sandbox.address_prefix}"
}

 resource "azurerm_network_security_rule" "sandbox_allow_ssh_out" {
  name                         = "${var.name_prefix}-ssh-out"
   resource_group_name         = "${var.resource_group}"
  network_security_group_name = "${azurerm_network_security_group.sandbox1.name}"
  priority                     = 200
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "22"
  destination_port_range       = "*"
  source_address_prefix        = "${azurerm_subnet.sandbox.address_prefix}"
  destination_address_prefixes = ["${data.external.client_ip.result["ip"]}"]
} 