# crea llaves ssh
resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "local_file" "ssh_private_key_pem" {
  filename          = "../../keys/prod/id_rsa"
  sensitive_content = tls_private_key.global_key.private_key_pem
  file_permission   = "0600"
}

output "lab1" {
  value = "ssh ${var.username}@${google_compute_address.lab_external_address01.address} -i ../../prod/keys/id_rsa | ${google_compute_address.lab_internal_address01.address}"
}



