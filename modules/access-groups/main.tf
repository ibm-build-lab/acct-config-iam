/*
 * create ADMIN access group
 */

resource "ibm_iam_access_group" "admins_access_group" {
  name = var.admins_access_group_name
  description = join(" ", ["Administrators of the", var.resource_group_name, "environment"])
}

resource "ibm_iam_access_group_policy" "admins_registry_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Administrator", "Manager"]
  resources  {
    service = "container-registry"
  }
}

resource "ibm_iam_access_group_policy" "admins_certmgr_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Editor", "Manager"]
  resources  {
    service = "cloudcerts"
  }
}

resource "ibm_iam_access_group_policy" "admins_kubernetes_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Administrator", "Manager"]
  resources  {
    service = "containers-kubernetes"
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "admins_services_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Editor", "Manager"]
  resources  {
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "admins_resource_group_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Viewer"]
  resources  {
    resource_type = "resource-group"
    resource = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "admins_iam_group_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Viewer"]
  resources  {
    service = "iam-identity"
  }
}

resource "ibm_iam_access_group_policy" "admins_entitlement_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Editor"]
  resources  {
    service = "entitlement"
  }
}

resource "ibm_iam_access_group_policy" "admins_billing_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Viewer"]
  resources  {
    service = "billing"
  }
}

resource "ibm_iam_access_group_policy" "admins_support_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles =  ["Viewer","Editor"]
  resources  {
    service = "support"
  }
}

resource "ibm_iam_access_group_policy" "admins_schematics_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles           = ["Administrator"]
  resources {
    service = "schematics"
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "admins_is_floating_ip_default_rg_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles           = ["Editor"]
  resources {
    service = "is"
    resource_type = "floating_ip"
    resource_group_id = var.default_resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "admins_is_volume_default_rg_policy" {
  access_group_id = ibm_iam_access_group.admins_access_group.id
  roles           = ["Editor"]
  resources {
    service = "is"
    resource_type = "volume"
    resource_group_id = var.default_resource_group_id
  }
}

/*
 * create USER access group
 */

resource "ibm_iam_access_group" "users_access_group" {
  name = var.users_access_group_name
  description = join(" ", ["Users of the", var.resource_group_name, "environment"])
}

resource "ibm_iam_access_group_policy" "users_registry_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Writer", "Reader"]
  resources  {
    service = "container-registry"
  }
}

resource "ibm_iam_access_group_policy" "users_kubernetes_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Editor", "Manager"]
  resources  {
    service = "containers-kubernetes"
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "users_services_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Viewer", "Writer"]
  resources  {
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "users_resource_group_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Viewer"]
  resources  {
    resource_type = "resource-group"
    resource = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "users_logdna_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Manager"]
  resources  {
    service = "logdna"
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "users_cloudant_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Manager"]
  resources  {
    service = "cloudantnosqldb"
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "users_cloud_object_storage_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles           = ["Viewer", "Writer"]
  resources {
    service = "cloud-object-storage"
    resource_group_id = var.resource_group_id
  }
}

resource "ibm_iam_access_group_policy" "users_support_policy" {
  access_group_id = ibm_iam_access_group.users_access_group.id
  roles =  ["Editor"]
  resources  {
    service = "support"
  }
}

/*
 * create SAT-ADMIN access group
 */

resource "ibm_iam_access_group" "sat_access_group" {
  name = var.sat_access_group_name
  description = join(" ", ["Satellite Admininstrators in the", var.resource_group_name, "environment"])
}

resource "ibm_iam_access_group_policy" "sat_service_policy" {
  access_group_id = ibm_iam_access_group.sat_access_group.id
  roles =  ["Administrator"]
  resources  {
    service = "satellite"
  }
}

resource "ibm_iam_access_group_policy" "sat_link_policy" {
  access_group_id = ibm_iam_access_group.sat_access_group.id
  roles =  ["Satellite Link Source and Endpoint Controller"]
  resources  {
    service = "satellite"
    resource_type = "link"
  }
}

/*
 * create SERVICEID access group, permissions to create a cluster.  
 * See https://cloud.ibm.com/docs/containers?topic=containers-access_reference#cluster_create_permissions
 */
resource "ibm_iam_access_group" "serviceid_access_group" {
  name = var.serviceid_access_group_name
  description = join(" ", ["Cluster creation access for service ID in the", var.resource_group_name, "environment"])
}

# Administrator platform access role for Kubernetes Service in the console in resource group.
# Writer or Manager service access role for Kubernetes Service in the console in resource group.
resource "ibm_iam_access_group_policy" "serviceid_kubernetes_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles =  ["Administrator", "Manager"]
  resources  {
    service = "containers-kubernetes"
    resource_group_id = var.resource_group_id
  }
}

# Administrator platform access role for Container Registry in the console at the Account level. 
# Do not limit policies for IBM Cloud Container Registry to the resource group level.
resource "ibm_iam_access_group_policy" "serviceid_registry_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles =  ["Administrator"]
  resources  {
    service = "container-registry"
  }
}

# If you plan to expose apps with Ingress, assign the user Administrator or Editor platform access role
# and the Manager service access role for Certificate Manager in resource group.
resource "ibm_iam_access_group_policy" "serviceid_certmgr_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles =  ["Editor", "Manager"]
  resources  {
    service = "cloudcerts"
    resource_group_id = var.resource_group_id
  }
}

# Viewer platform access role for the resource group access.
resource "ibm_iam_access_group_policy" "serviceid_resource_group_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles =  ["Viewer"]
  resources  {
    resource_type = "resource-group"
    resource = var.resource_group_id
  }
}

# The Service ID creator role to Identity and Access Management in the console.
# The User API key creator role to Identity and Access Management in the console.
resource "ibm_iam_access_group_policy" "serviceid_iam_group_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles =  ["Service ID creator","User API key creator","Operator"]
  resources  {
    service = "iam-identity"
  }
}

# appropriate permission to the key management service (KMS) provider
resource "ibm_iam_access_group_policy" "serviceid_kms_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles =  ["Administrator"]
  resources  {
    service = "kms"
    resource_group_id = var.resource_group_id
  }
}

# VPC clusters only: Administrator platform access role for VPC Infrastructure.
resource "ibm_iam_access_group_policy" "serviceid_is_rg_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles           = ["Administrator"]
  resources {
    service = "is"
    resource_group_id = var.resource_group_id
  }
}

# Need to specify these resource types in Default rg due to bug in VPC infrastructure
resource "ibm_iam_access_group_policy" "serviceid_is_floating_ip_default_rg_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles           = ["Editor"]
  resources {
    service = "is"
    resource_type = "floating_ip"
    resource_group_id = var.default_resource_group_id
  }
}

# Need to specify these resource types in Default rg due to bug in VPC infrastructure
resource "ibm_iam_access_group_policy" "serviceid_is_volume_default_rg_policy" {
  access_group_id = ibm_iam_access_group.serviceid_access_group.id
  roles           = ["Editor"]
  resources {
    service = "is"
    resource_type = "volume"
    resource_group_id = var.default_resource_group_id
  }
}

# Classic clusters only: Super User role or the minimum required permissions for classic infrastructure.
# This will need to be done manually.
# See https://cloud.ibm.com/docs/account?topic=account-mngclassicinfra
