resource "google_monitoring_uptime_check_config" "cloud_run_function_uptime" {
  display_name = var.uptime_display_name
  timeout      = var.uptime_timeout
  period       = var.timeout_period

  http_check {
    request_method = var.request_method_get
    path           = var.path
    port           = var.default_port
    use_ssl        = true
    service_agent_authentication {
      type = "OIDC_TOKEN"
    }
  }

  monitored_resource {
    type = var.cloud_run_revision
    labels = {
      project_id   = var.project_id
      location     = var.project_region
      service_name = var.service_name
    }
  }
}
