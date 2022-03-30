# module linuxvm1 {
#     source = "./modules/vm"
#     rg_name_module = "rgtwo"
#     rg_location_module = "westeurope"
#     vnet_name_module = "vnettwo"
#     cidr_module = "10.0.0.0/16"
#     subnet_name_module = "subnettwo"
#     subnetcidr_module = "10.0.1.0/24"
#     virtual_machine_name = "vmtwo"
#     nsg_name_module = "nsgtwo"
#     virtual_machine_size = "Standard_D2ads_v5"
#     osdisk_type = "StandardSSD_LRS"
#     data_disk_name = ["backup","DATA1","DATA2"]
#     datadisk_type = "StandardSSD_LRS"
#     data_disk_size = ["100","100","200"]
#     luncount = "0"
# }
module linuxvm2 {
    source = "./modules/vm"
    rg_name_module = "rgthree"
    rg_location_module = "westeurope"
    vnet_name_module = "vnetthree"
    cidr_module = "10.0.0.0/16"
    subnet_name_module = "subnetthree"
    subnetcidr_module = "10.0.2.0/24"
    virtual_machine_name = "vmthree"
    virtual_machine_size = "Standard_D2ads_v5"
    osdisk_type = "StandardSSD_LRS"
    data_disk_name = ["backup","DATA1","DATA2"]
    datadisk_type = "StandardSSD_LRS"
    data_disk_size = ["100","100","200"]
    luncount = "0"
    tags = var.tagslinuxvm2
}