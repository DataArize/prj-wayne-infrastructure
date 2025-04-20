resource "google_bigquery_dataset" "bigquery_dataset" {
  dataset_id  = var.dataset_name
  description = var.dataset_description
  location    = var.project_region
  project     = var.project_id

  labels = {
    environment = var.environment
  }
  delete_contents_on_destroy = true

}

resource "google_bigquery_table" "bigquery_table" {
  depends_on = [google_bigquery_dataset.bigquery_dataset]
  for_each   = var.tables

  dataset_id  = google_bigquery_dataset.bigquery_dataset.dataset_id
  table_id    = each.value.table_name
  project     = var.project_id
  description = each.value.table_description
  schema      = file("${path.module}/${each.value.schema_file_path}")

  labels = {
    environment = var.environment
  }

  deletion_protection = false
}
