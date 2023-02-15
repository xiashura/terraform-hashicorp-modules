

resource "boundary_role" "role" {
  name = var.name
  description = var.description
  scope_id =  var.scope_id
  grant_scope_id = var.grant_scope_id
  grant_strings = var.grant_strings
  principal_ids  = var.principal_ids

}