output "politicians" {
  value = {

    "${var.secret.group}-rw" = {
      name = "${var.secret.group}-rw"
      politicians = [
        for key, value in vault_policy.rw :
        value.name
      ]
    }
    "${var.secret.group}-ro" = {
      name = "${var.secret.group}-ro"
      politicians = [
        for key, value in vault_policy.ro :
        value.name
      ]
    }
  }
}

# output "policy-rw" {
#   value = [
#     for key, value in vault_policy.rw :
#     value.id
#   ]
# }

# output "policys" {
#   value = merge(
#     {
#       for key, value in vault_policy.ro :
#       vault_identity_group.projects["ro"].name => {
#         name        = vault_identity_group.projects["ro"].name
#         politicians = [value.name]
#       }
#     },
#     {
#       for key, value in vault_policy.rw :
#       key => {
#         name        = vault_identity_group.projects["rw"].name
#         politicians = [value.name]
#       }
#     }
#   )

# }

# output "policys" {
#   value = {
#     for key,value in vault_identity_group.projects:
#     value.name => {
#       name =
#     }
#   }
# }

# output "policy-map-rw" {
#   value = {
#     for key, value in vault_policy.rw:
#     key => {
#       name = value.name
#       politicians = [value.name]
#     }
#   }
# }

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
