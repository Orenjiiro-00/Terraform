resource "aws_eip" "herve_eip" {
	vpc = true
	tags = {
		Name = "${var.eip_name}"
	}
}
