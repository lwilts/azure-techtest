#!/bin/bash

# Deploy and configure Azure resources
azure group deployment create -f deploy.json -e params.json -g LWTechTest -n TechTestDeployment

# Get public IP and test load balance
publicIP=`azure network public-ip show LWTechTest LWTTPubIP --json | jq '.ipAddress'`
responseCode=`curl -s -o /dev/null -w "%{http_code}" http://$publicIP`
echo "Web app response code:"
echo $responseCode
