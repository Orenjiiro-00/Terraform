resource "aws_ebs_volume" "herve_ebs" {
	availability_zone = var.zone
	size              = var.ebs_volume
	tags = {
		Name = "${var.app}-herve-ec2"
	}
}
