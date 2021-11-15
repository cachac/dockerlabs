# Networking
resource "google_compute_network" "dockerlabs_network" {
  name = var.vpc_name
}

resource "google_compute_subnetwork" "dockerlabs_subnet" {
  name          = "dockerlabs-subnet"
  ip_cidr_range = var.vpc_ip_range
  region        = var.gcp_region
  network       = google_compute_network.dockerlabs_network.id
}

resource "google_compute_firewall" "dockerlabs_fw_allowall" {
  name    = var.fw_name
  network = google_compute_network.dockerlabs_network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "1000-9999"]
  }

  source_ranges = ["0.0.0.0/0"]
  # source_tags = ["db"]
}
