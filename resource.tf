resource "aws_vpc" "Test-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Test-VPC"
    Env  = "Dev"
  }
}