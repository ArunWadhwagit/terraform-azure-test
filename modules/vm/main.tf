resource "azurerm_resource_group" "myterraformgroup" {
    name     = var.rg_name_module
    location = var.rg_location_module
}
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = var.vnet_name_module
    address_space       = [var.cidr_module]
    location            = azurerm_resource_group.myterraformgroup.location
    resource_group_name = azurerm_resource_group.myterraformgroup.name
}
resource "azurerm_subnet" "myterraformsubnet" {
    name                 = var.subnet_name_module
    resource_group_name  = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = [var.subnetcidr_module]
}
resource "azurerm_network_interface" "myterraformnic" {
    name                      = "NIC-${var.virtual_machine_name}-01"
    location                  = azurerm_resource_group.myterraformgroup.location
    resource_group_name       = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name                          = "ipcnfg${var.virtual_machine_name}"
        subnet_id                     = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
    }
    tags = var.tags
}
resource azurerm_virtual_machine vm02 {
  depends_on            = [azurerm_network_interface.myterraformnic]
  name                  = var.virtual_machine_name
  location              = azurerm_resource_group.myterraformgroup.location
  resource_group_name   = azurerm_resource_group.myterraformgroup.name
  network_interface_ids = [azurerm_network_interface.myterraformnic.id]
  vm_size               = var.virtual_machine_size
  tags = var.tags

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_os_disk_on_termination = true

  os_profile {
    computer_name  = var.virtual_machine_name
    admin_username = "tempuser"
    admin_password = "Welcome@12345"
  }
  
  os_profile_linux_config {
    disable_password_authentication = false
  }
storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.virtual_machine_name}osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.osdisk_type
    os_type           = "Linux"  
  }
}
#===================================================================
# Additional data disks to add
#===================================================================
resource azurerm_managed_disk datadisk {
  count                = length(var.data_disk_name)
  name                 = "${var.virtual_machine_name}-${var.data_disk_name[count.index]}"
  location             = azurerm_resource_group.myterraformgroup.location
  resource_group_name  = azurerm_resource_group.myterraformgroup.name
  storage_account_type = var.datadisk_type
  create_option        = "Empty"
  network_access_policy = "DenyAll"
  disk_size_gb         = var.data_disk_size[count.index]
  os_type              = "Linux"
}
resource azurerm_virtual_machine_data_disk_attachment datadiskattachment {
  count              = length(var.data_disk_name)
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = azurerm_virtual_machine.vm02.id
  lun                = count.index +var.luncount
  caching            = "None"
}
