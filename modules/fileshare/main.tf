resource "azurerm_storage_share" "fileshare" {
  for_each = try(var.storage_accountsfile.fileshares, {})
  name                  = each.value.file_share_name
  quota                 = each.value.file_share_size
  storage_account_name  = azurerm_storage_account.stgaccountfile.name
}
resource "azurerm_storage_account" "stgaccountfile" {
  name                      = var.storage_accountsfile.name
  resource_group_name       = var.storage_accountsfile.resource_group_name
  location                  = var.storage_accountsfile.location
  account_kind              = var.storage_accountsfile.account_kind
  account_tier              = var.storage_accountsfile.account_tier
  account_replication_type  = var.storage_accountsfile.account_replication_type
  access_tier               = var.storage_accountsfile.access_tier
  nfsv3_enabled             = var.storage_accountsfile.nfsv3_enabled
  tags                      = var.storage_accountsfile.tags
  enable_https_traffic_only = "true"
  min_tls_version           = "TLS1_2"
  is_hns_enabled            = "false"
  network_rules {
    default_action             = try(var.storage_accountsfile.default_action, "Allow")
    ip_rules                   = try(var.storage_accountsfile.ip_rules, null)
    virtual_network_subnet_ids = try(var.storage_accountsfile.virtual_network_subnet_ids, null)
  }
}