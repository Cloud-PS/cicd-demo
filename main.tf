provider "google" {
    project = "applied-card-324806"
    region = "us-central1"
    zone = "us-central1-c"
}


resource "google_compute_instance" "lamp-stack" {
  name         = "yogesh"
  machine_type = "e2-standard-2"
  zone         = "us-central1-c"
  tags = ["firewall-http"]
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20210825"   
      size = 20
      type = "pd-standard"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // empty access_config assigns a public ip to the instance
    }
  }
  metadata_startup_script = "sudo apt update -y && sudo apt install apache2 -y && cd /var/www/html && sudo su && rm index.html && echo \"<title> Hello </title>  <body> hello </body>\"  > index.html && echo done"
}


resource "google_compute_firewall" "http" {
  name    = "firewall-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["firewall-http"]
}
