# resource "aws_nat_gateway" "base_nat" {
#   allocation_id = aws_eip.base_eip.id
#   subnet_id     = aws_subnet.my_public_subnet.id

#   tags = merge({
#     Name = " NAT Gateway"
#   },
#     var.common_tags
#   )

#   depends_on = [aws_internet_gateway.base_igw]
# }