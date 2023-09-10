// Output VM External IP

output "instance_external_ip" {
  value = google_compute_instance.questrade_instance.network_interface[0].access_config[0].nat_ip
}