

resource "boundary_group" "group" {
  name        = var.name
  description = var.description
  member_ids  = var.member_ids
  scope_id    = var.scope_id
}
