output "backend_instance_ids" {
  value = aws_instance.backend_test[*].id
}