resource "boundary_target" "target" {
  type = var.type 
  name = var.name 
  description = var.description 
  scope_id = var.scope_id 
  default_port = var.default_port 
  host_source_ids = var.host_source_ids 

  session_connection_limit = var.session_connection_limit
  session_max_seconds = var.session_max_seconds

  brokered_credential_source_ids = var.brokered_credential_source_ids
}