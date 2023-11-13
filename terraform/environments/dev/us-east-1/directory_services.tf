##################################################
########## Directory Services Resources ##########
##################################################

#Managed Active Directory

resource "aws_directory_service_directory" "workspaces_mad" {
  name        = var.mad_fqdn
  password    = "${random_password.aws_directory_services_managed_ad_password.result}"
  edition     = var.mad_edition
  type        = var.mad_type
  short_name  = var.mad_netbios

  vpc_settings {
    vpc_id     = module.workspaces_vpc.id
    subnet_ids = [module.workspaces_vpc.private_subnet_ids["us-east-1c"], module.workspaces_vpc.private_subnet_ids["us-east-1d"]]
  }
}

##### AD Connector ######

resource "aws_directory_service_directory" "workspaces_ad_connector" {
  name     = "corp.notexample.com"
  password = "SuperSecretPassw0rd"
  size     = var.ad_connector_size
  type     = "ADConnector"

  connect_settings {
    customer_dns_ips  = ["A.B.C.D"]
    customer_username = "Admin"
    subnet_ids        = [module.workspaces_vpc.private_subnet_ids["us-east-1c"], module.workspaces_vpc.private_subnet_ids["us-east-1d"]]
    vpc_id            = module.workspaces_vpc.id
  }