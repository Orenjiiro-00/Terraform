variable "zone" {
	default = "ap-northeast-1a"
	type = string
}

variable "ebs_name" {
	default = "herve-ebs"
	type = string
}

variable "ebs_volume" {
	default = 50
	type = number
}

variable "app" {
	default = "nginx"
	type = string
}
