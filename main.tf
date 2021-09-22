provider "google" {
    project = "applied-card-324806"
    region = "us-central1"
    zone = "us-central1-c"
}


resource "google_compute_instance" "lamp-stack" {
  name         = "yogesh-2"
  machine_type = "e2-standard-2"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20210825"   
    }
  }
  network_interface {
    network = "default"
  }
  
}

