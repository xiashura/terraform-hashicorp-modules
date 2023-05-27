variable "politicians" {
  type = map(object({
    path         = string
    capabilities = list(string)
    groups       = list(string)
  }))
}

variable "groups" {
  type = map(object({
    name = string
  }))
}
