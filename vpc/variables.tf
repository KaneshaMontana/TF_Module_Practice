#############################################################################
## VPC
#############################################################################


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC"
  type = string
  default = "my_vpc"
}

#############################################################################
## Public Subnet
#############################################################################
variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type = string
  default = "my_public_subnet"
}

#############################################################################
## Private Subnet
#############################################################################
variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type = string
  default = "my_private_subnet"
}

#############################################################################
## Internet Gateway
#############################################################################
variable "igw_name" {
  description = "The name of the Internet Gateway"
  type = string
  default = "my_igw"
}

#############################################################################
## NAT Gateway
#############################################################################

variable "nat_name" {
  description = "The name of the NAT Gateway"
  type = string
  default = "my_nat"
}

#############################################################################
## Tags
#############################################################################
variable "common_tags" {
  description = "The owner of the resources"
  type = map(string)
  default = {}
}
