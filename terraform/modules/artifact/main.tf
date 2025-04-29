
resource "google_artifact_registry_repository" "artifact_registry" {
  location      = var.project_region
  repository_id = var.repository_name
  description   = "Artifact registry name"
  format        = var.artifact_format
}
