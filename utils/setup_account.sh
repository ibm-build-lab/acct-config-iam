#!/bin/bash

SERVICE_ID=partner-sandbox-admin-id

if [[ $# -eq 0 ]]; then
        echo "Resource group required as argument.  Syntax 'setup_account.sh <resource_group>'" 1>&2
        exit 1
fi
RESOURCE_GROUP=$1
if [[ ! -f "$1.json" ]]; then
    echo "Existance of <resource-group>.json is required.  See test.json example" 1>&2
    exit 1
fi

echo "What is region 'ibmcloud regions' for api key: "
read REGION

mkdir -p ./logs
echo "Creating workspace for resource group"
ibmcloud schematics workspace new --file templates/${RESOURCE_GROUP}.json --json > ./logs/${RESOURCE_GROUP}.json
sleep 60
echo "Sleeping for 60 seconds"
WORKSPACE_ID=$(jq -r '.id' ./logs/${RESOURCE_GROUP}.json) 

echo "Planning workspace"
ibmcloud schematics plan --id $WORKSPACE_ID     
echo "Sleeping for 2 minutes"
sleep 120

echo "Applying workspace"
ibmcloud schematics apply --id $WORKSPACE_ID --force 
echo "Sleeping for 2 minutes"
sleep 120

ibmcloud target -g $RESOURCE_GROUP

ibmcloud iam service-api-key-create partner-sandbox-api-key $SERVICE_ID

# ibmcloud ks api-key reset --region $REGION
#ibmcloud ks credential set classic --infrastructure-api-key partner-sandbox-api-key --infrastructure-username $SERVICE_ID --region $REGION
