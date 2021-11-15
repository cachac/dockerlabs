resource "google_compute_disk" "dockerlabs_disk01" {
  name  = "dockerlabs-disk01"
  image = data.google_compute_image.master_image.self_link
  size  = var.disk_size
  type  = var.disk_type
  zone  = var.gcp_zone_a
  labels = merge({
    name = var.subdomain
    },
    var.default_tags
  )
}

resource "google_compute_instance" "lab" {
	count 			 = var.instance_count
	name         = var.subdomain
  machine_type = var.machine_type
  zone         = var.gcp_zone_a
  tags         = ["dockerlabs"]
  labels = merge({
    name = var.subdomain
    },
    var.default_tags
  )

  boot_disk {
    source      = google_compute_disk.dockerlabs_disk01.id
    auto_delete = false
  }

  network_interface {
    network    = google_compute_network.dockerlabs_network.id
    subnetwork = google_compute_subnetwork.dockerlabs_subnet.id
    # network_ip = google_compute_address.dockerlabs_internal_address11.address

    # access_config {
    #   nat_ip = google_compute_address.dockerlabs_external_address01.address
    # }
  }
}
