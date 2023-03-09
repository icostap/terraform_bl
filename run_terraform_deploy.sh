#!/usr/bin/env sh

set -e
#set -x

########################################################
DATACENTER="leumi"

ACTION=$1

if [ $ACTION = "deploy" ]; then
    echo "Start Platform Deployment ...."
    echo "=============terraform init=================="
    terraform init
    echo "=============terraform plan=================="
    terraform plan -var datacenter=${DATACENTER} -refresh=true -out=./plan_output
    echo "=============terraform apply=================="
    terraform apply -auto-approve ./plan_output

elif [ $ACTION = "destroy" ]; then
    echo "Destroy Platform ...."
    echo "=============terraform init=================="
    terraform init
    echo "=============terraform plan=================="
    terraform plan -var datacenter=${DATACENTER} -refresh=true -out=./plan_output
    echo "=============terraform Destroy=================="
    terraform destroy -var datacenter=${DATACENTER} -auto-approve
else
    echo "\n>>> ERROR: action param is not valid <<<"
    exit 1
fi





#
