output "sg-name" {
	description = "Name of Security group"
	value       = aws_security_group.my_sg.name
}
