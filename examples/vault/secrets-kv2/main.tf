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



module "secrets" {
  source = "../../../modules/vault/secrets-kv2"

  secret = {
    path     = "test/dev"
    group    = "user1"
    services = ["backend", "frontend", "infra"]
  }

  providers = {
    vault = vault.dev
  }

}



