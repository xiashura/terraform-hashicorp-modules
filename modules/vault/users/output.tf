
output "users_ids" {
  value = {
    for key, value in var.users :
    key => {
      groups   = value.groups
      policy   = value.policy
      id       = vault_identity_entity.user[key].id
      id_alias = vault_identity_entity_alias.name[key].id
    }
  }
}


output "groups" {
  value = {
    for key, value in var.groups :
    key => {
      name = value.name
      users = [for Userkey, uservalue in var.users :
        vault_identity_entity.user[Userkey].id
        if length(uservalue.groups) > 0 &&
        contains(uservalue.groups, key)
      ]
    }
  }
}
