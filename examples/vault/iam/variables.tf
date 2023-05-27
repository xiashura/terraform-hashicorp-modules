variable "secrets" {
  default = {
    projects-dev = {
      path     = "projects-dev"
      groups   = "projects-dev-groups"
      services = ["backend", "infra", "frontend"]
    }
  }

}

variable "groups" {
  default = {
    admin-projects = {
      name = "admin-projects"
      groups = [
        "projects-dev-groups-rw",
      ]
    }
    developer-backend = {
      name = "developer-backend"
      policies = [
        "kv2-data-projects-dev-backend-rw",
      ]
    }
    developer-frontend = {
      name = "developer-frontend"
      policies = [
        "kv2-data-projects-dev-frontend-rw",
      ]
    }
    developer-infra = {
      name = "developer-infra"
      policies = [
        "kv2-data-projects-dev-infra-rw",
      ]
    }
    default-user = {
      name     = "user",
      policies = ["user"]
    }
  }
}

variable "politicians" {
  default = {
    user = {
      path   = "kv2/*"
      groups = ["user"]
      capabilities = [
        "list",
      ]
    }

    frontend = {
      path   = "kv2/data/projects-dev/frontend"
      groups = ["developer-frontend"]
      capabilities = [
        "list",
        "read",
        "update"
      ]
    }
    infra = {
      path   = "kv2/data/projects-dev/infra"
      groups = ["developer-infra"]
      capabilities = [
        "list",
        "read",
        "update"
      ]
    }
    backend = {
      path   = "kv2/data/projects-dev/backend"
      groups = ["developer-backend"]
      capabilities = [
        "list",
        "read",
        "update"
      ]
    }
  }
}

variable "users" {
  default = {
    user1 = {
      policy = "user"
      groups = [
        "default-user",
      ]
    }
    admin-projects-dev = {
      policy = "user"
      groups = [
        "admin-projects",
      ]
    }
    devops = {
      policy = "user"
      groups = [
        "developer-infra",
      ]
    }
    backend = {
      policy = "user"
      groups = [
        "developer-backend",
      ]
    }
    frontend = {
      policy = "user"
      groups = [
        "developer-frontend",
      ]
    }
  }

}
