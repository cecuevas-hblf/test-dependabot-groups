terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      version = "~> 5.37.0"
    }
    tfe = {
      version = "~> 0.58.0"
    }
  }
}
