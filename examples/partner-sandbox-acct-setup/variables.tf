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

variable "service_id_name" {
  type        = string
  description = "Name of service id to use for API keys"
  default     = "admin-acct-id"
}

variable "region" {
  type        = string
  description = "Region to use for activity tracker and API keys"
  default     = "us-south"
}

variable "at_plan" {
  type        = string
  description = "Activity Tracker plan"
  default     = "7-day"
}
