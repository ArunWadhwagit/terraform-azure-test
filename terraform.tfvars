resource_groups_myrg = {
    resource_group1 = {
        resource_group_name = "RG-first"
        location = "eastus"
        az_tags = {
            "Name" = "RG-first"
            "Environment" = "prod"
        }
    }
    resource_group2 = {
        resource_group_name = "RG-second"
        location = "eastus"
        az_tags = {
            "Name" = "RG-second"
            "Environment" = "dev"
        }
    }
    }
tagslinuxvm2 = {
    "Name" = "linuxvmfour"
    "Env" = "prod"
}
mystorage = {
    st1 = {
        name = "stvmone"
        resource_group_name = "RG-first"
        location = "westeurope"
        account_kind = "StorageV2"
        account_tier = "Standard"
        account_replication_type = "LRS"
        access_tier = "Hot"
        nfsv3_enabled = false
        min_tls_version = "TLS1_2"
        tags = {
            "Name" = "Myfirststorageaccount"
            "Environment" = "Prod"
        }
        containers = {
            container1 = {
                container_name = "mysecondcontainer"
            }
            container2 = {
                container_name = "mysecondcontainer"
            }
        }

    }
}
filetest = {
    st1 = {
        name = "stvmfile"
        resource_group_name = "RG-second"
        location = "westeurope"
        account_kind = "StorageV2"
        account_tier = "Standard"
        account_replication_type = "LRS"
        access_tier = "Hot"
        nfsv3_enabled = false
        min_tls_version = "TLS1_2"
        tags = {
            "Name" = "Mysecondstorageaccount"
            "Environment" = "Dev"
        }
    fileshares = {
        fileshare1 = {
            file_share_name = "fs1"
            file_share_size = 1024
        }
        fileshare2 = {
            file_share_name = "fs2"
            file_share_size = 1
        }
    }
}
}