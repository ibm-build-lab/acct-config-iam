
 // create service id
resource "ibm_iam_service_id" "serviceID" { 
  name = var.acct_service_id 
}

// Add service id to admin access group
resource "ibm_iam_access_group_members" "adminaccgroupmem" { 
  access_group_id = var.admins_access_group_id 
  iam_service_ids = [ibm_iam_service_id.serviceID.id] 
}

// Set up Activity Tracker with LogDNA



