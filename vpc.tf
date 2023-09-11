// Configure custom vpc module
module "vpc" {
  source                  = "terraform-google-modules/network/google"
  version                 = "~> 7.0"
  project_id              = var.project-id
  auto_create_subnetworks = false

  network_name = var.vpc_name
  routing_mode = "REGIONAL"

  subnets = [
    for subnet in var.subnets :
    {
      subnet_name   = subnet.subnet_name
      subnet_ip     = subnet.subnet_ip
      subnet_region = subnet.subnet_region
    }
  ]
}