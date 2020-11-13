# IBM Terraform configurations for IBM Cloud Identity and Access Management (IAM)

This repository contains a collection of Terraform configurations for configuring IBM Cloud accounts using [Identity and Access Management](https://cloud.ibm.com/docs/account?topic=account-userroles) (IAM).

## Configurations

| Name | Description |
| ---------------- | ---------------- |
| [acctmgrs](https://github.com/ibm-pett/acct-config-iam/tree/master/acctmgrs) | Create an access group for account management and add users to make them account managers. |
| [invite-users](https://github.com/ibm-pett/acct-config-iam/tree/master/acctmgrs/invite-users) | Add users to the account. Also give them all Classic Infrastructure permissions. |
| [ascctmgrgroup](https://github.com/ibm-pett/acct-config-iam/tree/master/acctmgrs/acctmgrgroup) | Create an access group with policies to manage the account and all resources in it. |
| | |
| [randagroups](https://github.com/ibm-pett/acct-config-iam/tree/master/randagroups) | Create a resource group and access groups for controlling access to an environment. |
| [rgroups](https://github.com/ibm-pett/acct-config-iam/tree/master/randagroups/rgroups) | Create a resource group for an environment. |
| [agroups](https://github.com/ibm-pett/acct-config-iam/tree/master/randagroups/agroups) | Create the access groups to use a resource group. |

## Use

Install these configurations using the standard Terraform process:
- From a command line, change directory to the configuration's directory
- Modify its `terraform.tfvars` file
- Run `terraform init` to initialize Terraform
- Run `terraform apply` to install the configuration

## Steps to set up an account

1. Account is created (Bob)
2. Create the access group for Account Managers and users (@Ann-Umberhocker, Dave Taylor)
    - Update `https://github.com/ibm-pett/acct-config-iam/tree/main/acctmgrs/terraform.tfvars`, set *acct_mgr_admins_access_group_name* to desired value (i.e.  `ACCT-MGR-ADMIN`)
    - Apply the config by running `terraform apply` in `https://github.com/ibm-pett/acct-config-iam/tree/main/acctmgrs`
3. Create an environment (resource group and access group) for Schematics workspaces
    - Update `https://github.com/ibm-pett/acct-config-iam/tree/main/randagroups/terraform.tfvars
    - Name the groups `schematics`, `SCHEMATICS-ADMIN`, and `SCHEMATICS-USER`
    - Apply the config by running `terraform apply` in `https://github.com/ibm-pett/acct-config-iam/tree/main/randagroups`
4. Create an environment (resource group and access group) for Cloud Pak sandboxes
    - Update `https://github.com/ibm-pett/acct-config-iam/tree/main/randagroups/terraform.tfvars`. 
    - Name the groups `cloud-pak-sandbox`, `CLOUD-PAK-SANDBOX-ADMIN`, and `CLOUD-PAK-SANDBOX-USER`
    - Apply the config by running `terraform apply` in `https://github.com/ibm-pett/acct-config-iam/tree/main/randagroups`
5. Add users to the access groups
    - A user who will run the script to create a Cloud Pak sandbox needs to belong to both `SCHEMATICS-ADMIN` (to run the workspace in `schematics`) and to `CLOUD-PAK-SANDBOX-ADMIN` (so that the script can install the sandbox in `cloud-pak-sandbox`)
    - A user who configures a sandbox's cluster once it's created or create other clusters manually needs to belong to `CLOUD-PAK-SANDBOX-ADMIN`
    - A user who uses a sandbox once it's installed needs to belong to `CLOUD-PAK-SANDBOX-USER`

The account is now configured.
