#!/bin/bash

# Assume the role and capture the output
ROLE_OUTPUT=$(aws sts assume-role --duration-second 28800 \ 
     -- role-arn "arn:aws:iam::XXXXXXXXXXXX:role/XXXXXXXXX" \
     -- role-session-name eks-session)

     