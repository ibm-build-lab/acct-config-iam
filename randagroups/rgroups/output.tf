output "resource_group_name" {
  description = "Name of the newly created resource group"
  value       = ibm_resource_group.resourceGroup.name
}

output "resource_group_id" {
  description = "ID of the newly created resource group"
  value       = ibm_resource_group.resourceGroup.id
}
