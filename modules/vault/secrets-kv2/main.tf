resource "vault_mount" "kv2" {
  path        = "kv2"
  type        = "kv-v2"
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "services" {
  depends_on = [
    vault_mount.kv2
  ]

  lifecycle {
    ignore_changes = [
      custom_metadata,
      options,
      metadata,
      data,
    ]
  }


  count = length(var.secret.services)

  mount        = vault_mount.kv2.path
  name         = "${var.secret.path}/${var.secret.services[count.index]}"
  disable_read = true

  data_json = jsonencode({})
}


resource "vault_policy" "ro" {
  depends_on = [
    vault_kv_secret_v2.services
  ]

  count = length(var.secret.services)
  name = replace(
    "${vault_kv_secret_v2.services[count.index].id}-ro",
    "/",
    "-",
  )
  policy = <<EOT
 
  path "kv2/data/${var.secret.path}/${var.secret.services[count.index]}" {
    capabilities = ["list","read"]
  }
  EOT
}

resource "vault_policy" "rw" {
  depends_on = [
    vault_kv_secret_v2.services
  ]

  count = length(var.secret.services)
  name = replace(
    "${vault_kv_secret_v2.services[count.index].id}-rw",
    "/",
    "-",
  )
  policy = <<EOT
  path "kv2/data/${var.secret.path}/${var.secret.services[count.index]}" {
    capabilities = ["list","read","update"]
  }
  EOT
}


resource "vault_identity_group" "projects" {
  for_each                   = toset(["rw", "ro"])
  name                       = "${var.secret.group}-${each.value}"
  type                       = "internal"
  external_member_entity_ids = true


  lifecycle {
    ignore_changes = [
      metadata,
      member_group_ids,
      policies,
    ]
  }

  metadata = {
    version = "2"
  }
}

resource "vault_identity_group_policies" "projects-ro" {
  exclusive = true
  group_id  = vault_identity_group.projects["ro"].id
  policies  = [for key, value in vault_policy.ro : value.id]
}


resource "vault_identity_group_policies" "projects-rw" {
  exclusive = true
  group_id  = vault_identity_group.projects["rw"].id
  policies  = [for key, value in vault_policy.rw : value.id]
}
