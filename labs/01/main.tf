# crea llaves ssh
resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "local_file" "ssh_private_key_pem" {
  filename          = "../keys/prod/id_rsa"
  sensitive_content = tls_private_key.global_key.private_key_pem
  file_permission   = "0600"
}
resource "local_file" "ssh_public_key_pem" {
  filename          = "../keys/prod/id_rsa.pub"
  sensitive_content = tls_private_key.global_key.public_key_pem
  file_permission   = "0600"
}

output "labs-external-IP" {
  value = "ssh ${var.username}@${google_compute_instance.lab[0].network_interface.0.access_config.0.nat_ip} -i ~/Documents/code/dockerlabs/labs/keys/prod/dockerlabkey"
}


