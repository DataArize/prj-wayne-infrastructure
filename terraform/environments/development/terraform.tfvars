access_prevention_policy   = "enforced"
nearline_storage_age       = 31
coldline_storage_age       = 62
archive_storage_age        = 94
delete_age                 = 128
schema_type                = "AVRO"
message_retention_duration = "86600s"
uptime_timeout             = "60s"
timeout_period             = "900s"
compute_decider_filter     = "resource.type = \"cloud_function\" AND resource.labels.function_name = \"prj-wayne-compute-decider\" AND metric.type = \"cloudfunctions.googleapis.com/function/execution_count\" AND metric.labels.result = \"failed\""
