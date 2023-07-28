
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
  profile = "tf-user"
  region  = "ap-northeast-2"
}


