resource "aws_instance" "my_example_instance" {
  count = module.vpc.public_subnet_length

  ami           = data.aws_ami.linux.id
  instance_type = "t2.micro"
  subnet_id     = element(module.vpc.public_subnet_ids, count.index)

  tags = merge(
    {
      Name        = "my_instance-${count.index + 1}",
      Environment = var.environment
    },
    local.my_resource_tags
  )
}


