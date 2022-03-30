variable "resource_groups" {
  description = "Resource Groups with their properties"
  type = map(object({
    location            = string
    resource_group_name = string
    az_tags             = map(any)
  }))
  default = {}
}