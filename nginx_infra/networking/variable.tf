variable "vpc_name" {
  type        = string
  default     = "nginx-VPC"
  description = "enter your vpc name"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/18"
  description = "enter your vpc cidr"
}
variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "vpc instance tenancy"
}
variable "dns_support" {
  type        = bool
  default     = true
  description = "vpc dns support"
}
variable "dns_hostnames" {
  type        = bool
  default     = true
  description = "vpc dns hostnames"
}
variable "pub_sub_name" {
  type        = string
  default     = "public-sub"
  description = "enter  your public subnet name"
}
variable "pub_sub_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "enter  your pubic subnet cidr"
}
variable "az01" {
  type        = string
  default     = "ap-south-1a"
  description = "select the  availability zone for private subnet1"
}
variable "pvt_sub_name1" {
  type        = string
  default     = "web-sub1"
  description = "enter private subnet1 name"
}
variable "pvt_sub1_cidr" {
  type        = string
  default     = "10.0.3.0/24"
  description = "enter private subnet1 cidr"
}
variable "pvt_sub_name2" {
  type        = string
  default     = "web-sub2"
  description = "enter private subnet2 name"
}
variable "pvt_sub2_cidr" {
  type        = string
  default     = "10.0.6.0/24"
  description = "enter private subnet2 cidr"
}
variable "az02" {
  type        = string
  default     = "ap-south-1b"
  description = "select the  availability zone for private subnet2"
}
variable "igw_name" {
  type        = string
  default     = "internet_gateway"
  description = "please provide a internet gateway name"
}
variable "NAT_name" {
  type        = string
  default     = "NAT_gateway"
  description = "please enter your  NAT gateway name"
}
variable "local_gateway" {
  type        = string
  default     = "local"
  description = " enter local gateway"
}
variable "RT-cidr_block" {
  type        = string
  default     = "0.0.0.0/0"
  description = "enter route table cidr_block"
}
variable "public_RT_name" {
  type        = string
  default     = "Public-route-table"
  description = "enter Public route table name"
}
variable "private_RT_name" {
  type        = string
  default     = "Private-route-table"
  description = "enter Private route table name"
}
variable "vpc_accept" {
  type        = bool
  default     = true
  description = "description"
}
