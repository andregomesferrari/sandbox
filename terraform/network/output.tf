output "subnet_id" {
  value = "${azurerm_subnet.sandbox.id}"
}

output "pip_id" {
  value = "${azurerm_public_ip.sandbox.id}"
}
