terraform {
  backend "s3" {
    bucket = "terraform-state-dummy"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}