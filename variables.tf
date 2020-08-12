variable "gcp_auth_file" {
  description = "Contents of GCP service account .json file"
  default     = "terraform.json"
}

variable "gcp_project" {
  description = "Name of GCP project"
  default     = "terraform-project-285816"
}

variable "gcp_region" {
  description = "GCP region"
  default     = "europe-west1"
}

variable "gcp_zone" {
  description = "GCP zone"
  default     = "europe-west1-b"
}

variable "vm_instance_type" {
  description = "GCE machine type"
  default     = "n1-standard-1"
}

variable "vm_instance_name" {
  description = "GCE instance name"
  default     = "vm-instance-qima"
}

variable "ami" {
  description = "AMI image for the instance"
  default     = "ubuntu-1804-bionic-v20200317"
}

variable "db_instance_name" {
  description = "Cloud SQL instance name"
  default     = "db-instance-qima3"
}

variable "db_instance_type" {
  description = "Cloud SQL instance type"
  default     = "db-f1-micro"
}

variable "postgres_engine_version" {
  description = "Cloud SQL Postgres engine version"
  default     = "POSTGRES_11"
}

variable "labels"{
    default = {
        env = "test"
    }
}

variable "instance_public_key" {
  default = "~/.ssh/gcp.pub"
}

variable "instance_private_key" {
  default = "~/.ssh/gcp"
}

variable "user" {
  default = "ahmed"
}

variable "public_subnet" {
  default = "10.26.2.0/24"
}



