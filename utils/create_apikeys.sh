#!/bin/bash

RESOURCE_GROUP=$1
REGION=$2
SERVICE_ID=partner-sandbox-admin-id
ibmcloud login -sso -g $RESOURCE_GROUP
ibmcloud ks api-key reset --region $REGION
export SERVICEID_API_KEY=$(ibmcloud iam service-api-key-create partner-sandbox-api-key $SERVICE_ID --file serviceid-api-key.json -d "API key for partner sandbox service ID"| awk '/API Key/{print $3}') 
echo "Service ID API Key: $SERVICEID_API_KEY"
ibmcloud login --apikey $SERVICEID_API_KEY -g $RESOURCE_GROUP
ibmcloud ks api-key reset --region $REGION
