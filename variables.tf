variable "container_registries" {
  description = <<EOT
Map of container_registries, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - admin_enabled
    - anonymous_pull_enabled
    - azuread_authentication_as_arm_policy_enabled
    - data_endpoint_enabled
    - export_policy_enabled
    - network_rule_bypass_for_tasks_enabled
    - network_rule_bypass_option
    - public_network_access_enabled
    - quarantine_policy_enabled
    - retention_policy_in_days
    - role_assignment_mode
    - tags
    - zone_redundancy_enabled
    - encryption (block):
        - identity_client_id (optional)
        - key_vault_key_id (optional)
    - georeplications (block):
        - global_endpoint_routing_enabled (required)
        - location (required)
        - tags (optional)
        - zone_redundancy_enabled (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - network_rule_set (block):
        - default_action (optional)
        - ip_rule (optional, block):
            - action (optional)
            - ip_range (optional)
EOT

  type = map(object({
    location                                     = string
    name                                         = string
    resource_group_name                          = string
    sku                                          = string
    role_assignment_mode                         = optional(string)
    retention_policy_in_days                     = optional(number)
    quarantine_policy_enabled                    = optional(bool)
    public_network_access_enabled                = optional(bool)
    network_rule_bypass_option                   = optional(string)
    export_policy_enabled                        = optional(bool)
    tags                                         = optional(map(string))
    data_endpoint_enabled                        = optional(bool)
    azuread_authentication_as_arm_policy_enabled = optional(bool)
    anonymous_pull_enabled                       = optional(bool)
    admin_enabled                                = optional(bool)
    network_rule_bypass_for_tasks_enabled        = optional(bool)
    zone_redundancy_enabled                      = optional(bool)
    encryption = optional(list(object({
      identity_client_id = optional(string)
      key_vault_key_id   = optional(string)
    })))
    georeplications = optional(list(object({
      global_endpoint_routing_enabled = bool
      location                        = string
      tags                            = optional(map(string))
      zone_redundancy_enabled         = optional(bool)
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    network_rule_set = optional(list(object({
      default_action = optional(string)
      ip_rule = optional(list(object({
        action   = optional(string)
        ip_range = optional(string)
      })))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        length(v.name) <= 50
      )
    ])
    error_message = "[from containerValidate.ContainerRegistryName: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        v.georeplications == null || alltrue([for item in v.georeplications : (item.tags == null || (length(item.tags) <= 50))])
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        v.encryption == null || alltrue([for item in v.encryption : (item.identity_client_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.identity_client_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        v.retention_policy_in_days == null || (v.retention_policy_in_days >= 0 && v.retention_policy_in_days <= 365)
      )
    ])
    error_message = "must be between 0 and 365"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 22 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

