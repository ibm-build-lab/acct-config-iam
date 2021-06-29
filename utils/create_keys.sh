echo "What is resource group: "
read RESOURCE_GROUP
ibmcloud target -g $RESOURCE_GROUP
echo "What is region 'ibmcloud regions': "
read REGION

IC_API_KEY=$(ibmcloud iam api-key-create classic-infra-key | awk '/API/{print $3}') 

ibmcloud ks api-key reset --region $REGION
# ibmcloud ks credential set classic --infrastructure-api-key partner-sandbox-api-key --infrastructure-username $SERVICE_ID --region $REGION
