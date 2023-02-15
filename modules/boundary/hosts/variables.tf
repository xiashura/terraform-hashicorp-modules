variable "catalog_name"{
  type = string
}

variable "catalog_description"{
  type = string
  default =  ""
}

variable "scope_id_project"{
  type = string
}

variable "hosts" {
  type = list(object({
    address = string
    description = optional(string,"") 
    name = string
    type = string
  }))
}