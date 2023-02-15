
resource "boundary_host_catalog_static" "catalog" {
  name = var.catalog_name
  description = var.catalog_description
  scope_id = var.scope_id_project
}

resource "boundary_host_static" "hosts" {
  count = length(var.hosts)

  address = var.hosts[count.index].address
  description = var.hosts[count.index].description
  name = var.hosts[count.index].name
  type = var.hosts[count.index].type

  host_catalog_id = boundary_host_catalog_static.catalog.id
}