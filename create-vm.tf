resource "google_compute_instance" "terraform" {
    project = "rvm-devops-iac"
    name = "terraform"
    machine_type = "n1-standard-1"  
    zone = "us-central1-a"
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
        }
    }
    network_interface {
      network = "default"
      access_config {
        
      }
    }
    metadata = {
    startup-script = <<-SCRIPT
      #!/bin/bash
      apt-get update
      apt-get install -y apache2  # Exemplo de instalação do Apache, substitua conforme necessário
      reboot
    SCRIPT
  }
}