variable "groups" {
  type = map(object({
    name     = string
    policies = optional(list(string), [])
    groups   = optional(list(string), [])
  }))
}

variable "groups_users" {
  type = map(object({
    name  = string
    users = list(string)
  }))
}

variable "projects" {
  type = map(object({
    id     = string
    name   = string
    policy = optional(list(string), [])
  }))
}

variable "groups_politicians" {
  type = map(object({
    name        = string
    politicians = list(string)
  }))
}
