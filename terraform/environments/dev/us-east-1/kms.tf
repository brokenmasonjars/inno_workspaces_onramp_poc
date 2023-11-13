#################################
######### KMS Keys ##############
#################################


module "kms" {
  source     = "../../../modules/kms"
  workspaces = true
  fsx        = true
  rds        = true
  ssm        = true
}