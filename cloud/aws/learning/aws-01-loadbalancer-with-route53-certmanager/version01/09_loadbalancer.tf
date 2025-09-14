resource "aws_lb_target_group" "loadbalancer-tg" {
  name = "${var.dev_tag_project_name}-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.demo-vpc.id # This must be the same vpc as ALB

  health_check {
    enabled = true    
    interval = 30            # Check every 30 seconds
    matcher = "200"          # HTTP 200 equals to healthy
    path = "/index.html"     # health endpoint
    protocol = "HTTP"
    timeout = 5              # 5 seconds timeout
    healthy_threshold = 2    # Healthy after 2 successful checks
    unhealthy_threshold = 2  # Unhealthy after 2 failed checks
  }

  tags = {
    Name = "${var.dev_tag_project_name}-lb-tg"
    Project = var.dev_tag_project_name
  }
  
}

resource "aws_lb_target_group_attachment" "nginx" {
  target_group_arn = aws_lb_target_group.loadbalancer-tg.arn
  target_id = aws_instance.nginx-ec2-instance-node-01.id
  port = 80
}

resource "aws_lb_target_group_attachment" "apache" {
  target_group_arn = aws_lb_target_group.loadbalancer-tg.arn
  target_id = aws_instance.apache-ec2-instance-node-02.id
  port = 80
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

resource "aws_acm_certificate" "poc-certificate" {
  domain_name = local.full_domain_name
  validation_method = "DNS"

  subject_alternative_names = [
    "www.${local.full_domain_name}"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.dev_tag_project_name}-certificate"
    Project= var.dev_tag_project_name
  }
  
}

# Certificate Validation Records
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in  aws_acm_certificate.poc-certificate.domain_validation_options: dvo.domain_name => {
      name = dvo.resource_record_name
      record = dvo.resource_record_value
      type = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name = each.value.name
  records = [each.value.record]
  ttl = 60
  type = each.value.type
  zone_id = data.aws_route53_zone.demo_domain_zone.id
}

# Certificate Validation
 resource "aws_acm_certificate_validation" "cert" {
  certificate_arn =  aws_acm_certificate.poc-certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.aws_route53_record.cert_validation : record.fqdn  ]
}


resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.demo_domain_zone.id
  name = local.full_domain_name
  type = "A"

  alias {
    name = aws_lb.loadbalancer.name
    zone_id = aws_lb.loadbalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.demo_domain_zone.id
  name = local.www_domain_name
  type = "A"
  alias {
    name = aws_lb.loadbalancer.dns_name
    zone_id = aws_lb.loadbalancer.zone_id
    evaluate_target_health = true
  }
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port = 443
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port = 443
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = aws_acm_certificate_validation.cert.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.loadbalancer-tg.arn
  }

}

