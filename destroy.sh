#!/bin/bash

# EKS Infrastructure Destroy Script
set -e

echo "🚨 EKS Infrastructure Destruction Script"
echo "========================================"

# Check if ansible-playbook is available
if ! command -v ansible-playbook &> /dev/null; then
    echo "❌ ansible-playbook not found. Please install Ansible."
    exit 1
fi

# Default values
ENV_NAME="${1:-uat-edfx}"
AWS_REGION="${2:-us-east-2}"

echo "Environment: $ENV_NAME"
echo "Region: $AWS_REGION"
echo ""

# Run destroy playbook
echo "🚀 Starting infrastructure destruction..."
ansible-playbook cleanup.yml \
    -e "env_name=$ENV_NAME" \
    -e "aws_region=$AWS_REGION" \
    -e "require_confirmation=false"

echo "✅ Destruction completed!"