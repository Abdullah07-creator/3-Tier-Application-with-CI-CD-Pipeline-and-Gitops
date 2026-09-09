terraform {
  backend "s3" {
    bucket       = "three-tier-tfstate-672027759360"
    key          = "dev/three-tier-app/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
