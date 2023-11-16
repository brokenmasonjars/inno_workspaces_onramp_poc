##################################################
########## Directory Services Resources ##########
##################################################

########## Managed Active Directory ##########
##### Uncomment if customer is using Managed Active Directory #####

resource "aws_directory_service_directory" "workspaces_mad" {
  name        = var.mad_fqdn
  password    = "${random_password.aws_directory_services_managed_ad_password.result}"
  edition     = var.mad_edition
  type        = var.mad_type
  short_name  = var.mad_netbios

  vpc_settings {
    vpc_id     = module.workspaces_vpc.id
    subnet_ids = [module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)], module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_2)]]
  }
}

##### AD Connector ######

data "aws_secretsmanager_secret" "ad_connector_credentials" {
  name = var.ad_connector_secrets_manager_secret_name
}

data "aws_secretsmanager_secret_version" "ad_connector_credentials_version" {
  secret_id = data.aws_secretsmanager_secret.ad_connector_credentials.id
}

resource "aws_directory_service_directory" "workspaces_ad_connector" {
  name     = var.ad_connector_name
  password = jsondecode(data.aws_secretsmanager_secret_version.ad_connector_credentials_version.secret_string)["password"]
  size     = var.ad_connector_size
  type     = var.ad_connector_type

  connect_settings {
    customer_dns_ips  = var.ad_connector_customer_dns_ips
    customer_username = jsondecode(data.aws_secretsmanager_secret_version.ad_connector_credentials_version.secret_string)["username"]
    subnet_ids        = [module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)], module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_2)]]
    vpc_id            = module.workspaces_vpc.id
  }
}