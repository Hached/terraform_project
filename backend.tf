/*
# Configure the Google Cloud tfstate file location for Qima
terraform {
  backend "gcs" {
    bucket = var.state_bucket
    prefix = "terraform/qima"
  }
}
*/