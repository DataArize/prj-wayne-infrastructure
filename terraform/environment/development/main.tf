module "bigquery" {
  source               = "../../modules/bigquery"
  project_id           = var.project_id
  project_region       = var.project_region
  service_account_name = var.service_account_name
  owner_email          = var.owner_email
  dataset_name         = var.dataset_name
}
