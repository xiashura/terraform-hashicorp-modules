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


variable "credentials_ssh_private_key" {
  type = map(object({
    description = optional(string,"")
    username = string
    private_key = string
    private_key_passphrase = optional(string,"") 
  }))
  default = {}
}
