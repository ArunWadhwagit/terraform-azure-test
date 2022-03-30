module "mystorage" {
    source = "./modules/storageaccount"
    for_each = try(var.mystorage, {})
    storage = var.mystorage
    storage_accounts = each.value
}