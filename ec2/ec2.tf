resource "aws_key_pair" "my_key_resource" {
  key_name   = "my_key"
  public_key = "public key"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol  = "tcp"
    
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "tcp"
    
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance_resource" {
  key_name = aws_key_pair.my_key_resource.key_name
  security_groups = [ aws_default_security_group.default.name ]
  instance_type = "t2.micro"
  ami = "ami-01f23391a59163da9"
  user_data = file("install_nginx.sh")
  
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }

  tags = {
    Name = "server1"
  }

}
