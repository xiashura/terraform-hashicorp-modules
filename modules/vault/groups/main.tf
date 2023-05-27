

resource "vault_identity_group" "internal" {

  for_each = var.groups

  name                       = each.value.name
  type                       = "internal"
  external_member_entity_ids = true

  metadata = {
    version = "2"
  }
}


resource "vault_identity_group_member_entity_ids" "groups_members" {


  for_each = var.groups

  exclusive         = true
  member_entity_ids = var.groups_users[each.key].users

  group_id = vault_identity_group.internal[each.key].id

}


resource "vault_identity_group_policies" "policies" {
  for_each  = var.groups
  exclusive = false

  policies = var.groups_politicians[each.key].politicians

  group_id = vault_identity_group.internal[each.key].id
}

resource "vault_identity_group_member_group_ids" "projects_group" {

  for_each  = var.projects
  exclusive = false

  member_group_ids = [
    for key, value in var.groups :
    vault_identity_group.internal[key].id if
    length(value.groups) > 0 &&
    contains(value.groups, each.key)
  ]

  group_id = each.value.id
}
