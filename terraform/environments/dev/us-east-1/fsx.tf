####################################
######### FSx for Windows ##########
####################################

########## FSx for Windows File System Managed AD ##########

# resource "aws_fsx_windows_file_system" "fsx_managed_ad" {
#   active_directory_id = aws_directory_service_directory.workspaces_mad.id
#   kms_key_id          = module.kms.fsx_key_arn
#   storage_capacity    = var.fsx_storage_capacity
#   subnet_ids          = [module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)], module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_2)]]
#   throughput_capacity = var.fsx_throughput_capacity
#   security_group_ids  = [aws_security_group.fsx_sg.id]
#   deployment_type     = var.fsx_deployment_type
#   preferred_subnet_id = module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)]
#  # aliases             = var.fsx_aliases
#   tags = {
#     Name = var.fsx_name
#   }
# }

########## FSx for Windows File System For AD Connector ##########

# data "aws_secretsmanager_secret" "fsx_self_managed_ad" {
#   name = var.fsx_self_managed_ad_secrets_manager_secret_name
# }

# data "aws_secretsmanager_secret_version" "fsx_self_managed_ad" {
#   secret_id = data.aws_secretsmanager_secret.fsx_self_managed_ad.id
# }
# resource "aws_fsx_windows_file_system" "fsx_self_managed_ad" {

#   kms_key_id          = module.kms.fsx_key_arn
#   storage_capacity    = var.fsx_storage_capacity
#   subnet_ids          = [module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)], module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_2)]]
#   preferred_subnet_id = module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)]
#   throughput_capacity = var.fsx_throughput_capacity
#   deployment_type     = var.fsx_deployment_type
#   security_group_ids  = [aws_security_group.fsx_sg.id]
# #  aliases             = var.fsx_aliases

#   self_managed_active_directory {
#     dns_ips     = var.domain_name_servers
#     domain_name = var.domain_name
#     password    = jsondecode(data.aws_secretsmanager_secret_version.ad_connector_credentials_version.secret_string)["password"]
#     username    = jsondecode(data.aws_secretsmanager_secret_version.ad_connector_credentials_version.secret_string)["username"]
#   }
# }