#############################################
########## Secrets Manager Secrets ##########
#############################################


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
  "password": "${random_password.aws_directory_services_managed_ad_password.result}",
}
EOF
}