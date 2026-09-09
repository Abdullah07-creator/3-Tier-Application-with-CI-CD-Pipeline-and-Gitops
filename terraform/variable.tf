variable "aws_region" {
  type        = string
  description = "Aws region for infrastructure deployment"
  default     = "us-east-1"

}

variable "environment" {
  type        = string
  description = "Deployment environment identifier"
  default     = "dev"

}

variable "db_password" {
  type        = string
  description = "Master password for Amazon RDS PostgreSQL instance"
  sensitive   = true
  default     = "DevOpsPass2026!"

}
