
terraform {
  backend "gcs" {
    bucket = "prj-wayne-terraform-backend"
    prefix = "terraform/state"
  }
}
