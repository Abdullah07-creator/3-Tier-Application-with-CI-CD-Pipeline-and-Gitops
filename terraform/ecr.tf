resource "aws_ecr_repository" "backend" {
  name                 = "three-tier-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true

  }
}

#ECR required for Frontable UI 
resource "aws_ecr_repository" "frontend" {
  name                 = "three-tier-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_backend_url" {
  value       = aws_ecr_repository.backend.repository_url
  description = "URL of Backend Amazon ECR Repository"
}

output "ecr_frontend_url" {
  value       = aws_ecr_repository.frontend.repository_url
  description = "URL of Frontend Amazon ECR Repository"
}