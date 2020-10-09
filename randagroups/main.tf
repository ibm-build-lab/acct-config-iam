provider "ibm" {
  generation         = 2
  region             = "us-south"
}

module "resource-groups" {
  source = "./rgroups"

  resource_group_name = var.resource_group_name
}

module "access-groups" {
  source = "./agroups"

  resource_group_name      = module.resource-groups.resource_group_name
  resource_group_id        = module.resource-groups.resource_group_id
  admins_access_group_name = var.admins_access_group_name
  users_access_group_name  = var.users_access_group_name
}

