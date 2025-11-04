##############################################
# ECS Services for Flask and Express
##############################################

# Flask Service
resource "aws_ecs_service" "flask" {
  name            = "${var.project}-flask-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.flask.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = values(aws_subnet.public)[*].id
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.flask.arn
    container_name   = "flask"
    container_port   = 5000
  }

  depends_on = [
    aws_lb_listener_rule.flask
  ]
}

# Express Service
resource "aws_ecs_service" "express" {
  name            = "${var.project}-express-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.express.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = values(aws_subnet.public)[*].id
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.express.arn
    container_name   = "express"
    container_port   = 3000
  }

  depends_on = [
    aws_lb_listener_rule.express
  ]
}
