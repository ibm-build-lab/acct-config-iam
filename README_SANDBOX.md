# Steps to set up a Partner Sandbox account

Clone this repo and cd into acct-config-iam

## Account Owner Tasks

1. Create IBM Cloud Account for partner

2. Create the access group and users for Account Managers

    - Uncomment and add list of Account Manager users to this [terraform.tfvars](./acctmgrs/acctmgrgroup/terraform.tfvars) file
    
    - Run scripts from `https://github.com/ibm-hcbt/acct-config-iam/tree/main/examples/acctmgrs` either using [Schematics](./examples/README.md#run-from-a-schematics-workspace) or local [Terraform](./examples/README.md#run-from-local-terraform-client) client. If using schematics, create and apply new workspace in the `Default` resource group.

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

1. To initially set up the account run:

   ```bash
   cd utils
   ./setup_account.sh cloud-pak-sandbox
   ```

   This will create
   - the `cloud-pak-sandbox` resource group
   - a service id called `partner-sandbox-admin-id`
   - the `CLOUD-PAK-SANDBOX-ADMIN`,
         `CLOUD-PAK-SANDBOX-USER`, `CLOUD-PAK-SANDBOX-SERVICEID` and `CLOUD-PAK-SANDBOX-SAT-ADMIN` access groups
   - an api key for the service id

2. To create additional resource groups with access groups

   ```bash
   cd templates
   cp cloud-pak-sandbox-ibm.json <new resource group>.json
   ```
   
   Make sure that this new template points to the [partner-sandbox-randagroups](https://github.com/ibm-hcbt/acct-config-iam/tree/main/examples/partner-sandbox-randagroups) repo for its source and rename it to the new resource group name.  Then do the following:

   ```bash
   cd utils
   ./create_rg_ag.sh <new resource group>
   ibmcloud login --apikey $SERVICEID_API_KEY -g <new resource group>
   ibmcloud ks api-key reset --region $REGION
   ```

3. Create an API key for Classic Infrastructure permissions for users that need it:

   ```bash
   ibmcloud ks credential set classic --infrastructure-api-key KEY --infrastructure-username USERNAME --region REGION
   ```

4. Add users to the access groups

   External users need to register for cloud accounts [here](https://cloud.ibm.com/registration)

    - A user who needs to create or configure OpenShift clusters needs to belong to `-ADMIN`

    - A user who just needs cluster admin privileges needs to belong to `-USER`

    - Users that need additional privileges to manage Cloud Satellite need to belong to `-SAT-ADMIN`

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

6. **Optional** If partner wants to enable [VRF](https://cloud.ibm.com/docs/account?topic=account-vrf-service-endpoint) on the account:

    ![enable-vrf](./images/enable-vrf.png)
