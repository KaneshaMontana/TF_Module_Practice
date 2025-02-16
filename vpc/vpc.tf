

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  
  tags = merge( 
    {
      "Name" = "${var.vpc_name}"
    },
    var.common_tags
  )
}


