
variable "project_id" {
  type        = string
  description = "The unique identifier for the GCP project for resource organization and billing."
  validation {
    condition     = length(var.project_id) > 0
    error_message = "The project_id must not be empty."
  }
}

variable "project_region" {
  type        = string
  description = "The GCP region where the resources will be deployed, impacting latency and compliance."
  validation {
    condition     = length(var.project_region) > 0
    error_message = "The project_region must be specified."
  }
}

variable "repository_name" {
  type        = string
  description = "The name of the Artifact Registry repository."
  validation {
    condition     = length(var.repository_name) > 0
    error_message = "The repository_name must not be empty."
  }
}

variable "artifact_format" {
  type        = string
  description = "The format of artifacts stored in the registry (e.g., DOCKER, MAVEN, NPM)."
  default     = "DOCKER"
  validation {
    condition     = contains(["DOCKER", "MAVEN", "NPM"], var.artifact_format)
    error_message = "Valid values for artifact_format are: DOCKER, MAVEN, NPM."
  }
}
