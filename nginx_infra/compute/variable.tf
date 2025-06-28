variable "pub_instance" {
  type        = string
  default     = "Bastion_host"
  description = "enter public instance name"
}
variable "tag_name_instance" {
  type        = string
  default     = "public-nginx"
  description = "enter tag name of public instance"
}
variable "tag_name_ec2" {
  type        = string
  default     = "nginx"
  description = "enter tag name of private instance"
}
variable "pvt_instance1" {
  type        = string
  default     = "web-server1"
  description = "Provide the name for the private instance1"
}
variable "pvt_instance2" {
  type        = string
  default     = "web-server2"
  description = "Provide the name for the private instance2"
}
variable "ami_id" {
  type        = string
  default     = "ami-053b12d3152c0cc71"
  description = "AMI ID of instanace"
}
variable "key" {
  type        = string
  default     = "nginx_key"
  description = "enter your  key name"
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
  default     = "Nginx-target"
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
  default     = 280
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
  type        = string
  default     = "200-299"
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
  default     = "Nginx-LB"
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

#####################################module
variable "pub_sub_id" {
  type        = string
  default     = ""
  description = " the public subnet id is retrieved from networking module"
}
variable "pvt_sub1_id" {
  type        = string
  default     = ""
  description = " the private subnet1 id is retrieved  from networking module"
}
variable "pvt_sub2_id" {
  type        = string
  default     = ""
  description = " the private subnet2 id is retrieved from networking module"
}
variable "pub_sg" {
  type        = string
  default     = ""
  description = "the public group id is retrieved from networking module"
}
variable "pvt_sg" {
  type        = string
  default     = ""
  description = "the private group id is retrieved from networking module"
}
variable "VPC_ID" {
  type        = string
  default     = ""
  description = "the private group id is retrieved from networking module"
}

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