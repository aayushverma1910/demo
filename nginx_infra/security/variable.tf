variable "public_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH" },
    { from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP" },
    { from_port = 443, to_port = 443, protocol = "tcp", description = "HTTPS" },
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}
variable "public_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}
variable "pub_sg_name" {
  type        = string
  default     = "public_sg"
  description = "public security group"
}
variable "pub_sg_tag" {
  type        = string
  default     = "public_Sgroup"
  description = "public security group"
}
variable "private_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH" },
    { from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP" },
    { from_port = 443, to_port = 443, protocol = "tcp", description = "HTTPS" },
  ]
}
variable "private_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}
variable "pvt_sg_name" {
  type        = string
  default     = "private_sg"
  description = "Assign a name to the private security group"
}
variable "pvt_sg_tag" {
  type        = string
  default     = "private_sg_tag"
  description = "Assign a tag to the private security group"
}

variable "egress_rule_nacl" {
  description = "Configure the engress rules for the NACLL"
  type = object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  })
  default = {
    protocol   = "all"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

variable "ingress_rule_nacl" {
  description = "Configure the ingress rules for the NACL"
  type = object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  })
  default = {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}
variable "tag_nacl" {
  type        = string
  default     = "private_NACL"
  description = " Define the name for the private NACL."
}

variable "VPC_ID" {
  type        = string
  default     = ""
  description = "The VPI ID is retrieved from the networking module."
}
variable "pvt_sub1_id" {
  type        = string
  default     = ""
  description = " the private subnet1 id is retrieved from  the networking module"
}
variable "pvt_sub2_id" {
  type        = string
  default     = ""
  description = " the private subnet2 id is  retrieved from  the networking module"
}

