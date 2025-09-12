resource "aws_security_group" "dev-loadbalancer-security-group" {
  name = "${var.dev_tag_project_name}-lb-sg"
  vpc_id = aws_vpc.demo-vpc.id

  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "loadbalancer" {
  name = "${var.dev_tag_project_name}-loadbalancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.dev-loadbalancer-security-group.id]
  subnets = [aws_subnet.dev-subnet-01.id, aws_subnet.dev-subnet-02.id]
  enable_deletion_protection = false

  tags = {
    Name = "${var.dev_tag_project_name}-loadbalancer"
    Project = var.dev_tag_project_name 
  }
}


resource "aws_lb_target_group" "loadbalancer-tg" {
  name = "${var.dev_tag_project_name}-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.demo-vpc.id

  health_check {
    enabled = true
    healthy_threshold = 2    # Healthy after 2 successful checks
    interval = 30            # Check every 30 seconds
    matcher = "200"          # HTTP 200 equals to healthy
    path = "/index.html"     # health endpoint
    protocol = "HTTP"
    timeout = 5              # 5 seconds timeout
    unhealthy_threshold = 2  # Unhealthy after 2 failed checks
  }

  tags = {
    Name = "${var.dev_tag_project_name}-lb-tg"
    Project = var.dev_tag_project_name
  }
  
}

# FIX THIS: The "count" object can only be used in "module", "resource", and "data" blocks, and only when the "count" argument is set.
/*resource "aws_lb_target_group_attachment" "attachment_by_name" {
  target_group_arn = aws_lb_target_group.loadbalancer-tg.arn
  target_id = data.aws_instances.existing_by_name.ids[count.index]
  port = 80
}*/

resource "aws_acm_certificate" "poc-certificate" {
  domain_name = var.domain_name
  validation_method = "DNS"

  subject_alternative_names = [
    "www.${var.domain_name}"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.dev_tag_project_name}-certificate"
    Project= var.dev_tag_project_name
  }

  
}