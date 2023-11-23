terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
    #Criar um Bucket na ui 
    backend "gcs" {
      bucket = "rvmterraform"
      prefix = "terraform/state"
    }
}

resource "google_compute_network" "name" {
  name = "terraform-network"
}

resource "google_compute_instance" "terraform" {
    name = "terraform-instance"
    machine_type = "f1-micro"
    zone = "us-central1-a"
    tags = ["prod"]
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
        }
    }
    network_interface {
      network = "terraform-network"
      access_config {
        
      }
    }
}