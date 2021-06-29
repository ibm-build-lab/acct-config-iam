
# Module to add account specific services

# create service id
resource "ibm_iam_service_id" "serviceID" {
  name        = var.service_id_name
  description = "Service ID used assign Classic Infrastructure and cluster creation priviledges"
}

# Add service id to admin access group
resource "ibm_iam_access_group_members" "adminaccgroupmem" {
  access_group_id = var.serviceid_access_group_id
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

resource "null_resource" "create_api_key" {
  provisioner "local-exec" {
    command        = "${path.module}/scripts/create_serviceid_api_key.sh"
    environment = {
      SERVICEID      = ibm_iam_service_id.serviceID.iam_id
      # RESOURCE_GROUP = var.resource_group_id
      # REGION         = var.region
    }
  }
}

resource "ibm_resource_instance" "at_instance1" {
  name              = "logging-instance-eu-de"
  service           = "logdnaat"
  plan              = var.at_plan
  location          = "eu-de"
  resource_group_id = var.resource_group_id
}

resource "ibm_resource_instance" "at_instance2" {
  name              = "logging-instance-us-south"
  service           = "logdnaat"
  plan              = var.at_plan
  location          = "us-south"
  resource_group_id = var.resource_group_id
}

resource "ibm_resource_instance" "at_instance3" {
  name              = "logging-instance-us-east"
  service           = "logdnaat"
  plan              = var.at_plan
  location          = "us-east"
  resource_group_id = var.resource_group_id
}




