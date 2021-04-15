echo "Enter resource group name: "
read RG_NAME
mkdir -p ./logs
echo "Creating workspace for schematics resource group"
ibmcloud schematics workspace new --file ${RG_NAME}.json --json > ./logs/${RG_NAME}.json
sleep 60
echo "Sleeping for 60 seconds"
WORKSPACE_ID=$(jq -r '.id' ./logs/${RG_NAME}.json) 

echo "Planning workspace"
ibmcloud schematics plan --id $WORKSPACE_ID     
echo "Sleeping for 2 minutes"
sleep 120

echo "Applying workspace
ibmcloud schematics apply --id $WORKSPACE_ID --force 
echo "Sleeping for 2 minutes"
sleep 120

