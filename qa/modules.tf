module "network" {
  source  = "terraform-google-modules/network/google"
  version = "9.3.0"
  # insert the 3 required variables here
}

module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "16.0.1"
  # insert the 2 required variables here
}

