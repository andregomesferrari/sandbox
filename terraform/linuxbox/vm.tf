resource "azurerm_network_interface" "sandbox" {
  name                = "${var.name_prefix}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.pip_id}"
  }
}

resource "azurerm_virtual_machine" "sandbox_linux" {
  name                  = "${var.name_prefix}-linuxvm"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group}"
  network_interface_ids = ["${azurerm_network_interface.sandbox.id}"]
  vm_size               = "${var.vm_size}"

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "6.7"
    version   = "latest"
  }

  storage_os_disk {
    name          = "${var.name_prefix}-osdisk"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  /* 
  storage_data_disk {
    name          = "${local.resource_prefix}-datadisk"
    create_option = "Empty"
    lun           = 0
    disk_size_gb  = "${var.vm_disk_size}"
  } */

  os_profile {
    computer_name  = "AF-LINUXBOX1"
    admin_username = "aferrari"
    admin_password = "Go@hell1079"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
