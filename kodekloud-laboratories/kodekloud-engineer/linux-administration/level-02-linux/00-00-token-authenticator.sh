#!/bin/bash

# Assume the role and capture the output
ROLE_OUTPUT=$(aws sts assume-role --duration-second 28800 \ 
     -- role-arn "arn:aws:iam::XXXXXXXXXXXX:role/XXXXXXXXX" \
     -- role-session-name k8s-session)

# Extract credentials from output
ACCESS_KEY_ID=$(echo $ROLE_OUTPUT | jq -r '.Credentials.AccessKeyId')
SECRET_ACCESS_KEY=$(echo $ROLE_OUTPUT | jq -r '.Credentials.SecretAccessKey')
SESSION_TOKEN=$(echo $ROLE_OUTPUT | jq -r '.Credentials.SessionToken')

# Configure the AWS CLI profile for credentials
aws configure set aws_access_key_id "$ACCESS_KEY_ID" --profile k8s-role
aws configure set aws_secret_access_key "$SECRET_ACCESS_KEY" --profile k8s-role
aws configure set aws_session_token "$SESSION_TOKEN" --profile k8s-role



