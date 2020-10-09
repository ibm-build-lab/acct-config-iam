variable "acct_mgr_admins_access_group_name" {
  type        = string
  description = "Name for the Admin access group for the account"
  default     = "ACCT-MGR-ADMIN"
}

variable "acct_mgr_admins_user_ids" {
  type        = list(string)
  description = "Names of the users to add to the Admin access group"
}
