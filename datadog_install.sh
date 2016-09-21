#!/bin/bash

DD_API_KEY=$1

wget https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh
chmod 755 install_agent.sh
bash install_agent.sh
cp /etc/dd-agent/conf.d/kafka.yaml.example /etc/dd-agent/conf.d/kafka.yaml 
cp /etc/dd-agent/conf.d/zk.yaml.example /etc/dd-agent/conf.d/zk.yaml 
sed 's/api_key:.*/api_key: $DD_API_KEY/' /etc/dd-agent/datadog.conf
/etc/init.d/datadog-agent restart