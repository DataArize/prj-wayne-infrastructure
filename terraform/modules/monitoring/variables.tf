
variable "uptime_display_name" {
  description = "The display name for the uptime check."
  type        = string
  default     = "prj-wayne-compute-decider-uptime-check"
}

variable "uptime_timeout" {
  description = "Timeout duration for the uptime check (e.g., \"10s\")."
  type        = string
}

variable "timeout_period" {
  description = "Timeout period for the uptime check (e.g., \"10s\")."
  type        = string
}

variable "request_method_get" {
  description = "HTTP request method to be used for the uptime check."
  type        = string
  default     = "GET"
}

variable "path" {
  description = "The root path for the uptime check request."
  type        = string
  default     = "/"
}

variable "default_port" {
  description = "The default port to be used by the uptime check."
  type        = string
  default     = "443"
}

variable "cloud_run_revision" {
  description = "The type of monitored resource. Typically, this is 'uptime_url' for HTTP uptime checks."
  type        = string
  default     = "cloud_run_revision"
}

variable "project_id" {
  description = "The unique identifier for the GCP project for resource organization and billing."
  type        = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "The project_id must not be empty."
  }
}

variable "project_region" {
  type        = string
  description = "the gcp region where the resources will be deployed, impacting latency and compliance."
  validation {
    condition     = length(var.project_region) > 0
    error_message = "the project_region must be specified."
  }
}

variable "service_name" {
  type        = string
  description = "Service name to monitor"

}
