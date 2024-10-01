resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = var.name
  }

}

