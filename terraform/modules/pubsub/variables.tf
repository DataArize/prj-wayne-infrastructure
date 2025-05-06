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
