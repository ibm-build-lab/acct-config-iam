output "users" {
  description = "The newly invited users"
  value = module.invite-users.users
}

output "acct_mgr_admins_access_group" {
  description = "The newly created access group for account management Admins"
  value = module.acct-mgr-group.acct_mgr_admins_access_group
}
