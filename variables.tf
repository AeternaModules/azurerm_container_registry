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
    - data_endpoint_enabled
    - export_policy_enabled
    - network_rule_bypass_option
    - public_network_access_enabled
    - quarantine_policy_enabled
    - retention_policy_in_days
    - tags
    - trust_policy_enabled
    - zone_redundancy_enabled
    - encryption (block):
        - identity_client_id (required)
        - key_vault_key_id (required)
    - georeplications (block):
        - location (required)
        - regional_endpoint_enabled (optional)
        - tags (optional)
        - zone_redundancy_enabled (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - network_rule_set (block):
        - default_action (optional)
        - ip_rule (optional, block):
            - action (required)
            - ip_range (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    admin_enabled                 = optional(bool) # Default: false
    anonymous_pull_enabled        = optional(bool)
    data_endpoint_enabled         = optional(bool)
    export_policy_enabled         = optional(bool)   # Default: true
    network_rule_bypass_option    = optional(string) # Default: "AzureServices"
    public_network_access_enabled = optional(bool)   # Default: true
    quarantine_policy_enabled     = optional(bool)
    retention_policy_in_days      = optional(number)
    tags                          = optional(map(string))
    trust_policy_enabled          = optional(bool) # Default: false
    zone_redundancy_enabled       = optional(bool) # Default: false
    encryption = optional(object({
      identity_client_id = string
      key_vault_key_id   = string
    }))
    georeplications = optional(object({
      location                  = string
      regional_endpoint_enabled = optional(bool)
      tags                      = optional(map(string))
      zone_redundancy_enabled   = optional(bool) # Default: false
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    network_rule_set = optional(object({
      default_action = optional(string) # Default: "Allow"
      ip_rule = optional(object({
        action   = string
        ip_range = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_registries : (
        v.encryption == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.encryption.identity_client_id)))
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
  # --- Unconfirmed validation candidates, derived from azurerm_container_registry's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from containerValidate.ContainerRegistryName] !regexp.MustCompile(`^[a-zA-Z0-9]+$`).MatchString(value)
  # path: name
  #   source:    [from containerValidate.ContainerRegistryName] 5 > len(value)
  # path: name
  #   condition: length(value) <= 50
  #   message:   [from containerValidate.ContainerRegistryName: invalid when len(value) > 50]
  #   source:    [from containerValidate.ContainerRegistryName: invalid when len(value) > 50]
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: georeplications.location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: georeplications.tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: georeplications.tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: georeplications.tags
  #   source:    [from tags.Validate] err != nil
  # path: georeplications.tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: encryption.key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: encryption.key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: network_rule_set.default_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_rule_set.ip_rule.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_rule_set.ip_rule.ip_range
  #   source:    [from validate.CIDR] re != nil && !re.MatchString(cidr)
  # path: network_rule_bypass_option
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

