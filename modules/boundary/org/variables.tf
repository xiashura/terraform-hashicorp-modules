variable "name" {
  type = string
}
variable "description" {
  type    = string
  default = ""
}
variable "member_ids" {
  type = list(string)
}
variable "scope_id" {
  type = string
}


