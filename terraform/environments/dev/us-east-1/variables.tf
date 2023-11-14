########################################################
################## Account Variables ###################
########################################################

variable "account_id" {
  description = "The AWS Account ID"
  type        = string
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "environment_name" {
  description = "The environment name"
  type        = string
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
}


###################################
########## VPC Variables ##########
###################################

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_availability_zones" {
  description = "The availability zones for the VPC"
  type        = list(string)
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_az_1_subnet_cidr_blocks" {
  description = "Public subnet CIDR for the 1st AZ"
  type        = string
}

variable "private_az_1_subnet_cidr_blocks" {
  description = "Private subnet CIDR for the 1st AZ"
  type        = string
}

variable "data_az_1_subnet_cidr_blocks" {
  description = "Data subnet CIDR for the 1st AZ"
  type        = string
}

variable "workspace_az_1_subnet_cidr_blocks" {
  description = "Workspace subnet CIDR for the 1st AZ"
  type        = string
}

variable "public_az_2_subnet_cidr_blocks" {
  description = "Public subnet CIDR for the 2nd AZ"
  type        = string
}

variable "private_az_2_subnet_cidr_blocks" {
  description = "Private subnet CIDR for the 2nd AZ"
  type        = string
}

variable "data_az_2_subnet_cidr_blocks" {
  description = "Data subnet CIDR for the 2nd AZ"
  type        = string
}

variable "workspace_az_2_subnet_cidr_blocks" {
  description = "Workspace subnet CIDR for the 2nd AZ"
  type        = string
}

variable "flowlog_retention" {
  description = "Flow log retention in days"
  type        = number
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "domain_name_servers" {
  description = "Domain name servers"
  type        = list(string)
}


##########################################
########## AWS Backup Variables ##########
##########################################

variable "aws_backup_vault_name" {
  description = "The name of the AWS Backup Vault"
  type        = string
}

variable "completion_window_minutes" {
  description = "The amount of time AWS Backup attempts a backup before canceling the job and returning an error"
  type        = number
}

variable "start_window_minutes" {
  description = "The amount of time in minutes before beginning a backup"
  type        = number
}

variable "daily_cron" {
  description = "The cron expression for daily backups"
  type        = string
}

variable "daily_retention_days" {
  description = "The number of days to retain daily backups"
  type        = number
}

variable "aws_backup_tag_value" {
  description = "The tag value for AWS Backup"
  type        = string
}

##################################################
########## Directory Services Variables ##########
##################################################

########## Managed Active Directory Variables ##########

variable "mad_fqdn" {
  description = "The fully qualified domain name for the Managed Active Directory"
  type        = string
}

variable "mad_edition" {
  description = "The edition of the Managed Active Directory"
  type        = string
}

variable "mad_type" {
  description = "The type of the Managed Active Directory"
  type        = string
}

variable "mad_netbios" {
  description = "The NetBIOS name of the Managed Active Directory"
  type        = string
}

########### AD Connector Variables ###########

variable "ad_connector_name" {
  description = "The FQDN of the AD Connector"
  type        = string
}

variable "ad_connector_size" {
  description = "The size of the AD Connector, small or large"
  type        = string
}

variable "ad_connector_type" {
  description = "The type of the AD Connector"
  type        = string
}

variable "ad_connector_customer_dns_ips" {
  description = "The customer DNS IPs for the AD Connector"
  type        = list(string)
}

variable "ad_connector_customer_username" {
  description = "The customer username for the AD Connector"
  type        = string
}




#################################################
########### Secrets Manager Variables ###########
#################################################

variable "mad_secrets_manager_secret_name" {
  description = "The name of the Secrets Manager secret for the Managed Active Directory"
  type        = string
}

variable "ad_connector_secrets_manager_secret_name" {
  description = "The name of the Secrets Manager secret for the AD Connector"
  type        = string
}