output "instance_id" {
  value = aws_instance.dove-key.id
}
output "instance_public_ip" {
  value = aws_instance.dove-key.public_ip
}