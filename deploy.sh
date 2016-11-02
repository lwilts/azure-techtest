#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "Usage: deploy.sh ResourceGroupName"
fi
# Deploy and configure Azure resources
azure group deployment create -f deploy.json -e params.json -g $1 -n TechTestDeployment

# Get public IP and test load balance
publicIP=`azure network public-ip show $1 TTPubIP --json | jq -r '.ipAddress'`
echo Public IP:
echo $publicIP
responseCode=`curl -s -o /dev/null -w "%{http_code}" http://$publicIP`
echo "Response code:"
echo $responseCode
