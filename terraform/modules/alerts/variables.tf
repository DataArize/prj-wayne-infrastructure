variable "email_channel_display_name" {
  description = "The display name for the email notification channel."
  type        = string
  default     = "Email Notifications"
}

variable "channel_type" {
  description = "The type of notification channel. Default is 'email'."
  type        = string
  default     = "email"
}

variable "email" {
  description = "The recipient email address for notifications."
  type        = string
  validation {
    condition     = length(var.email) > 0 && can(regex("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$", var.email))
    error_message = "The email must be a valid email address."
  }
}

variable "alert_display_name" {
  description = "The display name for the Cloud Run function alert policy."
  type        = string
  default     = "Cloud Run Function Uptime Alert"
}

variable "combiner_type_or" {
  description = "The combiner type for alert conditions (e.g., OR, AND)."
  type        = string
  default     = "OR"
}

variable "conditions_display_name" {
  description = "The display name for the alert condition."
  type        = string
  default     = "Cloud Run Function Uptime Condition"
}

variable "filter" {
  description = "The monitoring filter expression for Cloud Run function uptime."
  type        = string
  default     = "resource.type=\"cloud_function\" AND resource.labels.function_name=\"prj-wayne-compute-decider\" AND metric.type=\"cloudfunctions.googleapis.com/function/execution_count\" AND metric.label.\"status\"=\"error\""
}

variable "alert_duration" {
  description = "The duration for which the condition must be met before triggering an alert."
  type        = string
  default     = "60s"
}

variable "comparision" {
  description = "The comparison operator for the alert condition (e.g., COMPARISON_GT, COMPARISON_LT)."
  type        = string
  default     = "COMPARISON_GT"
}

variable "alignment_period" {
  description = "The time period for aligning data points in alert aggregation."
  type        = string
  default     = "60s"
}

variable "aligner_mean" {
  description = "The aligner type used for aggregating time-series data."
  type        = string
  default     = "ALIGN_MEAN"
}
