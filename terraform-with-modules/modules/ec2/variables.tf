variable "ami" {
   type = string
   default = "ami-047d7c33f6e7b4bc4"
}

variable "sgs" {
   type = list(string)
}
variable "availability-zone" {
   type = string
   
}
variable "subnet-id" {
   type = string
}
variable "name" {
   type = string
}

