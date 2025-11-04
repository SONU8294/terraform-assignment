# ECR repository URLs
output "flask_ecr_repo_url" {
  description = "ECR repository URL for the Flask backend"
  value       = aws_ecr_repository.flask.repository_url
}

output "express_ecr_repo_url" {
  description = "ECR repository URL for the Express frontend"
  value       = aws_ecr_repository.express.repository_url
}

# ECS cluster name
output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.this.name
}

# Application Load Balancer DNS
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

# Target group ARNs (optional)
output "flask_target_group_arn" {
  description = "Target group ARN for Flask service"
  value       = aws_lb_target_group.flask.arn
}

output "express_target_group_arn" {
  description = "Target group ARN for Express service"
  value       = aws_lb_target_group.express.arn
}
