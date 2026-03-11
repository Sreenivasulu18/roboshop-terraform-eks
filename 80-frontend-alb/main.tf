resource "aws_lb" "ingress_alb" {
  name               = "${local.common_name_suffix}-ingress-alb" # roboshop-dev-frontend-alb
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.ingress_alb_sg_id]
  subnets            = local.public_subnet_ids	

  enable_deletion_protection = false # prevent accidential deletion from UI

  

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-ingress-alb"  # roboshop-dev-frontend-alb
    }
  )
}

resource "aws_lb_listener" "ingress_alb" {
  load_balancer_arn = aws_lb.ingress_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06"
  certificate_arn   = local.ingress_alb_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from HTTPS ingress ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "ingress_alb" {
  zone_id = var.zone_id
  name    = "*.${var.domain_name}" # *.daws96s.fun
  type    = "A"
  allow_overwrite = true
 
 # These are ALB details, not our domain details 
  alias {
    name                   = aws_lb.ingress_alb.dns_name
    zone_id                = aws_lb.ingress_alb.zone_id
    evaluate_target_health = true
  }
}