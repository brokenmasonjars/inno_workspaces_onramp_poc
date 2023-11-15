data "aws_subnet" "parent_vpc" {
  id = var.subnet_ids[0]
}

resource "aws_fsx_windows_file_system" "fsx" {
  active_directory_id = var.fsx_active_directory_id
  kms_key_id          = var.fsx_kms_key_arn
  storage_capacity    = var.fsx_storage_capacity
  subnet_ids          = var.fsx_subnet_ids
  throughput_capacity = var.fsx_throughput_capacity

  self_managed_active_directory {
    dns_ips     = var.fsx_self_managed_active_directory_dns_ips
    domain_name = var.fsx_domain_name
    password    = var.fsx_self_managed_active_directory_password
    username    = var.fsx_self_managed_active_directory_username
  }



  tags = merge(var.tags, { "Name" = var.name })
}

resource "aws_efs_mount_target" "mt" {
  for_each        = toset(var.subnet_ids)
  file_system_id  = aws_efs_file_system.fs.id
  subnet_id       = each.key
  security_groups = concat(var.security_group_ids, [aws_security_group.default.id])
}

resource "aws_security_group" "default" {
  name_prefix = "${var.name}-fsx-sg"
  description = "FSx-SG"
  vpc_id      = module.VPC.id

  tags = merge(var.tags, { "Name" = var.name })
}

resource "aws_security_group_rule" "ingress_fsx" {
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidrs
  security_group_id = aws_security_group.default.id
  description       = "EFS"
}
