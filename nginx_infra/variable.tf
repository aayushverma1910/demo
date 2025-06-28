variable "region_name" {
  type        = string
  default     = "ap-south-1"
  description = "enter region name"
}
variable "vpc_name" {
  type        = string
  default     = "nginx-VPC"
  description = "enter vpc name"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/18"
  description = "enter vpc cidr"
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
  description = "enter public subnet name"
}
variable "pub_sub_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "enter pubic subnet cidr"
}
variable "availability_zone01" {
  type        = string
  default     = "ap-south-1a"
  description = "enter the availability zone for public subnet"
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
variable "availability_zone02" {
  type        = string
  default     = "ap-south-1b"
  description = "enter the availability zone for private subnet2"
}
variable "igw_name" {
  type        = string
  default     = "internet_gatewey"
  description = "enter internet gatewey name"
}
variable "NAT_name" {
  type        = string
  default     = "NAT_gatewey"
  description = "enter NAT gatewey name"
}
variable "local_gateway" {
  type        = string
  default     = "local"
  description = "enter local gateway"
}
variable "RT_cidr_block" {
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
##################    security

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
  description = "private security group name"
}
variable "pvt_sg_tag" {
  type        = string
  default     = "private_Sgroup"
  description = "private security group tag"
}

variable "egress_rule_nacl" {
  description = "Egress rule configuration for NACL"
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
  description = "ingress rule configuration for NACL"
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
  description = "private NACL name"
}

# variable "nginx_vpcID" {
#   type        = string
#   default     = ""
#   description = "enter vpi id"
# }

###########################################compute

variable "pub_instance" {
  type        = string
  default     = "Bastion_host"
  description = "enter public instance name"
}
variable "tag_name_ec2" {
  type        = string
  default     = "nginx"
  description = "enter tag name of instance"
}
variable "pvt_instance1" {
  type        = string
  default     = "web-server1"
  description = "enter web server1 instance name"
}
variable "pvt_instance2" {
  type        = string
  default     = "Database-server2"
  description = "enter web server2 instance name"
}
variable "ami_id" {
  type        = string
  default     = "ami-053b12d3152c0cc71"
  description = "AMI ID of instanace"
}
variable "pem_key" {
  type        = string
  default     = "nginx_key"
  description = "enter pem key name"
}
variable "pub_ec2_type" {
  type        = string
  default     = "t2.micro"
  description = "enter instance types"
}
variable "pvt_ec2_type" {
  type        = string
  default     = "t2.micro"
  description = "enter instance types"
}
variable "assign_public_IP_pub" {
  type        = bool
  default     = true
  description = "assign_public_IP for private"
}
variable "assign_public_IP_pvt" {
  type        = bool
  default     = false
  description = "assign_public_IP for private"
}
variable "volume_size" {
  type        = number
  default     = 29
  description = "root volume size for the EC2 instances"
}

##########################

variable "tg_name" {
  type        = string
  default     = "nginx-target"
  description = "target group name"
}
variable "tg_port" {
  type        = number
  default     = 80
  description = "target group port"
}
variable "tg_protocol" {
  type        = string
  default     = "HTTP"
  description = "type of Target protocol"
}
variable "health_check_path" {
  type        = string
  default     = "/"
  description = "enter health check path"
}
variable "health_check_interval" {
  type        = number
  default     = 30
  description = "enter health check interval"
}
variable "health_check_timeout" {
  type        = number
  default     = 5
  description = "enter health check timeout"
}
variable "health_check_threshold" {
  type        = number
  default     = 2
  description = "enter health check healthy threshold"
}
variable "unhealth_check_threshold" {
  type        = number
  default     = 10
  description = "enter health check unhealthy threshold"
}
variable "health_check_matcher" {
  type        = number
  default     = 200
  description = "enter health check matcher"
}
variable "tg_attachment_port" {
  type        = number
  default     = 80
  description = "target group attachment port"
}

#####################


variable "lb_name" {
  type        = string
  default     = "nginx-LB"
  description = "enter load balancer name"
}
variable "lb_internal" {
  type        = bool
  default     = false
  description = "enter load balancer internal"
}
variable "lb_tpye" {
  type        = string
  default     = "application"
  description = "enter load balancer type"
}

variable "lb_enable_deletion" {
  type        = bool
  default     = false
  description = "enter load balancer enable deletion protection"
}

##################################

variable "alb_listener_port" {
  type        = number
  default     = 80
  description = " alb listener port"
}
variable "alb_listener_protocol" {
  type        = string
  default     = "HTTP"
  description = "type of Target protocol"
}
variable "alb_listener_action" {
  type        = string
  default     = "forward"
  description = "type of Target protocol"
}
variable "enable_deletion" {
  type        = bool
  default     = false
  description = "description"
}
###
variable "template-name" {
  type        = string
  default     = "nginx_template"
  description = "template name"
}
variable "image-id" {
  type        = string
  default     = "ami-0d2ff2c97d1994683"
  description = "the private group id is retrieved from networking module"
}
variable "ASG-name" {
  type        = string
  default     = "nginx-ASG"
  description = "template name"
}
variable "asg_desired_capacity" {
  type    = number
  default = 1
}
variable "asg_max_size" {
  type    = number
  default = 2
}
variable "asg_min_size" {
  type    = number
  default = 0
}
variable "asg_health_check_period" {
  type    = number
  default = 300
}
variable "asg_LT_version" {
  type    = string
  default = "$Latest"
}
variable "policy_name_up" {
  type    = string
  default = "nginx_scale_up"
}
variable "Scale_adj_up" {
  type    = number
  default = 2
}
variable "cooldown_scaleup" {
  type    = number
  default = 120
}
variable "policy_name_down" {
  type    = string
  default = "nginx_scale_up"
}
variable "Scale_adj_down" {
  type    = number
  default = -1
}
variable "cooldown_scaledown" {
  type    = number
  default = 60
}
variable "threshold_down" {
  type    = string
  default = "25"
}
variable "evaluation_periods_down" {
  type    = string
  default = "2"
}
variable "period_down" {
  type    = string
  default = "30"
}
variable "threshold_up" {
  type    = string
  default = "25"
}
variable "evaluation_periods_up" {
  type    = string
  default = "2"
}
variable "period_up" {
  type    = string
  default = "30"
}