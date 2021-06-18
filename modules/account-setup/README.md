# IBM Terraform configurations for IBM Cloud Identity and Access Management (IAM)

This repository contains a collection of Terraform configurations for configuring Identity and Access Management (IAM) in IBM Cloud. These are focused on environment access.

## Configurations

| Name | Description |
| ---------------- | ---------------- |
| [account](https://github.com/ibm-pett/acct-config-iam/tree/master/modules/account) | Create service id, api keys and activity tracker instance |

## Variables

| Name | Description |
| ---------------- | ---------------- |
| resource_group_id | The ID of the existing resource group |
| admins_access_group_id | Admin access group id |
| region | Region for API Key and Activity Tracker|
| service_id_name | Name of service id to use for API keys |
| at_plan | Plan for Activity Tracker |


## Use

Install these configurations using the standard Terraform process:

- From a command line, change directory to the configuration's directory
- Modify its `terraform.tfvars` file
- Run `terraform init` to initialize Terraform
- Run `terraform apply` to install the configuration

## References

[Account Services API Documentation](https://cloud.ibm.com/docs/account?topic=account-account-services#api-acct-mgmt)

[IBM Cloud Terraform Provider Resources](https://cloud.ibm.com/docs/terraform?topic=terraform-index-of-ibm-cloud-provider-plug-in-for-terraform-resources-and-data-sources)
