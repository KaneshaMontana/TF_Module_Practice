resource "aws_eip" "public_nat" {
  count = length(var.public_subnet_cidrs)

  domain   = "vpc"
}

resource "aws_nat_gateway" "main_nat" {
  count = length(var.public_subnet_cidrs)

  allocation_id = aws_eip.public_nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge({
    Name = "my-nat-gw"
  },
  var.common_tags
  )

  depends_on = [aws_internet_gateway.main_igw]
}
