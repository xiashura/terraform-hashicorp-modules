
output "id" {
  value = boundary_scope.project.id
}


output "auth_method_password_id" {
  value = var.password_auth_method ? boundary_auth_method.password.0.id : ""
}
