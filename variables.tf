variable "stucount_name" {
  default = ["stulrs", "stugrs", "stuzrs"]
}
variable "replication" {
  default = ["LRS", "GRS", "LRS"]
}
variable "tier" {
  default = ["Standard", "Standard", "Standard"]
}
variable "stgaccts" {
  type = map(object({
    name          = string
    resourcegroup = string
    location      = string
    kind          = string
    repl          = string
    tier          = string
  }))

  default = {
    "sa1" = {
      name          = "group1stu"
      resourcegroup = "group1"
      location      = "eastus"
      kind          = "StorageV2"
      repl          = "LRS"
      tier          = "Standard"
    },

    "sa2" = {
      name          = "group2stu"
      resourcegroup = "group2"
      location      = "westeurope"
      kind          = "StorageV2"
      repl          = "GRS"
      tier          = "Standard"
    }
  }
}
variable "rg_name" {
  type    = string
  default = "RG_terraform"
}

variable "location" {
  type    = string
  default = "eastus"
}
variable "nsg_name" {
  type    = string
  default = "terraform"
}

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
variable "rgforvar" {
  default = ""
}
variable "rgforvarlocation" {
  default = ""
}
variable "rgforvaroutside" {
  default = "rgforvariableoutside"
}
variable "rgforvarlocationoutside" {
  default = "westeurope"
}
variable "remotesec_rules" {
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
  destination_port_range     = "3389"
    },

    "rule2" = {
  name                       = "rule2"
  priority                   = "101"
  direction                  = "inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = "80"
    },
    "rule3" = {
  name                       = "rule3"
  priority                   = "102"
  direction                  = "inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = "8080"
    },
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
  default = []
}
variable "subnet_name_module" {
  default = {}
}
variable "subnetcidr_module" {
  default = []
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
variable "resource_groups_myrg" {
  default = {}
}
variable "tagslinuxvm2" {
  default = {}
}
variable "mystorage" {
  default = {}
}
variable "filetest" {
  default = {}
}