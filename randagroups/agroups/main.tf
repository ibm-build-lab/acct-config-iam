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
  roles           = ["Administrator", "Manager"]
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
  roles =  ["Satellite Link Administrator"]
  resources  {
    service = "satellite"
    resource_type = "link"
  }
}

