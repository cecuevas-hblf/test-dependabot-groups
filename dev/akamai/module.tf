module "network" {
  source  = "terraform-google-modules/network/google"
  version = "8.0.0"
  # insert the 3 required variables here
}

module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "17.0.0"
  # insert the 2 required variables here
}
