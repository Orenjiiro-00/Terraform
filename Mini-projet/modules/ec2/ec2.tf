resource "aws_instance" "herve-ec2" {
	ami               = data.aws_ami.my_ami.id
	instance_type     = "${var.instance_type}"
	security_groups   = ["${var.security_name}"]
	key_name          = var.key_name
	availability_zone = var.zone
	user_data = <<-EOF
		#!/bin/bash
		sudo apt-get update -y
		sudo apt-get install nginx -y
		sudo systemctl enable nginx
		sudo systemctl start nginx
		EOF

	provisioner "local-exec" {
		command = "echo '${aws_instance.herve-ec2.tags.Name} [PUBLIC IP : ${self.public_ip}, ID : ${self.id}, AZ : ${self.availability_zone}]' >> ip_ec2.txt"
	}

	connection {
		type = "ssh"
		user = "ubuntu"
		private_key = file(var.ssh_key_path)
		host = self.public_ip
	}

	tags = {
		Name = "ec2-${var.admin}"
		iac  = "terraform"
	}
}

data "aws_ami" "my_ami" {
	most_recent = true
	owners = ["099720109477"]
	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-bionic*"]
	}
}
