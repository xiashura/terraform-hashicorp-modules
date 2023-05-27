output "policy-ro" {
  value = [
    for key, value in vault_policy.ro :
    value.id
  ]
}

output "policy-rw" {
  value = [
    for key, value in vault_policy.rw :
    value.id
  ]
}

output "group-ro" {
  value = {
    name = vault_identity_group.projects["ro"].name
    id   = vault_identity_group.projects["ro"].id
    policy = [
      for key, value in vault_policy.ro :
      value.id
    ]
  }
}


output "group-rw" {
  value = {
    name = vault_identity_group.projects["rw"].name
    id   = vault_identity_group.projects["rw"].id
    policy = [
      for key, value in vault_policy.ro :
      value.id
    ]
  }
}
