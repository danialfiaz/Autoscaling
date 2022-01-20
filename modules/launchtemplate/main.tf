resource "aws_launch_template" "ec2_launchtemp" {
  name                                 = "${terraform.workspace}-${var.name}"
  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.instance_behavior
  instance_type                        = var.instance_type
  vpc_security_group_ids               = [aws_security_group.autoscaling_SG.id]


  key_name = var.key_name

  # network_interfaces {
  #  associate_public_ip_address = var.ip_address
  #  security_groups             = [aws_security_group.autoscaling_SG.id]
  #  subnet_id                   = "[${var.subnet_id[0]},${var.subnet_id[1]},${var.subnet_id[2]}]"
  # }

  placement {
    availability_zone = var.instplace
    tenancy           = var.tenancytype
  }

  user_data = filebase64("${path.module}/templatefile/userdata.sh")
}


resource "aws_security_group" "autoscaling_SG" {
  name        = "${terraform.workspace}-${var.autoscalingSGname}"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "For SSH in ec2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description     = "For traffic inbound"
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    description     = "For traffic inbound"
    from_port       = 3000
    to_port         = 3000
    protocol        = "TCP"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    description     = "For HTTPS traffic inbound"
    from_port       = 443
    to_port         = 443
    protocol        = "TCP"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-autoscaling_SG"
  }
}
