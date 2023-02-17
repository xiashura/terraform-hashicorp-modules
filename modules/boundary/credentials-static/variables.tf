variable "name" {
  type = string
}
variable "description" {
  type    = string
  default = ""
}

variable "scope_id" {
  type = string
}

variable "credentials_username_password" {

  type = map(object({
    description = optional(string,"")
    username = string
    password = string
  }))
  default = {} 
}
