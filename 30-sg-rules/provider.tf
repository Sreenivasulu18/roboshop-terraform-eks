terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }

  backend "s3" {
    bucket = "remote-state-96s-123-dev"
    key    = "roboshop-eks-sg-rules"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }

}

provider "aws" {
    region = "us-east-1"
}
