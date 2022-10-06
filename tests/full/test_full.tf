terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source                    = "../.."
  allow_tunneled_vkvm       = false
  description               = "${var.name} Virtual KVM Policy."
  enable_local_server_video = true
  enable_video_encryption   = true
  enable_virtual_kvm        = true
  maximum_sessions          = 4
  name                      = var.name
  organization              = "terratest"
  remote_port               = 2068
}
