 variable "vpc-id" {
  type = string
 }

 variable "cidr-block" {
  type = string
 }

 variable "availability-zone" {
  type = string
 }

 variable "public-ip-on-launch" {
  type = bool
  default = false
 }

  variable "name" {
  type = string
 }
