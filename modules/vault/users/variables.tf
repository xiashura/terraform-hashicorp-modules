variable "users" {
  type = map(object({
    groups = list(string)
    policy = optional(string, "default")
  }))
}

variable "groups" {
  type = map(object({
    name = string
  }))
}
