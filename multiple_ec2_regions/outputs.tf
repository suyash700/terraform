output "default_region_instance_ips" {
  value = { for name, instance in aws_instance.default_region_servers :
    name => instance.public_ip
  }
}

output "useast_region_instance_ips" {
  value = { for name, instance in aws_instance.useast_region_servers :
    name => instance.public_ip
  }
}
