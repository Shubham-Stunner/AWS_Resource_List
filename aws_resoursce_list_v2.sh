#!/bin/bash

######################################################
# AWS Resource Listing Script
# Author: Shubham Mukherjee
# Version: v0.02
######################################################

# Check arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service>"
    echo "Example: $0 us-east-1 ec2"
    exit 1
fi

aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]') #replaces Capital letters into small as AWS services are case-sensitive

# Check AWS CLI
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed."
    exit 1
fi

# Check AWS Configuration
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured."
    exit 1
fi

case $aws_service in

ec2)
    echo "===== EC2 Instances ====="
    aws ec2 describe-instances \
    --region "$aws_region" \
    --query "Reservations[].Instances[].[
        InstanceId,
        InstanceType,
        State.Name,
        PublicIpAddress,
        PrivateIpAddress
    ]" \
    --output table
    ;;

rds)
    echo "===== RDS Databases ====="
    aws rds describe-db-instances \
    --region "$aws_region" \
    --query "DBInstances[].[
        DBInstanceIdentifier,
        Engine,
        DBInstanceStatus,
        Endpoint.Address
    ]" \
    --output table
    ;;

s3)
    echo "===== S3 Buckets ====="
    aws s3api list-buckets \
    --query "Buckets[].[
        Name,
        CreationDate
    ]" \
    --output table
    ;;

cloudfront)
    echo "===== CloudFront Distributions ====="
    aws cloudfront list-distributions \
    --query "DistributionList.Items[].[
        Id,
        DomainName,
        Status
    ]" \
    --output table
    ;;

vpc)
    echo "===== VPCs ====="
    aws ec2 describe-vpcs \
    --region "$aws_region" \
    --query "Vpcs[].[
        VpcId,
        CidrBlock,
        State
    ]" \
    --output table
    ;;

iam)
    echo "===== IAM Users ====="
    aws iam list-users \
    --query "Users[].[
        UserName,
        Arn,
        CreateDate
    ]" \
    --output table
    ;;

route53)
    echo "===== Route53 Hosted Zones ====="
    aws route53 list-hosted-zones \
    --query "HostedZones[].[
        Name,
        Id,
        ResourceRecordSetCount
    ]" \
    --output table
    ;;

cloudwatch)
    echo "===== CloudWatch Alarms ====="
    aws cloudwatch describe-alarms \
    --region "$aws_region" \
    --query "MetricAlarms[].[
        AlarmName,
        StateValue,
        MetricName
    ]" \
    --output table
    ;;

cloudformation)
    echo "===== CloudFormation Stacks ====="
    aws cloudformation describe-stacks \
    --region "$aws_region" \
    --query "Stacks[].[
        StackName,
        StackStatus,
        CreationTime
    ]" \
    --output table
    ;;

lambda)
    echo "===== Lambda Functions ====="
    aws lambda list-functions \
    --region "$aws_region" \
    --query "Functions[].[
        FunctionName,
        Runtime,
        LastModified
    ]" \
    --output table
    ;;

sns)
    echo "===== SNS Topics ====="
    aws sns list-topics \
    --query "Topics[].TopicArn" \
    --output table
    ;;

sqs)
    echo "===== SQS Queues ====="
    aws sqs list-queues \
    --region "$aws_region" \
    --query "QueueUrls[]" \
    --output table
    ;;

dynamodb)
    echo "===== DynamoDB Tables ====="
    aws dynamodb list-tables \
    --region "$aws_region" \
    --query "TableNames[]" \
    --output table
    ;;

ebs)
    echo "===== EBS Volumes ====="
    aws ec2 describe-volumes \
    --region "$aws_region" \
    --query "Volumes[].[
        VolumeId,
        Size,
        State,
        AvailabilityZone
    ]" \
    --output table
    ;;

*)
    echo "Invalid service."
    echo "Supported services:"
    echo "ec2 rds s3 cloudfront vpc iam route53 cloudwatch cloudformation lambda sns sqs dynamodb ebs"
    exit 1
    ;;
esac
