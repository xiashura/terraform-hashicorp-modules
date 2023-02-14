output "id" {
  value = boundary_user.user.id
}


output "password" {
  value     = boundary_account_password.user.password
  sensitive = true
}
