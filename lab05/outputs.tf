output "http_access" {
  value = "http://${aws_instance.ansible.public_ip}"
}
