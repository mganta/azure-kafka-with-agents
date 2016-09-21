#!/bin/bash

export DD_API_KEY=$1

#wget https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh
#$chmod 755 install_agent.sh
#./install_agent.sh

sudo apt-get update
sudo apt-get install -y  apt-transport-https

echo 'deb https://apt.datadoghq.com/ stable main' > /etc/apt/sources.list.d/datadog.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7A7DA52

apt-get  update
apt-get install -y datadog-agent
sed 's/api_key:.*/api_key: ${DD_API_KEY}/' /etc/dd-agent/datadog.conf.example  > /etc/dd-agent/datadog.conf"
cp /etc/dd-agent/conf.d/kafka.yaml.example /etc/dd-agent/conf.d/kafka.yaml 
cp /etc/dd-agent/conf.d/zk.yaml.example /etc/dd-agent/conf.d/zk.yaml 
#sed 's/api_key:.*/api_key: $DD_API_KEY/' /etc/dd-agent/datadog.conf
/etc/init.d/datadog-agent restart