echo "What is resource group: "
read RESOURCE_GROUP
ibmcloud target -g $RESOURCE_GROUP
echo "What is region 'ibmcloud regions': "
read REGION

ibmcloud ks api-key reset --region $REGION
