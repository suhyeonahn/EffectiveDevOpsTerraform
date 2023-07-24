# Provider Configuration for AWS
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

# Resource Configuration for AWS
resource "aws_instance" "myserver" {
  ami = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
  key_name = "EffectiveDevOpsAWS"
  vpc_security_group_ids = ["sg-0839873a10d4bfff1"]

  tags = {
    Name = "helloworld"
  }
}