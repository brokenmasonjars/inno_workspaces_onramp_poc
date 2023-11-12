#
#  Subnet with default route to a NAT gateway located in a public subnet.
#  NACLs open to VPC CIDR, TCP and UDP Linux ephemeral port range to 0.0.0.0/0.
#  VPC Endpoints for S3 and DynamoDB
#

resource "aws_subnet" "workspaces" {
  for_each          = toset(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.settings[each.key]["cidr_workspaces"]
  availability_zone = each.key

  tags = merge(var.tags, { "Name" = "${var.settings["main"]["name"]}-${each.key}-workspaces" })
}

#
# Route Resources
#

resource "aws_route_table" "workspaces" {
  for_each = toset(var.availability_zones)
  vpc_id   = aws_vpc.vpc.id

  tags = merge(var.tags, { "Name" = "${var.settings["main"]["name"]}-${each.key}-workspaces" })
}

resource "aws_route_table_association" "workspaces" {
  for_each       = toset(var.availability_zones)
  subnet_id      = aws_subnet.workspaces[each.key].id
  route_table_id = aws_route_table.workspaces[each.key].id
}

resource "aws_route" "workspaces_nat_gw" {
  for_each               = toset(var.availability_zones)
  route_table_id         = aws_route_table.workspaces[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw[var.availability_zones[0]].id : aws_nat_gateway.nat_gw[each.key].id
}

#
# NACLs - rules should remain outside aws_network_acl to avoid resource number collisions
#

resource "aws_network_acl" "workspaces" {
  for_each   = toset(var.availability_zones)
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = tolist([aws_subnet.workspaces[each.key].id])

  tags = merge(var.tags, { "Name" = "${var.settings["main"]["name"]}-${each.key}-workspaces" })
}

# ingress rules
resource "aws_network_acl_rule" "workspaces_ingress100" {
  for_each       = toset(var.availability_zones)
  network_acl_id = aws_network_acl.workspaces[each.key].id
  egress         = false
  protocol       = "-1"
  rule_number    = 100
  rule_action    = "allow"
  cidr_block     = var.settings["main"]["cidr"]
  from_port      = 0
  to_port        = 0
}

# egress rules
resource "aws_network_acl_rule" "workspaces_egress100" {
  for_each       = toset(var.availability_zones)
  network_acl_id = aws_network_acl.workspaces[each.key].id
  egress         = true
  protocol       = "-1"
  rule_number    = 100
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
