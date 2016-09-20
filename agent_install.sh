#!/bin/bash

export DD_API_KEY=$1

curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh
./install_agent.sh
#sed 's/api_key:.*/api_key: $DD_API_KEY/' /etc/dd-agent/datadog.conf
/etc/init.d/datadog-agent restart
