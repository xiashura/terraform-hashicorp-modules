
resource "vault_policy" "policy" {

  for_each = var.politicians

  name   = each.key
  policy = <<EOT
 
  path "${each.value.path}" {
    capabilities = ["${join("\",\"", each.value.capabilities)}"]
  }
  EOT
}
