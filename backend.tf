terraform {
  backend "s3" {
    bucket         = "infra-as-code2323"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    profile        = "default"
    encrypt        = true
    dynamodb_table = "infra-lock-table"
  }
}
