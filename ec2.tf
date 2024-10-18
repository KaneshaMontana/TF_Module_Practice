resource "aws_instance" "my_example_instance" {
  count = module.vpc.public_subnet_length

  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"
  subnet_id     = element(module.vpc.public_subnet_ids, count.index)

  tags = merge(
    {
    Name = "my_instance",
    Environment = var.environment
    },
    local.my_resource_tags
  )
}


