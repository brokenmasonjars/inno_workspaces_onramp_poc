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
