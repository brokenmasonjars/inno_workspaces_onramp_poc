#############################################
########## Secrets Manager Secrets ##########
#############################################

########## Managed Active Directory Secrets ##########
resource "random_password" "aws_directory_services_managed_ad_password" {
  length           = 24
  special          = true
  override_special = "_.$&@"
}

resource "aws_secretsmanager_secret" "aws_directory_services_managed_ad_password" {
  name = var.mad_secrets_manager_secret_name
}

resource "aws_secretsmanager_secret_version" "managed_ad_credentials" {
  secret_id     = aws_secretsmanager_secret.aws_directory_services_managed_ad_password.id
  secret_string = <<EOF
{
  "username": "admin",
  "password": "${random_password.aws_directory_services_managed_ad_password.result}"
}
EOF
}

########## AD Connector Secrets ##########


resource "aws_secretsmanager_secret" "aws_directory_services_ad_connector_password" {
  name = var.ad_connector_secrets_manager_secret_name
}

resource "aws_secretsmanager_secret_version" "ad_connector_credentials" {
  secret_id     = aws_secretsmanager_secret.aws_directory_services_ad_connector_password.id
  secret_string = <<EOF
  {
  "username": "svc_ad_connector",
  "password": ""
  }
  EOF
}