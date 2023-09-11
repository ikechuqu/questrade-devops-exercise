
# Deploying Infrastructure on Google Cloud Platform

This Terraform configuration defines and provisions resources on Google Cloud Platform (GCP), including a custom Virtual Private Cloud (VPC), a virtual machine instance, and a firewall rule to allow SSH access to the instance.

## Prerequisites

You will need the following prerequisites before using this terraform configuration:

- **Terraform Installed:** Ensure that Terraform is installed on your local machine. You can download it from the Terraform website.

- **Google Cloud Platform (GCP) Account:** You need a GCP account and a project to use this configuration. Make sure you have your GCP credentials ready.

- **SSH Key Pair:** You should have an SSH key pair (public and private keys) for SSH access to the virtual machine.
## Configuration Files

- **`providers.tf:`** Specifies the required Terraform provider configuration. It defines the Google Cloud Platform provider (hashicorp/google) and sets the credentials, project, region, and zone for resource provisioning.

- **`vpc.tf:`** Defines the Virtual Private Cloud (VPC) configuration using a Terraform module (terraform-google-modules/network/google). It includes the VPC network, subnet, and regional routing configuration.

- **`vm-instance.tf:`** Defines the virtual machine (VM) instance configuration. It specifies the instance type, boot disk image, network interface configuration, and SSH keys for access. Additionally, it defines a firewall rule to allow SSH access to the instance.

- **`outputs.tf:`** Defines the Terraform outputs, including the external IP address of the provisioned virtual machine instance.

- **`locals.:`** Defines local variables used within the configuration, including instance tags.
## Deployment

**To deploy this project:**

*1. Clone this Git repository to your local machine:*
```bash
  git clone https://github.com/ikechuqu/questrade-devops-exercise.git
```

*2. Create **`terraform.tfvars`** file and set the required variables:*
```hcl
credentials       = "path/to/your/credentials.json"
project-id        = "your-gcp-project-id"
region            = "your-region"
zone              = "your-zone"
subnet_cidr_range = "your-subnet-cidr-range"
ssh_user          = "your-ssh-username"
ssh_key           = "path/to/your/ssh-public-key.pub"
```
*3. Initialize Terraform:*
```bash
terraform init
```

*4. Validate, Plan and Apply:
```bash
terraform validate

terraform plan

terraform apply
```
*Fix any errors from the validation run, review the plan, confirm the proposed changes, and Terrform will provision the resources on GCP.*

*5. Access the Instance:*
After the apply is complete, access the virtual machine instance using SSH. Use the external IP address displayed in the Terraform output:
```bash
ssh -i /path/to/your/ssh-private-key.pem <ssh_user>@<external_ip>
```

*6. Cleanup:*
To destroy the resources, run:
```bash
terraform destroy
```
Confirm the destruction of resources.
## Screenshots

## vpc
![custom_vpc](https://github.com/ikechuqu/questrade-devops-exercise/assets/28604664/7ad2ba6d-6fd3-4c86-b3d9-ab2882dbd7a9)

## subnet
![subnet](https://github.com/ikechuqu/questrade-devops-exercise/assets/28604664/93e384a7-0db7-4c86-b375-372a3b17205c)

## virtual machine instance
![vm_instance](https://github.com/ikechuqu/questrade-devops-exercise/assets/28604664/13635c1b-591b-453e-9d8f-855c9702338b)

## firewall rule
![firewall_rule](https://github.com/ikechuqu/questrade-devops-exercise/assets/28604664/67ed867a-35d3-4767-9e9c-3af20aa55dfb)

## Authors

- [@ikechuqu](https://github.com/ikechuqu)

