# Firebase Authentication
resource "google_identity_platform_config" "default" {
  provider = google-beta
  project  = var.project_id
  depends_on = [
    var.services_ready,
  ]
}

resource "google_identity_platform_project_default_config" "default" {
  provider = google-beta
  project  = var.project_id
  sign_in {
    allow_duplicate_emails = true
    anonymous {
      enabled = true
    }
  }
  depends_on = [google_identity_platform_config.default]
}