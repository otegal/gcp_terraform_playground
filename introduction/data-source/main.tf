data "google_compute_zones" "available" {
  region = "asia-northeast1"
  status = "UP"
}

resource "google_compute_instance" "default" {
  name         = "test-instance"
  machine_type = "f1-micro"
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}
