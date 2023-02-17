resource "boundary_credential_store_vault" "credential_store_vault" {
  name        = var.name
  description = var.description
  address     = var.address
  token       = var.takon
  scope_id    = var.scope_id
}


resource "boundary_credential_library_vault" "credentials_library_vault" {

  credential_store_id = credential_store_vault.id
  count = length(var.credentials_library_vault)

  name                = "${keys(var.credentials_library_vault)[count.index]}"
  description         = "${values(var.credentials_library_vault)[count.index].description}"
  path                = "${values(var.credentials_library_vault)[count.index].path}" 
  http_method         = "${values(var.credentials_library_vault)[count.index].http_method}"
}

resource "boundary_credential_library_vault_ssh_certificate" "credentials_ssh_cert" {

  credential_store_id = boundary_credential_store_vault.foo.id
  count = length(var.credentials_ssh_cert)

  name                = "${keys(var.credentials_ssh_cert)[count.index]}"
  description         = "${values(var.credentials_ssh_cert)[count.index].description}"
  path                = "${values(var.credentials_ssh_cert)[count.index].path}"
  username            = "${values(var.credentials_ssh_cert)[count.index].username}"
  key_type            = "${values(var.credentials_ssh_cert)[count.index].key_type}"
  key_bits            = "${values(var.credentials_ssh_cert)[count.index].key_bits}"

}