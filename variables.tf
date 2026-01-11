variable "container_registrys" {
  description = <<EOT
Map of container_registrys, attributes below
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
    admin_enabled                 = optional(bool, false)
    anonymous_pull_enabled        = optional(bool)
    data_endpoint_enabled         = optional(bool)
    export_policy_enabled         = optional(bool, true)
    network_rule_bypass_option    = optional(string, "AzureServices")
    public_network_access_enabled = optional(bool, true)
    quarantine_policy_enabled     = optional(bool)
    retention_policy_in_days      = optional(number)
    tags                          = optional(map(string))
    trust_policy_enabled          = optional(bool, false)
    zone_redundancy_enabled       = optional(bool, false)
    encryption = optional(object({
      identity_client_id = string
      key_vault_key_id   = string
    }))
    georeplications = optional(object({
      location                  = string
      regional_endpoint_enabled = optional(bool)
      tags                      = optional(map(string))
      zone_redundancy_enabled   = optional(bool, false)
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    network_rule_set = optional(object({
      default_action = optional(string, "Allow")
      ip_rule = optional(object({
        action   = string
        ip_range = string
      }))
    }))
  }))
}

