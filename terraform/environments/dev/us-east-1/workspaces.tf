################################
########## Workspaces ##########
################################


resource "aws_workspaces_directory" "workspaces_directory" {
  directory_id = aws_directory_service_directory.workspaces_ad_connector.id
  subnet_ids = [ module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)], module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_2)]]

  

  self_service_permissions {
    change_compute_type  = var.workspaces_self_service_permissions_change_compute_type
    increase_volume_size = var.workspaces_self_service_permissions_increase_volume_size
    rebuild_workspace    = var.workspaces_self_service_permissions_rebuild_workspace
    restart_workspace    = var.workspaces_self_service_permissions_restart_workspace
    switch_running_mode  = var.workspaces_self_service_permissions_switch_running_mode
  }

  workspace_access_properties {
    device_type_android    = var.workspaces_access_properties_device_type_android
    device_type_chromeos   = var.workspaces_access_properties_device_type_chromeos
    device_type_ios        = var.workspaces_access_properties_device_type_ios
    device_type_linux      = var.workspaces_access_properties_device_type_linux
    device_type_osx        = var.workspaces_access_properties_device_type_osx
    device_type_web        = var.workspaces_access_properties_device_type_web
    device_type_windows    = var.workspaces_access_properties_device_type_windows
  }

workspace_creation_properties {
    custom_security_group_id            = aws_security_group.workspaces_sg.id
    default_ou                          = var.workspaces_creation_properties_default_ou
    enable_internet_access              = var.workspaces_creation_properties_enable_internet_access
    enable_maintenance_mode             = var.workspaces_creation_properties_enable_maintenance_mode
    user_enabled_as_local_administrator = var.workspaces_creation_properties_user_enabled_as_local_administrator
  }

  depends_on = [
    aws_iam_role_policy_attachment.workspaces_default_service_access,
    aws_iam_role_policy_attachment.workspaces_default_self_service_access
  ]
}

