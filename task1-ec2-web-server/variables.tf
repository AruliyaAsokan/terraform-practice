variable "network_address_space" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_address_space" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}



