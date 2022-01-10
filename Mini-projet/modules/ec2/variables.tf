variable "instance_type" {
        default = "t2.small"
}

variable "security_name" {
	type = string
	description = "security group name"
}

variable "key_name" {
	default = "devops-herve"
	type        = string
	description = "Set key name"
}

variable "zone" {
	default = "ap-northeast-1a"
	type = string
}

variable "ssh_key_path" {
	type        = string
	description = "Set ssh key path"
	default = "/home/ubuntu/herve-ajc-kp-terraform.pem"
}

variable "admin" {
	default = "herve"
}
