# IBM Terraform configurations for IBM Cloud Identity and Access Management (IAM)

This repository contains a collection of Terraform configurations for configuring Identity and Access Management (IAM) in IBM Cloud. These are focused on environment access.

## Configurations

| Name   | Description                                                                                      | Source                                                |
| ------ | ------------------------------------------------------------------------------------------------ | ---------------------------------------------------- |
| resource_group_name | The name for the new resource group |

## Variables

| Name   | Description                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------ |
| resource_group_name | The resource group name |
| admins_access_group_name | The name for the administrators access group |
| users_access_group_name | The name for the users access group |

## Use

Install these configurations using the standard Terraform process:
- From a command line, change directory to the configuration's directory
- Modify its `terraform.tfvars` file
- Run `terraform init` to initialize Terraform
- Run `terraform apply` to install the configuration
