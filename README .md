
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
After the apply is complete, access the virtual machine instance to using SSH. Use the external IP address displayed in the Terraform out:
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

![Questrade_exercise_vpc_subnet_vm_firewall_rule](https://github.com/ikechuqu/questrade-devops-exercise/assets/28604664/efe93ade-6ff6-482b-8882-9647da19adcb)

## Authors

- [@ikechuqu](https://github.com/ikechuqu)

