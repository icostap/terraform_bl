
----------------BANK LEUMI Exercise------------------

Platform deployment description:
================================
1) VPC with 2 public subnet on each AZ
2) Deploy to public subnet EC2 with elastic IP
3) NLB as GW for external access, only Bank Leumi IP is whitelist

Setup:
======
Deployment was done to private AWS account using AWS access keys
In order to deploy to your own AWS account, please configure AWS access key and secret.
TBD: Make AWS ACCOUNT and REGION AMIS more flexible 

Execute Deployment:
====================
To Deploy platform, From root working directoty run:
./run_terraform_deploy.sh deploy

To Destroy platform, From root working directoty run:
./run_terraform_deploy.sh destroy

Note: at run_terraform_deploy.sh you can define the datacenter prefix that will be added to all resources

