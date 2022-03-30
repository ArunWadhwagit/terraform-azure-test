variable "sec_rules" {
  type = map(object({
  name                       = string
  priority                   = string
  direction                  = string
  access                     = string
  protocol                   = string
  source_port_range          = string
  destination_port_range     = string
  }))

  default = {
    "rule1" = {
  name                       = "rule1"
  priority                   = "100"
  direction                  = "inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = "*"
    },

    "rule2" = {
  name                       = "rule2"
  priority                   = "101"
  direction                  = "inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = "*"
    }
  }
}
variable "rg_name_module" {
  default = {}
}
variable "rg_location_module" {
  default = {}
}
variable "vnet_name_module" {
  default = {}
}
variable "cidr_module" {
  default = {}
}
variable "subnet_name_module" {
  default = {}
}
variable "subnetcidr_module" {
  default = {}
}
variable "virtual_machine_name" {
  default = {}
}
variable "nsg_name_module" {
  default = {}
}
variable "virtual_machine_size" {
  default = {}
}
variable "osdisk_type" {
  default = {}
}
variable "data_disk_name" {
  default = []
}
variable "datadisk_type" {
  default = {}
}
variable "data_disk_size" {
  default = []
}
variable "luncount" {
  default = {}
}
variable "tags" {
  default = {}
}