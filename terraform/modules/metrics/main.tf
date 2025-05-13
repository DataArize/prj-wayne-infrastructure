resource "google_logging_metric" "compute_decider_logging_metric" {
  name   = var.compute_decider_logging_metric
  filter = var.compute_deider_error_filter
  metric_descriptor {
    metric_kind = var.metric_kind_delta
    value_type  = var.value_type_distribution
    unit        = var.unit
    labels {
      key         = "error"
      value_type  = "STRING"
      description = "amount of error"
    }
  }
  value_extractor = "EXTRACT(jsonPayload.message)"
}
