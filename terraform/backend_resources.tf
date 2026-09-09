# Retrieve current AWS account ID dynamically for global bucket uniqueness
data "aws_caller_identity" "current" {}

# 1. AWS S3 Bucket for Remote State Storage
resource "aws_s3_bucket" "terraform_state" {
  bucket        = "three-tier-tfstate-${data.aws_caller_identity.current.account_id}"
  force_destroy = true

  tags = {
    Name        = "Three-Tier Terraform State Storage"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 2. Enable S3 Bucket Versioning for State Snapshot Rollbacks
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 3. Enable Server-Side Encryption (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 4. DynamoDB Table for Concurrent State Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "three-tier-tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Three-Tier Terraform State Lock Table"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
