variable "name" {
  type = string
}
variable "description" {
  type    = string
  default = ""
}
variable "scope_id" {
  type    = string
  default = ""
}

variable "global_scope" {
  type    = bool
  default = false
}

variable "auto_create_admin_role" {
  type    = bool
  default = true
}
variable "auto_create_default_role" {
  type    = bool
  default = true
}

variable "password_auth_method" {
  type    = bool
  default = false
}
