echo "Enter resource group name: "
read RESOURCE_GROUP
mkdir -p ./logs
echo "Creating workspace for schematics resource group"
ibmcloud schematics workspace new --file ${RESOURCE_GROUP}.json --json > ./logs/${RESOURCE_GROUP}.json
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

