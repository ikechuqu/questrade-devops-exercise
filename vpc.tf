// Configure custom vpc module
module "vpc" {
  source =  "terraform-google-modules/network/google"
  version = "~> 7.0"
  project_id = var.project-id
  auto_create_subnetworks = false

  network_name = var.vpc_name
  routing_mode = "REGIONAL"

  subnets = [
    {
        subnet_name = var.subnet_name
        subnet_ip = var.subnet_cidr_range
        subnet_region = var.region
    }
  ]
}