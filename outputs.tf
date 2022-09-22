#____________________________________________________________
#
# Collect the moid of the Virtual KVM Policy as an Output
#____________________________________________________________

output "moid" {
  description = "Virtual KVM Policy Managed Object ID (moid)."
  value       = intersight_kvm_policy.virtual_kvm.moid
}
