// Provider Variables

variable "credentials" {
  type        = string
  description = "GCP service account credentials file path"
  sensitive   = true
}

variable "project-id" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  type        = string
  description = "Resource deployment region"
}

variable "zone" {
  type        = string
  description = "Resource deployment zone"
}

// Network Variables

variable "vpc_name" {
  type        = string
  description = "Custom VPC network"
  default     = "questrade-net"
}

variable "subnets" {
  type = list(object({
    subnet_name   = string
    subnet_ip     = string
    subnet_region = string
  }))
  default = [{
    subnet_name   = ""
    subnet_ip     = ""
    subnet_region = ""
  }]
}

// Virtual Machine

variable "instance_type" {
  type        = string
  description = "Virtual machine instance type"
  default     = "n2-standard-2"
}

variable "instance_image" {
  type        = string
  description = "Virtual machine instance image"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "instance_name" {
  type        = string
  description = "Virtual machine instance name"
  default     = "questrade-server"
}
// SSH Credentials

variable "ssh_user" {
  type        = string
  description = "SSH username"
}

variable "ssh_key" {
  type        = string
  description = "SSH public key file path"
  sensitive   = true
}
