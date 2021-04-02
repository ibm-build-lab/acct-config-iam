variable "resource_group_name" {
  type        = string
  description = "Name of the environment's resource group."
  default     = "test"
}

variable "resource_group_id" {
  type        = string
  description = "ID of the environment's resource group."
}

variable "default_resource_group_id" {
  type        = string
  description = "ID of the account's default resource group."
}


variable "admins_access_group_name" {
  type        = string
  description = "Name for the Admin access group for the environment."
  default     = "TEST-ADMIN"
}

variable "users_access_group_name" {
  type        = string
  description = "Name for the User access group for the environment."
  default     = "TEST-USER"
}
