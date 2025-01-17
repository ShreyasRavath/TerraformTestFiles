resource "aws_vpc" "Test-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Test-VPC"
    Env  = "Dev"
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.myami.id
  instance_type = "t2.4xlarge"

  tags = {
    Name = "ExampleAppServerInstance"
    Env = "Development"
  }
}

resource "aws_s3_bucket" "mybucket" {
bucket = "tfjan2025asdfjoaisdufioasjdf5522"
}

data "aws_ami" "myami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
