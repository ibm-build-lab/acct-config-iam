output "users" {
  description = "The newly invited users"
  value = ibm_iam_user_invite.users.users
}
