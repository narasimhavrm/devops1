terraform {
  backend "s3" {
    bucket = "myterraformstatefilebucket"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}