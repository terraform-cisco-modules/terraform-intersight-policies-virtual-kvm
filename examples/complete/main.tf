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
