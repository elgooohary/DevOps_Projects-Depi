resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc-id
  cidr_block = var.cidr-block
  availability_zone = var.availability-zone
  map_public_ip_on_launch = var.public-ip-on-launch # as default is false | ==> this arg use for map public ip automatic when creation if you dont create Elastic ip

  tags = {
    Name = var.name
  }
}