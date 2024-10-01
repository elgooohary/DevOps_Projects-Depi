variable "name" {
  type = string
  default = "my-sg"
}
variable "description" {
  type = string
  description = "Allow ssh and 3000 traffic"
}
variable "vpc-id" {
  type = string
}

variable "cidr-block-1" {
  type = string
  description = "CIDR blocks for the first ingress rule"
  default     = "0.0.0.0/0"
}

variable "from-port-1" {
  type = number
  default = 22
}

variable "ip-protocol" {
   type = string
   default = "tcp"
}

variable "to-port-1" {
   type = number
   default = 22
}

#----------------------
variable "cidr-block-2" {
  type = string
  description = "CIDR blocks for the first ingress rule"
  default     = "0.0.0.0/0"
}

variable "from-port-2" {
  type = number
  default = 3000
}

variable "to-port-2" {
   type = number
   default = 3000
}

# Variable to enable or disable ingress rule 1
variable "enable-ingress-rule-1" {
  type        = bool
  description = "Whether to enable the first ingress rule"
  default     = false       # Default is true (enabled)
}

# Variable to enable or disable ingress rule 2
variable "enable-ingress-rule-2" {
  type        = bool
  description = "Whether to enable the second ingress rule"
  default     = false           # Default is true (enabled)
}