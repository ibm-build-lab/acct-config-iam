# IBM Terraform configurations for IBM Cloud Identity and Access Management (IAM)

This repository contains a collection of Terraform configurations for configuring Identity and Access Management (IAM) in IBM Cloud. These are focused on environment access.

## Configurations

| Name | Description |
| ---------------- | ---------------- |
| [partner-sandbox-acct-setup](https://github.com/ibm-hcbt/acct-config-iam/tree/master/partner-sandbox-acct-setup) | Create a resource group and access groups for controlling access to an environment. |

## Variables

| Name | Description |
| ---------------- | ---------------- |
| resource_group_name | The name for the new resource group |
| admins_access_group_name | The name for the new administrators access group |
| users_access_group_name | The name for the new users access group |
| sat_access_group_name | The name for the new Satellite admin access group |

## Use

Install these configurations using the standard Terraform process:

- From a command line, change directory to the configuration's directory
- Modify its `terraform.tfvars` file
- Run `terraform init` to initialize Terraform
- Run `terraform apply` to install the configuration
