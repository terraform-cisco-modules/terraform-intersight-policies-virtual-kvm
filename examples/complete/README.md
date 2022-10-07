<!-- BEGIN_TF_DOCS -->
# Virtual KVM Policy Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
module "virtual_kvm" {
  source  = "terraform-cisco-modules/policies-virtual-kvm/intersight"
  version = ">= 1.0.1"

  allow_tunneled_vkvm       = false
  description               = "default Virtual KVM Policy."
  enable_local_server_video = true
  enable_video_encryption   = true
  enable_virtual_kvm        = true
  maximum_sessions          = 4
  name                      = "default"
  organization              = "default"
  remote_port               = 2068
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```
<!-- END_TF_DOCS -->