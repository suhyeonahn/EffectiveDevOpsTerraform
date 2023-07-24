# Provider Configuration for AWS
provider "aws" {
  access_key = "AKIA46N7NBOTW4HP2I4M"
  secret_key = "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"
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