# bastion is the enrty point بتاعتى
resource "aws_instance" "instance" {
 
    ami = var.ami
    instance_type = "t2.micro"
    subnet_id = var.subnet-id
    security_groups = var.sgs
    availability_zone = var.availability-zone
    key_name = "test-app"

    tags = {
        Name = var.name
    }
}