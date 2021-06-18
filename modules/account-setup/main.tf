
# Module to add account specific services

# create service id
resource "ibm_iam_service_id" "serviceID" { 
  name = var.service_id_name
  description = "Service ID used assign Classic Infrastructure and cluster creation priviledges"
}

# Add service id to admin access group
resource "ibm_iam_access_group_members" "adminaccgroupmem" { 
  access_group_id = var.admins_access_group_id 
  iam_service_ids = [ibm_iam_service_id.serviceID.id] 
}

# Creating an API key for service id is not currently supported in IBM provider, so need to do this manually with CLI commands: 
#
# ibmcloud iam service-api-key-create partner-sandbox-api-key $SERVICE_ID 
# ibmcloud ks credential set classic --infrastructure-api-key partner-sandbox-api-key --infrastructure-username $SERVICE_ID --region $REGION
#
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



