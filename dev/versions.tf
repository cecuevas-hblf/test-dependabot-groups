terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      version = "~> 4.78.0"
    }
    tfe = {
      version = "~> 0.61.0"
    }
  }
}
