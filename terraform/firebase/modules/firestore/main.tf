# Firebase Firestore
resource "google_firestore_database" "default" {
  project                     = var.project_id
  name                        = "(default)"
  location_id                 = var.location
  type                        = "FIRESTORE_NATIVE"
  concurrency_mode            = "OPTIMISTIC"
  app_engine_integration_mode = "DISABLED"

  depends_on = [
    var.services_ready
  ]
}

# Firebase Cloud Firestore コレクション／ドキュメント定義
resource "google_firestore_document" "app_config_doc" {
  project     = var.project_id
  collection  = "app_config"
  document_id = "app_config_doc"
  fields      = file("${path.module}/app_config_document.json")
  depends_on  = [google_firestore_database.default]
}
