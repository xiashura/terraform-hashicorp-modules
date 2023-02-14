resource "boundary_scope" "project" {
  name                     = var.name
  description              = var.description
  global_scope             = var.global_scope
  scope_id                 = var.scope_id
  auto_create_admin_role   = var.auto_create_admin_role
  auto_create_default_role = var.auto_create_default_role
}

resource "boundary_auth_method" "password" {
  count    = var.password_auth_method ? 1 : 0
  name     = "auth-password"
  scope_id = boundary_scope.project.id
  type     = "password"
}
