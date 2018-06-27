resource "azurerm_network_interface" "sandbox_test" {
  count               = "${var.test_vm_count}"
  name                = "${var.name_prefix}-test-nic-${count.index+1}"
  location            = "${var.location}"
  resource_group_name = "prod-ecru"

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "sandbox_test" {
  count                 = "${var.test_vm_count}"
  name                  = "${var.name_prefix}-test-linuxvm-${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "prod-ecru"
  network_interface_ids = ["${element(azurerm_network_interface.sandbox_test.*.id, count.index+1)}"]
  vm_size               = "${var.vm_size}"

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "6.7"
    version   = "latest"
  }

  storage_os_disk {
    name          = "${var.name_prefix}-test-osdisk-${count.index+1}"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  delete_os_disk_on_termination = true

  /* 
  storage_data_disk {
    name          = "${local.resource_prefix}-test-datadisk-${count.index+1}"
    create_option = "Empty"
    lun           = 0
    disk_size_gb  = "${var.vm_disk_size}"
  } */

  os_profile {
    computer_name  = "AF-TEST-LINUX${count.index+1}"
    admin_username = "aferrari"
    admin_password = "Go@hell1079"
  }
  os_profile_linux_config {
    disable_password_authentication = false

    ssh_keys = [{
      path     = "/home/aferrari/.ssh/authorized_keys"
      key_data = "${var.key_data}"
    }]
  }
}
