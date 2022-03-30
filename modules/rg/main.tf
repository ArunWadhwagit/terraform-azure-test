resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups  
  name     = each.value["resource_group_name"]
  tags     = each.value["az_tags"]
  location = each.value["location"]
}
