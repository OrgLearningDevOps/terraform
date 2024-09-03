terraform {
  backend "s3" {
    bucket         = "THE_NAME_OF_THE_STATE_BUCKET"
    key            = "some_environment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "THE_ID_OF_THE_KMS_KEY"
    dynamodb_table = "THE_ID_OF_THE_DYNAMODB_TABLE"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}
