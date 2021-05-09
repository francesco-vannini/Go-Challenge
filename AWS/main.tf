terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06dc09bb8854cbde3"
  instance_type = "t2.micro"
	subnet_id	= "subnet-0bbde068b893bee5f"
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
