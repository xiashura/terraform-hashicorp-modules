resource "boundary_credential_store_static" "example" {
  name        = var.name
  description = var.description
  scope_id    = var.scope_id
}

resource "boundary_credential_ssh_private_key" "credentials_ssh_private_key" {

  credential_store_id    = boundary_credential_store_static.example.id
  count = length(var.credentials_ssh_private_key)
  name                   = "${keys(var.credentials_ssh_private_key)[count.index]}"
  description            = "${values(var.credentials_ssh_private_key)[count.index].description}"
  username               = "${values(var.credentials_ssh_private_key)[count.index].username}"
  private_key            = "${values(var.credentials_ssh_private_key)[count.index].private_key}" 
  private_key_passphrase = "${values(var.credentials_ssh_private_key)[count.index].private_key_passphrase}" # change to the passphrase of the Private Key if required
}

resource "boundary_credential_username_password" "credentials_username_password" {


  count =  length(var.credentials_username_password)

  name                = "${keys(var.credentials_username_password)[count.index]}"
  description         = "${values(var.credentials_username_password)[count.index].description}"
  credential_store_id = boundary_credential_store_static.example.id
  username            = "${values(var.credentials_username_password)[count.index].description}"
  password            = "${values(var.credentials_username_password)[count.index].description}"
}

# resource "boundary_credential_json" "example" {
#   name                = "example_json"
#   description         = "My first json credential!"
#   credential_store_id = boundary_credential_store_static.example.id
#   object              = file("~/object.json") # change to valid json file
# }