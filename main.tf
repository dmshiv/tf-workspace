terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "random_id" "rand_id" {
  byte_length = 12
}

resource "aws_s3_bucket" "tf-cloud-bucket" {
  bucket = "tf-cloud-bucket-${random_id.rand_id.hex}"  ##so that it picks up our region 
}


