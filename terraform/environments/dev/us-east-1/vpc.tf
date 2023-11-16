###################################
########## VPC Resources ##########
###################################

# Here is a link to the list of Availability Zones that support WorkSpaces:
# https://docs.aws.amazon.com/workspaces/latest/adminguide/azs-workspaces.html
# Use only the Availability Zones that are listed in the link above.

module "workspaces_vpc" {
  source             = "../../../modules/vpc"
  availability_zones = [(var.vpc_availability_zone_1),(var.vpc_availability_zone_2)]
  expand_ephemeral_port_range = true
  flowlog_retention = var.flowlog_retention
  domain_name = var.domain_name
  domain_name_servers = var.domain_name_servers

  settings = {
    main = {
      name   = var.vpc_name
      cidr   = var.vpc_cidr_block
      region = var.region
    }
    (var.vpc_availability_zone_1) = {
      cidr_public     = var.public_az_1_subnet_cidr_blocks
      cidr_private    = var.private_az_1_subnet_cidr_blocks
      cidr_workspaces = var.workspace_az_1_subnet_cidr_blocks
      cidr_data       = var.data_az_1_subnet_cidr_blocks
    }
    (var.vpc_availability_zone_2) = {
      cidr_public     = var.public_az_2_subnet_cidr_blocks
      cidr_private    = var.private_az_2_subnet_cidr_blocks
      cidr_workspaces = var.workspace_az_2_subnet_cidr_blocks
      cidr_data       = var.data_az_2_subnet_cidr_blocks
    }
  }


  tags = {
    environment = var.environment_name
    owner       = var.owner
    managed-by  = "Terraform"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = module.workspaces_vpc.id
  service_name      = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.vpc_endpoint_sg.id
  ]

  private_dns_enabled = true

}