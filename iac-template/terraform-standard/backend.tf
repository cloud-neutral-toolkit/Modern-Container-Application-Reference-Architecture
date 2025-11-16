terraform {
  backend "s3" {
    bucket = "svc-plus-iac-state"
    key    = "sit/ec2/terraform.tfstate"
    region = "svc-plus-iac-state-locks"
    encrypt        = true
  }
}
