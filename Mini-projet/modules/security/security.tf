resource "aws_security_group" "my_sg" {
	name = "${var.admin}-sg"
	description = "Allow inbound traffic with ports 80 & 443"

	ingress {
		description = "TLS from VPC"
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	ingress {
		description = "http from VPC"
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	ingress {
		description = "ssh from VPC"
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	tags = {
		Name = "${var.admin}-sg"
	}
}
