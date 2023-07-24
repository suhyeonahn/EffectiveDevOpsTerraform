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

# Helloworld Appication code
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      private_key = "${file("/root/.ssh/EffectiveDevOpsAWS.pem")}"
    }
    inline = [
      #"sudo yum install epel-release",
      "sudo yum install nodejs",
      "sudo wget https://raw.githubusercontent.com/yogeshraheja/Effective-DevOps-with-AWS/master/Chapter02/helloworld.js -O /home/ec2-user/helloworld.js",
      "sudo wget https://raw.githubusercontent.com/yogeshraheja/Effective-DevOps-with-AWS/master/Chapter02/helloworld.conf -O /etc/init/helloworld.conf",
      #"sudo start helloworld"
    ]
  }
}