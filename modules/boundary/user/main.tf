resource "random_password" "password" {
  length           = 16
  special          = var.special
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "boundary_account_password" "user" {
  auth_method_id = var.auth_method_id
  type           = "password"
  login_name     = var.user
  password       = random_password.password.result
}

resource "boundary_user" "user" {
  name        = var.user
  account_ids = [boundary_account_password.user.id]
  scope_id    = var.scope_id
}
