###################################
########## EC2 Resources ##########
###################################

data "aws_ami" "windows" {
     most_recent = true     
filter {
       name   = "name"
       values = ["Windows_Server-2022-English-Full-Base-*"]  
  }     
filter {
       name   = "virtualization-type"
       values = ["hvm"]  
  }     
owners = ["801119661308"] # Canonical
}

module "ec2_example" {
  source = "../../../modules/ec2/instance"
  
  ami                  = data.aws_ami.windows.id
  key_name             = var.ec2_key_name
  instance_type        = var.ec2_utility_server_instance_type
  iam_instance_profile = module.iam_general.profile_ec2_ssm_vss_arn

  root_block_device = [{
    encrypted   = true
    kms_key_id  = module.kms.ebs_key_arn
    volume_type = "gp3"
    volume_size = 50
  }]

  subnet_id              = module.workspaces_vpc.private_subnet_ids[(var.vpc_availability_zone_1)]
  vpc_security_group_ids = [aws_security_group.ec2_utility_server_sg.id]

  tags = {
    Name = var.ec2_utility_server_name
  }
}
