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

variable "address" {
  type = string 
}

variable "token" {
  type = string
}


variable "credentials_ssh_cert" {
  type = map(object({
    description = optional(string,"")
    path = string
    username = string
    key_type = string
    key_bits = number
  }))
  default = {}
}


variable "credentials_library_vault" {
  type = map(object({
    description = optional(string,"")
    path = string
    http_method = string
  }))
  default = {}
}

