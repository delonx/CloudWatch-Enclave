#!/bin/bash
#
# Enclave startup script
#

echo -n "Start CloudWatch agent      "
/opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent
