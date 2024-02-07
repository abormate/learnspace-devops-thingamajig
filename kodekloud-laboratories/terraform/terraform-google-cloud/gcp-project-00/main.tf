terraform {
     required_providers {
          google = {
               source = "hashicorp/google"
               version = "4.77.0"
          }
     }
}

provider "google" {
     project = "captain-crunch-378412"
     region = "us-central1"
     credentials ="acct-keys.json"
}