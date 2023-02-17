variable "type" {

}
variable "name" {
  default = "name"
}

variable "description" {
  default = ""
}

variable "scope_id" {

}

variable "default_port" {
  type = number
  default = 0
}

variable "host_source_ids" {
  type = list(string)
  default = []
}

variable "session_connection_limit" {
  type = string
}

variable "session_max_seconds" {
  type = string 
}

variable "brokered_credential_source_ids" {
  type = list(string)
}