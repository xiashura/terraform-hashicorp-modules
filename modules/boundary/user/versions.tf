terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.1.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}
