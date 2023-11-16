#####################################
########## Security Groups ##########
#####################################

########## FSx Security Group ##########

resource "aws_security_group" "fsx_sg" {
  description = "Security Group for the FSx for Windows File Server"
  name        = "FSx_SG"
  tags        = { "Name" = "FSx_SG" }
  vpc_id      = module.workspaces_vpc.id

  ingress {
    cidr_blocks = [module.workspaces_vpc.cidr]
    description = "Allow SMB Traffic from within VPC"
    from_port   = 445
    protocol    = "tcp"
    to_port     = 445
  }
  ingress {
    cidr_blocks = [module.workspaces_vpc.cidr]
    description = "Allows access to PowerShell port from within VPC"
    from_port   = 5985 
    protocol    = "tcp"
    to_port     = 5985 
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

resource "aws_security_group" "vpc_endpoint_sg" {
  description = "Security Group for VPC endpoints"
  name        = "VPCEndpoint_SG"
  tags        = { "Name" = "VPCEndpoint_SG" }
  vpc_id      = module.workspaces_vpc.id
  ingress {
    cidr_blocks = [module.workspaces_vpc.cidr]
    description = "Allow all traffic from within VPC"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}