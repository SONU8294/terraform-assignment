resource "aws_cloudwatch_log_group" "flask_log_group" {
  name              = "/ecs/flask-express-flask"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "express_log_group" {
  name              = "/ecs/flask-express-express"
  retention_in_days = 7
}
