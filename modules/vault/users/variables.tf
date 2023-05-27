variable "users" {
  type = map(object({
    groups = list(string)
    policy = optional(string, "deafult")
  }))
}

variable "groups" {
  type = map(object({
    name = string
  }))
}
