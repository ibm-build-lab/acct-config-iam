variable "resource_group_name" {
  type        = string
  description = "Name for the resource group for the environment."
  default     = "test"
}

variable "default_resource_group_name" {
  type        = string
  description = "Name for the default resource group for the account."
  default     = "Default"
}
