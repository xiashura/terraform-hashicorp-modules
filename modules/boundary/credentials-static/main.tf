resource "boundary_credential_store_static" "example" {
  name        = var.name
  description = var.description
  scope_id    = var.scope_id
}


resource "boundary_credential_username_password" "credentials_username_password" {


  count =  length(var.credentials_username_password)

  name                = "${keys(var.credentials_username_password)[count.index]}"
  description         = "${values(var.credentials_username_password)[count.index].description}"
  credential_store_id = boundary_credential_store_static.example.id
  username            = "${values(var.credentials_username_password)[count.index].description}"
  password            = "${values(var.credentials_username_password)[count.index].description}"
}
