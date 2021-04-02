/*
 * create resource group
 */

resource "ibm_resource_group" "resourceGroup" {
  name = var.resource_group_name
}

resource "ibm_resource_group" "resourceGroupDefault" {
  name = var.default_resource_group_name
}
