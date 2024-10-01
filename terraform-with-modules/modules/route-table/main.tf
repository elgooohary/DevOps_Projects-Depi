resource "aws_route_table" "my-Rt" {
  vpc_id = var.vpc-id

  route {
    cidr_block = var.cidr-block
    gateway_id = var.gateway-id
  }
  
  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "Rt-association" {
  subnet_id      = var.subnet-id
  route_table_id = aws_route_table.my-Rt.id
}