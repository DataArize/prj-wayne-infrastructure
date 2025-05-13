resource "google_monitoring_notification_channel" "email_channel" {
  display_name = var.email_channel_display_name
  type         = var.channel_type
  labels = {
    email_address = var.email
  }
}

resource "google_monitoring_alert_policy" "cloud_run_function_alert" {
  display_name = var.alert_display_name
  combiner     = var.combiner_type_or

  conditions {
    display_name = var.conditions_display_name
    condition_threshold {
      filter          = var.filter
      duration        = var.alert_duration
      comparison      = var.comparision
      threshold_value = 1
      aggregations {
        alignment_period   = var.alignment_period
        per_series_aligner = var.aligner_mean
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}


resource "google_monitoring_alert_policy" "file-streamer-alert" {
  display_name = var.file_streamer_display_name
  combiner     = var.combiner_type_or

  conditions {
    display_name = var.file_streamer_conditions_display_name
    condition_threshold {
      filter          = var.file_streamer_filter
      duration        = var.alert_duration
      comparison      = var.comparision
      threshold_value = 0
      aggregations {
        alignment_period   = var.alignment_period
        per_series_aligner = var.aligner_mean
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}


resource "google_monitoring_alert_policy" "compute_decider_alert" {
  display_name = var.compute_decider_alert
  combiner     = var.combiner_type_or

  conditions {
    display_name = var.compute_decider_conditions_display_name
    condition_threshold {
      filter          = var.file_streamer_filter
      duration        = var.alert_duration
      comparison      = var.comparision
      threshold_value = 0
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = var.alignment_period
        per_series_aligner = var.aligner_mean
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}
