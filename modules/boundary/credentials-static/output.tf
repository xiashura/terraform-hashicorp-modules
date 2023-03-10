output "credentials_username_password_ids" {
  value = {
    for el in boundary_credential_username_password.credentials_username_password: 
    el.name => el.id
  }
}


output "credential_ssh_private_key" {
  value = {
    for el in boundary_credential_ssh_private_key.credentials_ssh_private_key: 
    el.name => el.id
  }
}

output "credentials_json" {
  value = {
    for el in boundary_credential_json.credentials_json:
    el.name => el.id 
  }
}