output "acct_mgr_admins_access_group" {
  description = "The newly created access group for account management Admins"
  value       = ibm_iam_access_group.acct_mgr_admins_access_group
}
