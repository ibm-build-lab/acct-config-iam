# Steps to set up a Cloud Pak Sandbox account

## Account Owner Tasks

1. Create IBM Cloud Account for partner

2. Create the access group and users for Account Managers

    - Uncomment and add list of Account Manager users to this [terraform.tfvars](./acctmgrs/acctmgrgroup/terraform.tfvars) file
    
    - Run scripts from `https://github.com/ibm-hcbt/acct-config-iam/tree/main/acctmgrs` either using [Schematics](./README.md#run-from-a-schematics-workspace) or local [Terraform](./README.md#run-from-local-terraform-client) client. If using schematics, create and apply new workspace in the `Default` resource group.

    Once run, the `ACCT-MGR-ADMIN` access group with the following roles will be created:
    ![acct_mgr](./images/accountmgr_roles.png)

3. Add IaaS permisions to at least one Account Manager user so that Kubernetes service in IAM can work

    ![classic-infra-settings](./images/classic-infra-settings.png)
    ![classic-devices-settings](./images/classic-devices-settings.png)

## Account Manager Tasks

Make sure you are logged in to proper cloud account:

```bash
ibmcloud login -sso
```
1. Create a `cloud-pak-sandbox.json` file with the following:

   ```json
   {
     "name": "cloud-pak-sandbox IAM setup",
     "type": [
       "terraform_v0.12"
     ],
     "description": "IBM Cloud Schematics Workspace to create cloud-pak-sandbox rg and ag",
     "tags": [
       "owner:$USER"
     ],
     "resource_group": "Default",
     "template_repo": {
       "url": "https://github.com/ibm-hcbt/acct-config-iam/tree/main/randagroups",
       "branch": "main"
     },
     "template_data": [
       {
         "folder": ".",
         "type": "terraform_v0.12",
         "variablestore": [
           {
             "name": "resource_group_name",
             "value": "cloud-pak-sandbox",
             "type": "string"
           },
           {
             "name": "admins_access_group_name",
             "value": "CLOUD-PAK-SANDBOX-ADMIN",
             "type": "string"
           },
           {
             "name": "users_access_group_name",
             "value": "CLOUD-PAK-SANDBOX-USER",
             "type": "string"
           },
           {
             "name": "sat_access_group_name",
             "value": "CLOUD-PAK-SANDBOX-SAT-ADMIN",
             "type": "string"
           }
         ]
       }
     ]
   }
   ```

2. To set up the cloud-pak-sandbox resource and access groups, run

   ```bash
   ./setup_account.sh cloud-pak-sandbox
   ```

    The `CLOUD-PAK-SANDBOX-ADMIN`, `CLOUD-PAK-SANDBOX-USER`, and `CLOUD-PAK-SANDBOX-SAT-ADMIN` access groups will be created 

3. The Account Manager that has Classic Infrastructure permissions needs to create Classic Infrastructure Keys:

    ```bash
   ibmcloud login -sso
   ibmcloud target -g <resource-group>
   ibmcloud regions
   ibmcloud ks api-key reset --region <region>
    ```

    Repeat these steps for each region and resource group that needs Classic Infrastructure permissions

    To see status of api key for a cluster:

    ```bash
    ibmcloud ks api-key info --cluster <cluster_name_or_ID>
    ```

4. Add users to the access groups

    - A user who needs to create or configure OpenShift clusters needs to belong to `CLOUD-PAK-SANDBOX-ADMIN`

    - A user who just needs cluster admin privileges needs to belong to `CLOUD-PAK-SANDBOX-USER`

    - Users that need additional privileges to manage Cloud Satellite need to belong to `CLOUD-PAK-SANDBOX-SAT-ADMIN`

5. Give support ticket access to ADMIN users:

    Add Access Groups: **Add cases and view orders**, **Edit cases**, and **View cases**.

    If those access groups aren't available, try [these](https://cloud.ibm.com/docs/containers?topic=containers-access_reference#infra) commands:

    ```bash
        ibmcloud sl user list
        ibmcloud sl user permission-edit <user_id> --permission TICKET_ADD --enable true
        ibmcloud sl user permission-edit <user_id> --permission TICKET_EDIT --enable true
        ibmcloud sl user permission-edit <user_id> --permission TICKET_VIEW --enable true
    ```

    NOTE: either account owner needs to do this or parent needs to have these permissions already.

    In addition, try the steps [here](https://cloud.ibm.com/docs/openshift?topic=openshift-cs_troubleshoot_clusters#cs_totp)

6. Enable [VRF](https://cloud.ibm.com/docs/account?topic=account-vrf-service-endpoint) on the account (Optional)

    ![enable-vrf](./images/enable-vrf.png)

