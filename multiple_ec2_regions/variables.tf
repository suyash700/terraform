variable "regions" {
  description = "List of AWS regions to deploy into"
  type        = list(string)
  default     = ["eu-west-1", "us-east-1"]
}

variable "instances" {
  description = "Map of instance names to instance types"
  type        = map(string)
  default = {
    server1 = "t2.micro"
    server2 = "t2.medium"
  }
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8fwIDq04Cp6qpM4TUk2AYDbh+7iVdy9QVrqxfZOwsG suyas@Suyash_LAP"
}

variable "ami_ids" {
  description = "Map of AMI IDs per region"
  type        = map(string)
  default = {
    eu-west-1 = "ami-01f23391a59163da9"
    us-east-1 = "ami-0c02fb55956c7d316"
  }
}
