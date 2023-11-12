########## CloudTrail ##########

module "cloudtrail" {
  source      = "../../../modules/cloudtrail"
  name        = "cloudtrail-${data.aws_caller_identity.current.account_id}"
  bucket_name = "cloudtrail-${data.aws_caller_identity.current.account_id}"
}