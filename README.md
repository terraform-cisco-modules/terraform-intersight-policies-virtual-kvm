<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Policies - Virtual KVM
Manages Intersight Virtual KVM Policies

Location in GUI:
`Policies` » `Create Policy` » `Virtual KVM`

## Example

### main.tf
```hcl
module "vkvm_policy" {
  source  = "terraform-cisco-modules/policies-virtual-kvm/intersight"
  version = ">= 1.0.1"

  description  = "default Virtual KVM Policy."
  name         = "default"
  organization = "default"
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

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### Environment Variables

Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the Policy. | `string` | `""` | no |
| <a name="input_enable_local_server_video"></a> [enable\_local\_server\_video](#input\_enable\_local\_server\_video) | If enabled, displays KVM session on any monitor attached to the server. | `bool` | `true` | no |
| <a name="input_enable_video_encryption"></a> [enable\_video\_encryption](#input\_enable\_video\_encryption) | If enabled, encrypts all video information sent through KVM. | `bool` | `true` | no |
| <a name="input_enable_virtual_kvm"></a> [enable\_virtual\_kvm](#input\_enable\_virtual\_kvm) | Flag to Enable or Disable the Policy. | `bool` | `true` | no |
| <a name="input_maximum_sessions"></a> [maximum\_sessions](#input\_maximum\_sessions) | The maximum number of concurrent KVM sessions allowed. Range is 1 to 4. | `number` | `4` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Policy. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | List of Profiles to Assign to the Policy.<br>  * name - Name of the Profile to Assign.<br>  * object\_type - Object Type to Assign in the Profile Configuration.<br>    - server.Profile - For UCS Server Profiles.<br>    - server.ProfileTemplate - For UCS Server Profile Templates. | <pre>list(object(<br>    {<br>      moid        = string<br>      object_type = optional(string)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_remote_port"></a> [remote\_port](#input\_remote\_port) | The port used for KVM communication. Range is 1 to 65535. | `number` | `2068` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | Virtual KVM Policy Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_kvm_policy.virtual_kvm](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kvm_policy) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [intersight_server_profile.profiles](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/server_profile) | data source |
| [intersight_server_profile_template.templates](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/server_profile_template) | data source |
<!-- END_TF_DOCS -->