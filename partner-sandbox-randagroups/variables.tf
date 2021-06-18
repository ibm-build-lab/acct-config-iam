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
  description = "Name for the Users access group."
  default     = "TEST-USER"
}

variable "sat_access_group_name" {
  type        = string
  description = "Name for the Satellite Admins access group."
  default     = "TEST-SAT-ADMIN"
}

