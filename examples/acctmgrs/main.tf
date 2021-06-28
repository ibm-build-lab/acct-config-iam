provider "ibm" {
  generation = 2
  region     = "us-south"
}

module "invite-users" {
  source = "../../modules/invite-users"

  acct_mgr_admins_user_ids = var.acct_mgr_admins_user_ids
}

module "acct-mgr-group" {
  source = "../../modules/acct-mgr-group"

  acct_mgr_admins_access_group_name = var.acct_mgr_admins_access_group_name
  acct_mgr_admins_user_ids = module.invite-users.users
}

