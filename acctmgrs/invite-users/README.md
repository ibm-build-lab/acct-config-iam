# IBM Terraform configurations for IBM Cloud Identity and Access Management (IAM)

This repository contains a collection of Terraform configurations for configuring Identity and Access Management (IAM) in IBM Cloud. These are focused on account management.

## Configurations

| Name | Description |
| ---------------- | ---------------- |
| [invite-users](https://github.com/ibm-pett/acct-config-iam/tree/main/acctmgrs/invite-users) | Add users to the account. Also give them all Classic Infrastructure permissions. |

## Variables

| Name | Description |
| ---------------- | ---------------- |
| acct_mgr_admins_user_ids | The users to invite to the account |

## Use

Install these configurations using the standard Terraform process:
- From a command line, change directory to the configuration's directory
- Modify its `terraform.tfvars` file
- Run `terraform init` to initialize Terraform
- Run `terraform apply` to install the configuration
