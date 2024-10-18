
# resource "aws_subnet" "private" {
#   count             = length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.private_subnet_cidrs[count.index]
#   availability_zone = data.aws_availability_zones.available.names[count.index]

#   tags = merge(
#     {
#     Name = "private Subnet ${count.index + 1}"
#   },
#   var.common_tags
#   )
# }

# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main_vpc.id

#   route {
#     cidr_block = var.private_subnet_cidrs
#     gateway_id = aws_nat_gateway.base_nat.id
#   }

#   tags = merge(
#      {
#     Name = "private Route Table"
#   },
#     var.common_tags
#   )
# }

# resource "aws_route_table_association" "private_rt_assoc" {
#   count          = length(aws_subnet.private)
#   subnet_id      = aws_subnet.private[count.index].id
#   route_table_id = aws_route_table.private_rt.id
# }
