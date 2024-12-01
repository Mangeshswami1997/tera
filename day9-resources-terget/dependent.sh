#!/bin/bash
resources=(
 
  "aws_iam_role.target_resources_using_loop"
  "aws_s3_bucket.lname2"
  # "aws_instance.lname3" 
  # "aws_instance.lname1"
  # "aws_iam_role_policy_attachment.tppolicy"
  

)

for resource in "${resources[@]}"; do
  targets+=" -target=$resource"
done
