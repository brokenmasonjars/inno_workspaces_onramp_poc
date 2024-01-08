########## Transit Gateway ##########


##### Transit Gateway Setup #####
module "tgw01" {
  source = "../../../modules/transit-gateway"
  name   = "tgw01"
}

##### Transit Gateway Attachments #####

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc01" {
  subnet_ids         = [module.workspaces_vpc.data_subnet_ids.[(var.vpc_availability_zone_1)], module.workspaces_vpc.data_subnet_ids.[(var.vpc_availability_zone_2)]]
  transit_gateway_id = module.tgw01.id
  vpc_id             = module.workspaces_vpc.id
}