module "ec2" {
	source = "../modules/ec2"
	instance_type = "t2.nano"
	security_name = module.security.sg-name
	key_name = "devops-herve"
}

module "ebs" {
	source = "../modules/ebs"
	zone = "ap-northeast-1a"
}

module "security" {
	source = "../modules/security"
	security_name = "herve-sg"
}

module "eip" {
	source = "../modules/ip_public"
	eip_name = "herve-eip"
}

resource "aws_eip_association" "eip_association" {
	instance_id = module.ec2.ec2-id
	allocation_id = module.eip.eip-id
}
