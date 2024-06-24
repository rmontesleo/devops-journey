terraform {

#############################################################
## Use this backend when the setup is readey in aws-backend
#############################################################

  #backend "s3" {
  #  bucket         = "polo-cloud-tf-state-20230715"
  #  key            = "terraform.tfstate"
  #  region         = var.region
  #  dynamodb_table = "terraform-state-locking"
  #  encrypt        = true`
  #}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

}

provider "aws" {
  region = var.region
}

#############################################################
## Network configuration
#############################################################

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnets" "default_subnets" {
  filter {
    name = "vpc-id"
    values = [ data.aws_vpc.default_vpc.id ]
  }
}


#############################################################
## Route53 configuration
#############################################################


#resource "aws_route53_zone" "primary" {
#  name = "" # set your own domain name here.  
#}

#resource "aws_route53_record" "root" {
#  zone_id = aws_route53_zone.primary.zone_id
#  name = "" # set your own domain name here. 
#  type = "A"
#  alias {
#    name =  aws_lb.load_balancer.dns_name
#    zone_id = aws_lb.load_balancer.zone_id
#    evaluate_target_health = true
#  }
#}



#############################################################
## Load balancer configuration
#############################################################

resource "aws_security_group" "alb" {
  name = "alb-security-group"
}

resource "aws_security_group_rule" "allow_alb_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.alb.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_alb_http_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.alb.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_lb" "load_balancer" {
  name               = "web-app-lb"
  load_balancer_type = "application"
  subnets            = data.aws_subnets.default_subnets.ids  
  security_groups    = [aws_security_group.alb.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port = 80
  protocol = "HTTP"

  # By default, return a simple 404 page
  default_action {

    type = "fixed-response"
    
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code = "404"
    }
  }
}

resource "aws_lb_listener_rule" "instances" {
  listener_arn = aws_lb_listener.http.arn
  priority = 100

  condition {
    path_pattern {
      values = [ "*" ]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.instances.arn
  }

}


resource "aws_lb_target_group" "instances" {
  name = "example-target-group"
  port = 8080
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default_vpc.id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "instance_1" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id = aws_instance.instance_1.id
  port = 8080
}

resource "aws_lb_target_group_attachment" "instance_2" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id = aws_instance.instance_2.id
  port = 8080  
}


#############################################################
## EC2 Configuration
#############################################################

resource "aws_security_group" "instances" {
  name = "instance-security-group"

  tags = {
    Name = "instance-security-group"
  }
}


resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}



resource "aws_instance" "instance_1" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
            #!/bin/bash
            echo "Hello, World 1" > index.html
            python3 -m http.server 8080 &
            EOF

  tags = {
    Name = "instance_1"
  }

}

resource "aws_instance" "instance_2" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
            #!/bin/bash
            echo "Hello, World 2" > index.html
            python3 -m http.server 8080 &
            EOF

  tags = {
    Name = "instance_2"
  }

}


#############################################################
## S3 Configuration
#############################################################
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_name
  force_destroy = true  
}


resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_crypto_conf" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#############################################################
## RDS DB Instance
#############################################################

resource "aws_db_instance" "db_instance" {
  allocated_storage =  20
  # This allows any minor version within the major engine_version
  # defined below, but will also result in allowing AWS to auto
  # upgrade the minor version of your DB. This may be too risky
  # in a real production environment.
  auto_minor_version_upgrade = true
  storage_type = "standard"
  engine = "postgres"
  engine_version = "12"
  instance_class = "db.t2.micro"
  db_name = var.db_name
  username = var.db_user
  password = var.db_password
  skip_final_snapshot = true
}