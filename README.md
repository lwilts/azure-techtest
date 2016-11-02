# Azure Technical Assessment
My attempt to carry out the Azure flavour of the DevOps technical test.

## Usage
./deploy.sh

## Prerequisites
1. Azure CLI is installed and configured with credentials
2. Resource group 'LWTechTest' is created
3. jq is installed locally

## Outcome
1. Azure resources are deployed (load balancer, two VMs and supporting infrastructure)
2. The script 'ansible-pull.sh' is run on each VM, which pulls this repo and runs the local.yml playbook. This installs and configures nginx, MySQL and PHP, and creates the simple web page
3. The load balancer public IP is then cUrled and the status code printed.
