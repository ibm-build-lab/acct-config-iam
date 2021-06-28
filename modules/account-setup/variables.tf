variable "at_plan" {
  type        = string
  description = "Name for the Admin access group for the environment."
  default     = "30-day"
}

variable "region" {
  type        = string
  description = "Region for API Key"
  default     = "us-south"
}

variable "resource_group_id" {
  type        = string
  description = "id for the resource group created"
}

variable "service_id_name" {
  type        = string
  description = "Name of service id to use for API keys"
  default     = "partner-sandbox-admin-id"
}

variable "admins_access_group_id" {
  type        = string
  description = "Admin access group id"
}

