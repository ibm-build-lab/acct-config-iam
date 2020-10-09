/*
 * Create access group for account administrators
 */

resource "ibm_iam_access_group" "acct_mgr_admins_access_group" {
  name = var.acct_mgr_admins_access_group_name
  description = "Administrators of the account"
}

/*
 * Add account administration policies
 */

// Administer: All account management services
resource "ibm_iam_access_group_policy" "admins_acct_mgmt_policy" {
  access_group_id = ibm_iam_access_group.acct_mgr_admins_access_group.id
  roles =  ["Administrator"]
  account_management = true
}

/*
 * Add service and resource administration policies
 */

// Administer and manage: All service in all resource groups
resource "ibm_iam_access_group_policy" "admins_all_services_policy" {
  access_group_id = ibm_iam_access_group.acct_mgr_admins_access_group.id
  roles =  ["Administrator", "Manager"]
  resources  {
    resource_group_id = "*"
  }
}

// Administer: All resource group
resource "ibm_iam_access_group_policy" "admins_all_resource_groups_policy" {
  access_group_id = ibm_iam_access_group.acct_mgr_admins_access_group.id
  roles =  ["Administrator"]
  resources  {
    resource_type = "resource-group"
  }
}

// Administer and manage: All resources in account (including future IAM enabled services)
resource "ibm_iam_access_group_policy" "admins_all_resources_policy" {
  access_group_id = ibm_iam_access_group.acct_mgr_admins_access_group.id
  roles =  ["Administrator", "Manager"]
}

/*
 * Add account administrators
 */

resource "ibm_iam_access_group_members" "acct_mgr_admins_members" {
  access_group_id = ibm_iam_access_group.acct_mgr_admins_access_group.id
  ibm_ids         = var.acct_mgr_admins_user_ids
}
