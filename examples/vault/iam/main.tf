terraform {
  required_providers {
    vault = {

      source  = "hashicorp/vault"
      version = "3.15.2"
    }
  }
}


variable "vault_addr" {}
variable "vault_port" {}
variable "vault_token" {}

provider "vault" {
  alias   = "dev"
  address = "${var.vault_addr}:${var.vault_port}"
  token   = var.vault_token
}


module "projects-dev" {
  source = "../../../modules/vault/secrets-kv2"

  secret = {
    path     = var.secrets.projects-dev.path
    group    = var.secrets.projects-dev.groups
    services = var.secrets.projects-dev.services
  }
  providers = {
    vault = vault.dev
  }
}

module "vault-roles" {
  source = "../../../modules/vault/roles"

  providers = {
    vault = vault.dev
  }

  politicians = var.politicians
  groups      = var.groups
}

module "vault-groups" {
  source = "../../../modules/vault/groups"

  groups       = var.groups
  groups_users = module.vault-users.groups
  groups_politicians = merge(
    module.vault-roles.groups,
    module.projects-dev.politicians
  )
  projects = {
    "${module.projects-dev.group-ro.name}" = module.projects-dev.group-ro
    "${module.projects-dev.group-rw.name}" = module.projects-dev.group-rw
  }

  providers = {
    vault = vault.dev
  }
}

output "qweqe" {
  value = module.projects-dev.politicians
}

module "vault-users" {
  source = "../../../modules/vault/users"

  providers = {
    vault = vault.dev
  }

  users  = var.users
  groups = var.groups
}



