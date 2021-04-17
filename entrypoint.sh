#!/bin/bash
#
# Enclave startup script
#

cd /cloudwatch-enclave

echo -n "Start CloudWatch agent, Nginx and then Flask app      "
/opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent
