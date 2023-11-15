# inno_workspaces_onramp_poc


- [Overview](#Overview)
  - [Deployment](#Deployment)
  - [NACLs](#nacls)
  - [Minimum Required Configuration](#minimum-required-configuration)
  - [Inputs and Outputs](#inputs-and-outputs)
    - [Inputs](#inputs)
    - [Outputs](#outputs)

# Overview

This code will create the underlying infrastructure for the inno_workspaces_onramp_poc project.  This creates the networking infrastructure which includes a VPC, subnets, and security groups.  It also creates the IAM roles and policies required for the project.
For the Active directory components you will have a choice of using Managed AD Standard or an AD Connector for customer self managed Active Directory.  AWS Secrets will be used to store passwords which will be retrieved by Terraform.

For the WorkSpaces components there will be two options for either the managed AD or AD connector for registration, lastly an FSx share will be created for storing user profiles and department shares.

## Deployment
Initially the workspaces.tf, and directory.tf will be commented out.  This is to allow the base infrastructure to be created, and any updates on passwords stored in secrets manager for the AD Connector and FSx credentials share can be updated.  This would apply to a self managed AD.

The terraform.tfvars file will contain all the variables that you will need to update for your environment. These include:

* Account, customer, and region variables
* VPC variables
* AWS Backup variables
* Directory Service Managed AD variables
* Directory Service AD Connector variables
* AWS Secrets Manager variables
* FSx variables
