terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      version = "6.19.0"
    }
    tfe = {
      version = "0.63.0"
    }
  }
}
