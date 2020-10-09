# IBM Terraform configurations for IBM Cloud Identity and Access Management (IAM)

This repository contains a collection of Terraform configurations for configuring Identity and Access Management (IAM) in IBM Cloud. These are focused on environment access.

## Configurations

| Name | Description |
| ---------------- | ---------------- |
| [rgroups](https://github.com/ibm-pett/acct-config-iam/tree/main/randagroups/rgroups) | Create a resource group for an environment. |

## Variables

| Name | Description |
| ---------------- | ---------------- |
| resource_group_name | The name for the new resource group |

## Use

Install these configurations using the standard Terraform process:
- From a command line, change directory to the configuration's directory
- Modify its `terraform.tfvars` file
- Run `terraform init` to initialize Terraform
- Run `terraform apply` to install the configuration
