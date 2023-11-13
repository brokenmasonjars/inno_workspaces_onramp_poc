###############################
########## AWS Backup #########
###############################

module "aws_backups" {
  source                    = "../../../modules/backups/aws-backup"

  name                      = var.aws_backup_vault_name
  environment               = var.environment_name
  owner                     = var.owner

  kms_key_arn               = module.kms.backup_key_arn
  role_arn                  = module.iam_general.service_role_backup_arn

  completion_window_minutes = var.completion_window_minutes
  start_window_minutes      = var.start_window_minutes

  daily_retention_days      = var.daily_retention_days
  daily_cron                = var.daily_cron
  backup_tag_value          = var.aws_backup_tag_value
}