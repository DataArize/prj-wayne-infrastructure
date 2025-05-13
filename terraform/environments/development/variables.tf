variable "dataset_name" {
  type        = string
  description = "Name of the BigQuery dataset for storing Spotify playlist data."
}

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

variable "service_account_name" {
  type        = string
  description = "The name of the service account used for resource access."
  validation {
    condition     = length(var.service_account_name) > 0
    error_message = "The service_account_name must not be empty."
  }
}

variable "delete_age" {
  type        = number
  description = "The duration, in days, after which objects in the storage bucket are eligible for deletion. This helps in managing storage costs and compliance."
}

variable "access_prevention_policy" {
  type        = string
  description = "The access prevention policy for the storage bucket. This policy can restrict access to ensure data security, especially for sensitive data."
}

variable "nearline_storage_age" {
  type        = number
  description = "The duration, in days, that objects must remain in Nearline storage class before they can be deleted. Nearline is suitable for data that is accessed less than once a month."
}

variable "coldline_storage_age" {
  type        = number
  description = "The duration, in days, that objects must remain in Coldline storage class before they can be deleted. Coldline is suitable for data that is accessed less than once a year."
}

variable "archive_storage_age" {
  type        = number
  description = "The duration, in days, that objects must remain in Archive storage class before they can be deleted. Archive is suitable for data that is rarely accessed and stored for long-term retention."
}

variable "environment" {
  type        = string
  default     = "development"
  description = "Deployment environment (e.g., development, testing, production)."
  validation {
    condition     = contains(["development", "testing", "production"], var.environment)
    error_message = "Environment must be 'development', 'testing', or 'production'."
  }
}

variable "storage_bucket" {
  type        = string
  description = "The name of the Google Cloud Storage bucket where datasets will be stored. It must be globally unique across GCP."
}

variable "logging_bucket" {
  type        = string
  description = "The name of the Google Cloud Storage bucket where logs will be stored. It must be globally unique across GCP."
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

variable "schema_name" {
  type        = string
  description = "The name of the schema to be used."
}

variable "schema_type" {
  type        = string
  description = "The type or category of the schema."
}

variable "topic_name" {
  type        = string
  description = "The name of the topic to be used."
}

variable "environment_pubsub" {
  type        = string
  default     = "development"
  description = "Deployment environment (e.g., development, testing, production)."
  validation {
    condition     = contains(["development", "testing", "production"], var.environment_pubsub)
    error_message = "Environment must be 'development', 'testing', or 'production'."
  }
}

variable "message_retention_duration" {
  type        = string
  description = "The duration for which messages in the topic are retained (e.g., 7d for seven days)."
  validation {
    condition     = can(regex("^(\\d+[smhd])$", var.message_retention_duration))
    error_message = "The retention duration must be specified in a valid format (e.g., '10s', '2m', '7d')."
  }
}

variable "deadletter_name" {
  type        = string
  description = "The name of the topic to be used."
}

variable "uptime_timeout" {
  description = "Timeout duration for the uptime check (e.g., \"10s\")."
  type        = string
}

variable "timeout_period" {
  description = "Timeout period for the uptime check (e.g., \"10s\")."
  type        = string
}

variable "service_name" {
  type        = string
  description = "Service name to monitor"
}

variable "email" {
  description = "The recipient email address for notifications."
  type        = string
  validation {
    condition     = length(var.email) > 0 && can(regex("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$", var.email))
    error_message = "The email must be a valid email address."
  }
}

variable "compute_decider_alert" {
  description = "The display name for the Cloud Run function alert policy."
  type        = string
  default     = "Compute Decider Alert"
}


variable "compute_decider_conditions_display_name" {
  description = "The display name for the alert condition."
  type        = string
  default     = "Compute Decider Alert Condition"
}

variable "compute_decider_logging_metric" {
  type        = string
  description = "Name of the logging metric"

}
