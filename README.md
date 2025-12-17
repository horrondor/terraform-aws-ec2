# Terraform-aws-ec2

This module can create one or multiple EC2 instances with configurable instance type, AMI, and availability zone.

---

## Features

- Create EC2 instances in a specific AZ
- Specify number of instances
- Use a custom AMI ID
- Set instance name and key pair
- Easily reusable module for dev/staging/prod

---


### Example: Using the module with variables


```hcl
data "aws_ami" "cloud_raju" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}





module "my_ec2_instance" {

  source  = "horrondor/ec2/aws"
  version = "1.0.3"

  ec2_instance_type  = var.ec2_instance_type
  ec2_instance_name  = var.ec2_instance_name
  ec2_no_of_instance = var.ec2_no_of_instance
  ec2_zone_name      = var.ec2_zone_name
  ec2_key_name       = var.ec2_key_name
  ec2_ami_id         = data.aws_ami.cloud_raju.id

}












