/*
 * create resource group
 */

resource "ibm_resource_group" "resourceGroup" {
  name = var.resource_group_name
}

data "ibm_resource_group" "resourceGroupDefault" {
  is_default = "true"
}
