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
