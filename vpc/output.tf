output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "List of IDs of public subnets"
}

output "public_subnet_length" {
  value       = length(aws_subnet.public[*].id)
  description = "The number of public subnets created"
}

