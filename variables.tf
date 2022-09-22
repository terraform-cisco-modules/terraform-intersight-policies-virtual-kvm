terraform {
  experiments = [module_variable_optional_attrs]
}

#____________________________________________________________
#
# Virtual KVM Policy Variables Section.
#____________________________________________________________

variable "description" {
  default     = ""
  description = "Description for the Policy."
  type        = string
}

variable "enable_local_server_video" {
  default     = true
  description = "If enabled, displays KVM session on any monitor attached to the server."
  type        = bool
}

variable "enable_video_encryption" {
  default     = true
  description = "If enabled, encrypts all video information sent through KVM."
  type        = bool
}

variable "enable_virtual_kvm" {
  default     = true
  description = "Flag to Enable or Disable the Policy."
  type        = bool
}

variable "maximum_sessions" {
  default     = 4
  description = "The maximum number of concurrent KVM sessions allowed. Range is 1 to 4."
  type        = number
}

variable "name" {
  default     = "default"
  description = "Name for the Policy."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "profiles" {
  default     = []
  description = <<-EOT
  List of Profiles to Assign to the Policy.
    * name - Name of the Profile to Assign.
    * object_type - Object Type to Assign in the Profile Configuration.
      - server.Profile - For UCS Server Profiles.
      - server.ProfileTemplate - For UCS Server Profile Templates.
  EOT
  type = list(object(
    {
      moid        = string
      object_type = optional(string)
    }
  ))
}

variable "remote_port" {
  default     = 2068
  description = "The port used for KVM communication. Range is 1 to 65535."
  type        = number
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}
