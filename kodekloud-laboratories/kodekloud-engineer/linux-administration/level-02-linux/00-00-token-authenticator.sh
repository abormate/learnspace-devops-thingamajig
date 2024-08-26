#!/bin/bash

# Assume the role and capture the output
ROLE_OUTPUT=$(aws sts assume-role --duration-second 28800 \ 
     -- role-arn "arn:aws:iam::XXXXXXXXXXXX:role/XXXXXXXXX" \
     -- role-session-name k8s-session)

# Extract credentials from output
ACCESS_KEY_ID=$(echo $ROLE_OUTPUT | jq -r '.Credentials.AccessKeyId')
