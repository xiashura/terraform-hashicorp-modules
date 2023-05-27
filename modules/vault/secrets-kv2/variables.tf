variable "secret" {
  type = object({
    path     = string
    group    = string
    services = list(string)
  })
}
