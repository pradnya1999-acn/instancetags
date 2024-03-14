provider "google" {
#   version = "= 3.55.0"
  credentials = var.sa_key
  project = "parabolic-base-409505"
}
 
variable "sa_key" {
  default =  ""
}

resource "google_compute_instance" "example_instance" {
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "your_zone"

  #tags = ["http-server", "https-server"]
 tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "your_image"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
