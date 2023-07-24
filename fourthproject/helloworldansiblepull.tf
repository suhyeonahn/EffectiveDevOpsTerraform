# Provider Configuration for AWS
provider "aws" {
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

# Provisioner for applying Ansible playbook in Pull mode
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      private_key = "${file("~/.ssh/EffectiveDevOpsAWS.pem")}"
    }
    inline = [
      "sudo yum install python3 python3-pip",
      "sudo pip3 install ansible",
      "sudo yum install --enablerepo=epel -y git",
      "sudo ansible-pull -U https://github.com/yogeshraheja/ansible helloworld.yml -i localhost"
    ]
  }
}

# IP address of newly created EC2 instance
output "myserver" {
 value = "${aws_instance.myserver.public_ip}"
}