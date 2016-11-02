# Azure Technical Assessment
My attempt to carry out the Azure flavour of the DevOps technical test.

## Usage
`./deploy.sh`

## Prerequisites
1. Azure CLI is installed and configured with credentials
2. Resource group 'LWTechTest' is created
3. jq is installed locally

## Outcome
1. Azure resources are deployed (load balancer, two VMs and supporting infrastructure)
2. The script 'ansible-pull.sh' is run on each VM, which pulls this repo and runs the local.yml playbook. This installs and configures nginx, MySQL and PHP, and creates the simple web page
3. The load balancer public IP is then cUrled and the status code printed.

## Details
The deploy script runs the folling command:

`azure group deployment create -f deploy.json -e params.json -g LWTechTest -n TechTestDeployment`

This uses the resource template 'deploy.json' to provision Azure resources, including
* Storage account
* Availability set
* Public IP address
* Virtual network
* Network interfaces
* Load balancer
* Virtual machines
* VM extensions to run the ansible-pull script

The Ansible playbook installs the LEMP stack and places the web page on the server. `ansible-pull` is used over the standard 'push' model of Ansible to allow the web servers to remain inaccessible from the internet. An improvement could be to provision an additional VM as a config management host, and run Ansible from there. This VM could be accessible from the internet and used as a bastion host.
