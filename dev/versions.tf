terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      version = "5.37.0" # next minor 5.38.0
    }
    tfe = {
      version = "0.62.0" # next patch 0.58.1
    }
  }
}
