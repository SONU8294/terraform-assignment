##############################################
# HTTP Listener for ALB
##############################################
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Default route — no matching service"
      status_code  = "404"
    }
  }

  tags = {
    Name = "${var.project}-http-listener"
  }
}

##############################################
# Listener Rule for Flask Backend
##############################################
resource "aws_lb_listener_rule" "flask" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.flask.arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }

  depends_on = [
    aws_lb_listener.http,
    aws_lb_target_group.flask
  ]

  tags = {
    Name = "${var.project}-flask-listener-rule"
  }
}

##############################################
# Listener Rule for Express Frontend
##############################################
resource "aws_lb_listener_rule" "express" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.express.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  depends_on = [
    aws_lb_listener.http,
    aws_lb_target_group.express
  ]

  tags = {
    Name = "${var.project}-express-listener-rule"
  }
}
