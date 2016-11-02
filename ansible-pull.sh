#!/bin/bash
apt-get -y update
apt-get -y install git ansible
ansible-pull -U https://github.com/lwilts/azure-techtest.git -i hosts
