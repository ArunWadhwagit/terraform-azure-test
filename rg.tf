module "myrg" {
    source = "./modules/rg"
    resource_groups = var.resource_groups_myrg
}
