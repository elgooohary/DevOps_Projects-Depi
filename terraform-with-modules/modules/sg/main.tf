resource "aws_security_group" "my-sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc-id

  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  count = var.enable-ingress-rule-1 ? 1 : 0
  security_group_id = aws_security_group.my-sg.id
  cidr_ipv4         = var.cidr-block-1
  from_port         = var.from-port-1
  ip_protocol       = var.ip-protocol 
  to_port           = var.to-port-1
}

resource "aws_vpc_security_group_ingress_rule" "allow-3000" {
  count = var.enable-ingress-rule-2 ? 1 : 0
  security_group_id =  aws_security_group.my-sg.id
  cidr_ipv4         = var.cidr-block-2
  from_port         = var.from-port-2
  ip_protocol       = var.ip-protocol
  to_port           = var.to-port-2
}

resource "aws_vpc_security_group_egress_rule" "allow_all2" {
  security_group_id = aws_security_group.my-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
