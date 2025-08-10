# Create key pair in default region
resource "aws_key_pair" "default_region_key" {
  key_name   = "my_key"
  public_key = "public -key"
}

# Create key pair in second region
resource "aws_key_pair" "useast_region_key" {
  provider   = aws.useast
  key_name   = "my_key"
  public_key = "public -key"
}

# Loop over instances in default region
resource "aws_instance" "default_region_servers" {
  for_each = var.instances

  ami                    = var.ami_ids["eu-west-1"]
  instance_type          = each.value
  key_name               = aws_key_pair.default_region_key.key_name
  vpc_security_group_ids = [aws_security_group.default_region_sg.id]

  tags = {
    Name = "${each.key}-eu-west-1"
  }
}

# Loop over instances in US East region
resource "aws_instance" "useast_region_servers" {
  provider  = aws.useast
  for_each  = var.instances

  ami                    = var.ami_ids["us-east-1"]
  instance_type          = each.value
  key_name               = aws_key_pair.useast_region_key.key_name
  vpc_security_group_ids = [aws_security_group.useast_region_sg.id]

  tags = {
    Name = "${each.key}-us-east-1"
  }
}

# Security group for default region
resource "aws_security_group" "default_region_sg" {
  name   = "default-region-sg"
  vpc_id = data.aws_vpc.default_region_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for US East region
resource "aws_security_group" "useast_region_sg" {
  provider = aws.useast
  name     = "useast-region-sg"
  vpc_id   = data.aws_vpc.useast_region_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Data sources for default VPCs
data "aws_vpc" "default_region_vpc" {
  default = true
}

data "aws_vpc" "useast_region_vpc" {
  provider = aws.useast
  default  = true
}

