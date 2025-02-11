
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge(
    {
    Name = "my-private-subnet-${count.index + 1}"
  },
  var.common_tags
  )
}

resource "aws_route_table" "private_rt" {
  count = length(var.private_subnet_cidrs)
  
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block ="0.0.0.0/0"
    gateway_id = aws_nat_gateway.main_nat[count.index].id
  }

  tags = merge(
     {
       Name = "my-private-rt"
     },
    var.common_tags
  )
}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(var.private_subnet_cidrs)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}
