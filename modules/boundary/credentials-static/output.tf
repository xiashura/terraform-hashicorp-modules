output "credentials_username_password_ids" {
  value = {
    for el in boundary_credential_username_password.credentials_username_password: 
    el.name => el.id
  }
}