#!/bin/bash

if [[ $# -eq 0 ]]; then
        echo "Resource group required as argument.  Syntax 'setup_account.sh <resource_group>'" 1>&2
        exit 1
fi
RESOURCE_GROUP=$1
if [[ ! -f "../templates/$1.json" ]]; then
    echo "Existance of ../templates/<resource-group>.json is required.  See test.json example" 1>&2
    exit 1
fi

mkdir -p ./logs
echo "Creating workspace for ${RESOURCE_GROUP} resource group"
ibmcloud schematics workspace new --file ../templates/${RESOURCE_GROUP}.json --json > ./logs/${RESOURCE_GROUP}.json
echo "Sleeping for 45 seconds"
sleep 45
WORKSPACE_ID=$(jq -r '.id' ./logs/${RESOURCE_GROUP}.json) 

echo "Planning workspace"
ibmcloud schematics plan --id $WORKSPACE_ID     
echo "Sleeping for 1 minute"
sleep 60

echo "Applying workspace"
ibmcloud schematics apply --id $WORKSPACE_ID --force 

echo "To see progress, login to cloud.ibm.com and go to: https://cloud.ibm.com/schematics/workspaces/$WORKSPACE_ID"
echo "Once there click 'Activity' on the left, then select 'View Log' from the 'Applying Plan' activity"
