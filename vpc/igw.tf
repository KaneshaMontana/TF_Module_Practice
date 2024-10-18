resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    {
    Name = "${var.igw_name}"
  },
    var.common_tags
  )
}