/*
 * Invite (i.e. add) the list of user IDs (i.e. email addresses) to the account.
 * And give them all Classic Infrastructure permissions.
 * Careful running DESTROY with this script, it will remove all of the specified users from the account!!
 */

resource "ibm_iam_user_invite" "users" {
  users = var.acct_mgr_admins_user_ids
  classic_infra_roles {
    permission_set = "superuser"
  }
}
