variable "compute_decider_logging_metric" {
  type        = string
  description = "Name of the logging metric"

}

variable "compute_deider_error_filter" {
  type        = string
  default     = <<EOT
    resource.type = "cloud_run_revision"
    resource.labels.service_name = "prj-wayne-compute-decider"
    resource.labels.location = "us-central1"
    severity >= ERROR
  EOT
  description = "Error filter for compute decider"
}

variable "metric_kind_delta" {
  type        = string
  default     = "DELTA"
  description = "Metric kind delta"
}

variable "value_type_distribution" {
  type        = string
  default     = "DISTRIBUTION"
  description = "value type distribution"
}

variable "unit" {
  type        = string
  default     = "1"
  description = "No of units to check before throwing an alert"
}
