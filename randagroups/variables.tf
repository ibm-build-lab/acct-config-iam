variable "resource_group_name" {
  type        = string
  description = "Name for the resource group for the environment."
  default     = "test"
}

variable "admins_access_group_name" {
  type        = string
  description = "Name for the Admins access group."
  default     = "TEST-ADMIN"
}

variable "users_access_group_name" {
  type        = string
  description = "Name for the Admins access group."
  default     = "TEST-USER"
}
