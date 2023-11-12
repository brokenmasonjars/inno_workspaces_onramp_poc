#####################################
########## AWS Config ###############
#####################################

module "config" {
  source = "../../../modules/config"
  bucket_name = "config-${data.aws_caller_identity.current.account_id}"
}