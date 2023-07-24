terraform {
  backend "s3" {
    bucket         = "widebot-bucket-task"
    key            = "terraform.tfstate"
    dynamodb_table = "widebot-table"
    region         = "us-east-1"
  }
}