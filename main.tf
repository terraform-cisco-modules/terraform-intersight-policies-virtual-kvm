#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Intersight UCS Server Profile(s) Data Source
# GUI Location: Profiles > UCS Server Profiles > {Name}
#____________________________________________________________

data "intersight_server_profile" "profiles" {
  for_each = { for v in local.profiles : v.name => v if v.object_type == "server.Profile" }
  name     = each.value.name
}

#__________________________________________________________________
#
# Intersight UCS Server Profile Template(s) Data Source
# GUI Location: Templates > UCS Server Profile Templates > {Name}
#__________________________________________________________________

data "intersight_server_profile_template" "templates" {
  for_each = { for v in local.profiles : v.name => v if v.object_type == "server.ProfileTemplate" }
  name     = each.value.name
}

#__________________________________________________________________
#
# Intersight Virtual KVM Policy
# GUI Location: Policies > Create Policy > Virtual KVM
#__________________________________________________________________

resource "intersight_kvm_policy" "virtual_kvm" {
  depends_on = [
    data.intersight_server_profile.profiles,
    data.intersight_server_profile_template.templates
  ]
  description               = var.description != "" ? var.description : "${var.name} Virtual KVM Policy."
  enable_local_server_video = var.enable_local_server_video
  enable_video_encryption   = var.enable_video_encryption
  enabled                   = var.enable_virtual_kvm
  maximum_sessions          = var.maximum_sessions
  name                      = var.name
  remote_port               = var.remote_port
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "profiles" {
    for_each = local.profiles
    content {
      moid = length(regexall("server.ProfileTemplate", profiles.value.object_type)
        ) > 0 ? data.intersight_server_profile_template.templates[profiles.value.name].results[0
      ].moid : data.intersight_server_profile.profiles[profiles.value.name].results[0].moid
      object_type = profiles.value.object_type
    }
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
