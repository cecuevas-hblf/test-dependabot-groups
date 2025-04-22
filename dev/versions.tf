terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      version = "~> 4.85.0"
    }
    tfe = {
      version = "~> 0.65.2"
    }
  }
}
