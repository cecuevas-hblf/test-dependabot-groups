terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      version = "6.17.0"
    }
    tfe = {
      version = "0.62.0"
    }
  }
}
