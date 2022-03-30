resource "azurerm_storage_container" "container" {
  for_each = try(var.storage_accounts.containers, {})
  name                  = each.value.container_name
  storage_account_name  = azurerm_storage_account.stgaccount.name
  container_access_type = "private"
}
resource "azurerm_storage_account" "stgaccount" {
  name                      = var.storage_accounts.name
  resource_group_name       = var.storage_accounts.resource_group_name
  location                  = var.storage_accounts.location
  account_kind              = var.storage_accounts.account_kind
  account_tier              = var.storage_accounts.account_tier
  account_replication_type  = var.storage_accounts.account_replication_type
  access_tier               = var.storage_accounts.access_tier
  nfsv3_enabled             = var.storage_accounts.nfsv3_enabled
  tags                      = var.storage_accounts.tags
  enable_https_traffic_only = "true"
  min_tls_version           = "TLS1_2"
  is_hns_enabled            = "false"
  network_rules {
    default_action             = try(var.storage_accounts.default_action, "Allow")
    ip_rules                   = try(var.storage_accounts.ip_rules, null)
    virtual_network_subnet_ids = try(var.storage_accounts.virtual_network_subnet_ids, null)
  }
}
