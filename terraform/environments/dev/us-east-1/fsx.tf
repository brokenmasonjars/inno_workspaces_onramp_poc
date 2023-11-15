####################################
######### FSx for Windows ##########
####################################


# resource "aws_fsx_windows_file_system" "fsx" {
#   active_directory_id = var.fsx_active_directory_id
#   kms_key_id          = var.fsx_kms_key_arn
#   storage_capacity    = var.fsx_storage_capacity
#   subnet_ids          = var.fsx_subnet_ids
#   throughput_capacity = var.fsx_throughput_capacity
#   security_group_ids  = 

#   self_managed_active_directory {
#     dns_ips     = var.fsx_self_managed_active_directory_dns_ips
#     domain_name = var.fsx_domain_name
#     password    = var.fsx_self_managed_active_directory_password
#     username    = var.fsx_self_managed_active_directory_username
#   }