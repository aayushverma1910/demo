
####            compute module (instance)


resource "aws_instance" "public-instance" {
  ami                         = var.ami_id
  instance_type               = var.pub_ec2_type
  subnet_id                   = var.pub_sub_id
  key_name                    = var.key
  associate_public_ip_address = var.assign_public_IP_pub
  security_groups             = [var.pub_sg]
  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.pub_instance
    web  = var.tag_name_instance
  }
}

resource "aws_instance" "private-instance1" {
  ami                         = var.ami_id
  instance_type               = var.pvt_ec2_type
  subnet_id                   = var.pvt_sub1_id
  key_name                    = var.key
  associate_public_ip_address = var.assign_public_IP_pvt
  security_groups             = [var.pvt_sg]
  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.pvt_instance1
    web  = var.tag_name_ec2
  }
}

####            compute module (target group)


resource "aws_lb_target_group" "target" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.VPC_ID
  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_threshold
    unhealthy_threshold = var.unhealth_check_threshold
    matcher             = var.health_check_matcher
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment_private_instance1" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.private-instance1.id
  port             = var.tg_attachment_port
  #The port on the EC2 instance to which the traffic should be directed
}

# 
# ##  Auto Load Balancer
# 

resource "aws_lb" "sonar-alb" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_tpye
  security_groups = [
    var.pvt_sg
  ]
  subnets = [
    var.pub_sub_id,
    var.pvt_sub2_id
  ]

  enable_deletion_protection = var.enable_deletion
}



# ##  Auto Load Balancer listener

resource "aws_lb_listener" "sonar_alb_listener" {
  load_balancer_arn = aws_lb.sonar-alb.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    type             = var.alb_listener_action
    target_group_arn = aws_lb_target_group.target.arn
  }
}


