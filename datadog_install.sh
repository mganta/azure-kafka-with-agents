#!/bin/bash

export DD_API_KEY=$1

wget https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh
chmod 755 install_agent.sh
./install_agent.sh
cp /etc/dd-agent/conf.d/kafka.yaml.sample /etc/dd-agent/conf.d/kafak.yaml 
cp /etc/dd-agent/conf.d/zookeeper.yaml.sample /etc/dd-agent/conf.d/zookeeper.yaml 
#sed 's/api_key:.*/api_key: $DD_API_KEY/' /etc/dd-agent/datadog.conf
/etc/init.d/datadog-agent restart
