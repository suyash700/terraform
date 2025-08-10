output "ec2_public_ip" {
  value = aws_instance.my_instance_resource.public_ip
}


output "ec2_private_ip" {
  value = aws_instance.my_instance_resource.private_ip
}

output "ec2_public_dns" {
  value = aws_instance.my_instance_resource.public_dns
}
