
provider "ibm" {
  region = "us-south"
  version = "~> 1.12"
}

module "resource-group" {
  source = "../../modules/resource-group"

  resource_group_name = var.resource_group_name
}

module "access-groups" {
  source = "../../modules/access-groups"

  resource_group_name       = module.resource-group.resource_group_name
  resource_group_id         = module.resource-group.resource_group_id
  default_resource_group_id = module.resource-group.default_resource_group_id
  admins_access_group_name  = var.admins_access_group_name
  users_access_group_name   = var.users_access_group_name
  sat_access_group_name     = var.sat_access_group_name
}

module "account-setup" {
  source = "../../modules/account-setup"

  at_plan                   = var.at_plan
  region                    = var.region
  resource_group_id         = module.resource-group.resource_group_id
  admins_access_group_id    = module.access-groups.admins_access_group_id
  service_id_name           = var.service_id_name
}

