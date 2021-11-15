gcp_account_json = "keys/prod/dockerlabs_key.json"

# Project to deploy resources into
gcp_project = "dockerlabs-332203"

# GCP region for all resources
gcp_region = "us-east1"

# GCP zone for all resources
gcp_zone_a = "us-east1-b"
gcp_zone_b = "us-east1-c"
gcp_zone_c = "us-east1-d"

# Prefix for all resources
prefix = "lab-"

# Compute instance size of all created instances
# 1cpu-600mb
machine_type = "f1-micro"
# 1cpu-1.7gb = $13.80
# machine_type = "g1-small"
# 2cpu-1gb
# machine_type = "e2-micro"
# 2cpu-2ram = $12.23
# machine_type = "e2-small"
# 2cpu-4ram = $25
# machine_type = "e2-medium"

# Disk
disk_size = "10"
disk_type = "pd-standard"

domain       = "dockerlabs"
subdomain   = "lab"
username     = "dockerlab"
fullname     = "Carlos Ch"
host_prefix  = "lab"
vpc_name     = "dockerlabs-network"
vpc_ip_range = "10.0.0.0/24"
ip_lab   = "10.0.0.11"
fw_name      = "fw-dockerlabs"


default_tags = {
  team = "cenfotec"
  user = "docker"
  env  = "production"
}



