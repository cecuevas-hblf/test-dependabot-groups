terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 5.37.0"
    }
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.58.0"
    }
  }
}
