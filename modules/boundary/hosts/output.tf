# output "id" {
#   value = boundary_group.group.id
# }
output "hosts" {
  value = boundary_host_static.hosts.*.id
}