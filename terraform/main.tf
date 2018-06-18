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
}
