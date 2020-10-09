provider "ibm" {
  generation = 2
  region     = "us-south"
}

module "invite-users" {
  source = "./invite-users"

  acct_mgr_admins_user_ids = var.acct_mgr_admins_user_ids
}

module "acct-mgr-group" {
  source = "./acctmgrgroup"

  acct_mgr_admins_access_group_name = var.acct_mgr_admins_access_group_name
  acct_mgr_admins_user_ids = module.invite-users.users
}

