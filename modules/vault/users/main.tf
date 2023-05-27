resource "random_password" "passwords" {
  for_each = var.users
  special  = false
  length   = 12
}

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "user" {

  for_each = var.users

  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/${each.key}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "password": "${random_password.passwords[each.key].result}"
}
EOT
}

resource "vault_identity_entity" "user" {

  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }

  for_each = var.users
  name     = each.key
  policies = [each.value.policy]

}

resource "vault_identity_entity_alias" "name" {

  lifecycle {
    ignore_changes = [
      custom_metadata,
    ]
  }


  depends_on = [
    vault_generic_endpoint.user,
    vault_identity_entity.user,
  ]

  for_each       = var.users
  name           = each.key
  canonical_id   = vault_identity_entity.user[each.key].id
  mount_accessor = vault_auth_backend.userpass.accessor
}

