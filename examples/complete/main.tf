module "virtual_kvm" {
  source  = "terraform-cisco-modules/policies-virtual-kvm/intersight"
  version = ">= 1.0.1"

  description  = "default Virtual KVM Policy."
  name         = "default"
  organization = "default"
}
