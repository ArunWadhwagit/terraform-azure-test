module "filetest" {
    source = "./modules/fileshare"
    for_each = try(var.filetest, {})
    storageshare = var.filetest
    storage_accountsfile = each.value
}