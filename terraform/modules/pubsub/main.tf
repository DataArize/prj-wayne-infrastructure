resource "google_pubsub_schema" "schema" {
  name       = var.schema_name
  type       = var.schema_type
  definition = file("${path.module}/avro-schema.json")
}

resource "google_pubsub_topic" "topic" {
  name       = var.topic_name
  depends_on = [google_pubsub_schema.schema]
  labels = {
    environment = var.environment_pubsub
  }
  message_retention_duration = var.message_retention_duration
}

resource "google_pubsub_topic" "deadletter" {
  name       = var.deadletter_name
  depends_on = [google_pubsub_schema.schema]
  labels = {
    environment = var.environment_pubsub
  }
  message_retention_duration = var.message_retention_duration
}
