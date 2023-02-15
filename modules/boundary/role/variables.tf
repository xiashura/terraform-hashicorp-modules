variable "name" {
  type = string
}
variable "description" {
  type = string
  default = "" 
}
variable "scope_id" {
  type = string
}
variable "grant_scope_id" {
  type = string
  default = ""
}
variable "grant_strings" {
  type = list(string)
  default = [ ]
}
variable "principal_ids" {
  type = list(string)
  default = [  ]
}