echo "What is resource group: "
read RESOURCE_GROUP
ibmcloud target -g $RESOURCE_GROUP
echo "What is region 'ibmcloud regions': "
read REGION

# ibmcloud ks api-key reset --region $REGION
ibmcloud iam service-api-key-update admin-acct-id-api-key admin-acct-id
ibmcloud ks credential set classic --infrastructure-api-key KEY --infrastructure-username admin-acct-id --region $REGION