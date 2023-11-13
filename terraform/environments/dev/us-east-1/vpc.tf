###################################
########## VPC Resources ##########
###################################

# Here is a link to the list of Availability Zones that support WorkSpaces:
# https://docs.aws.amazon.com/workspaces/latest/adminguide/azs-workspaces.html
# Use only the Availability Zones that are listed in the link above.

module "workspaces_vpc" {
  source             = "../../../modules/vpc"
  availability_zones = var.vpc_availability_zones
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
    us-east-1c = {
      cidr_public     = var.public_az_1_subnet_cidr_blocks
      cidr_private    = var.private_az_1_subnet_cidr_blocks
      cidr_workspaces = var.workspace_az_1_subnet_cidr_blocks
      cidr_data       = var.data_az_1_subnet_cidr_blocks
    }
    us-east-1d = {
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



# module "vpc" {
#   source             = "../../../modules/vpc"
#   availability_zones = var.vpc_availability_zones
#   settings = {
#     main = {
#       name   = var.vpc_name
#       cidr   = var.vpc_cidr_block
#       region = var.region
#     }
#     us-east-1c = {
#       cidr_public  = var.public_az_1_subnet_cidr_blocks
#       cidr_private = var.private_az_1_subnet_cidr_blocks
#       cidr_data    = var.data_az_1_subnet_cidr_blocks
#     }
#     us-east-1d = {
#       cidr_public  = var.public_az_2_subnet_cidr_blocks
#       cidr_private = var.private_az_2_subnet_cidr_blocks
#       cidr_data    = var.data_az_2_subnet_cidr_blocks
#     }
    
#     expand_ephemeral_port_range = true
    
#     flowlog_retention           = var.flowlog_retention
#     domain_name                 = var.domain_name
#     domain_name_servers         = var.domain_name_servers

#   }
#   tags = {
#     environment = var.environment_name
#     owner       = var.owner
#     managed-by  = "Terraform"
#   }
# }