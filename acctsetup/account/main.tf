
# Module to add account specific services

# create service id
resource "ibm_iam_service_id" "serviceID" { 
  name = var.service_id_name
}

# Add service id to admin access group
resource "ibm_iam_access_group_members" "adminaccgroupmem" { 
  access_group_id = var.admins_access_group_id 
  iam_service_ids = [ibm_iam_service_id.serviceID.id] 
}

# Give service id infrastructure roles
# resource "ibm_iam_user_invite" "serviceID" {
#   users = [ibm_iam_service_id.serviceID.id] 
#   classic_infra_roles {
#     permission_set = "superuser"
#   }
# }

# resource "ibm_iam_service_policy" "policy" {
#   iam_service_id = ibm_iam_service_id.serviceID.id
#   classic_infra_roles {
#      permission_set = "superuser"
#   }
# }

# Not currently supported
# resource "ibm_iam_service_api_key" "acc_apiKey" {
#   name = "serviceID_apikey"
#   iam_service_id = ibm_iam_service_id.serviceID.iam_id
# }

resource "ibm_resource_instance" "at_instance" {
  name              = "logging-instance-local"
  service           = "logdnaat"
  plan              = var.at_plan
  location          = var.region
  resource_group_id = var.resource_group_id
}



