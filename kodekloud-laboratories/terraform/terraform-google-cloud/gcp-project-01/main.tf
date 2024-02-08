# Bucket to store website
resource "google_storage_bucket" "website" {
  provider = google
  name     = "example-rishab-coffee7"
  location = "US"
}
