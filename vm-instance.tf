// Virtual machine instance

resource "google_compute_instance" "questrade_instance" {
  name = var.instance_name
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    network = module.vpc.network_id
    subnetwork = module.vpc.subnets["northamerica-northeast2/questrade-subnet"]["name"]

    access_config {
      
    }
  }

  scheduling {
    automatic_restart = false
    preemptible = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_key)}"
  }

  tags = local.instance_tags

}

// Firewall rule to allow SSH access to instance

resource "google_compute_firewall" "allow_ssh_access" {
  project = var.project-id
  name = "allow-ssh-to-vm"
  network = module.vpc.network_id

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = local.instance_tags
}