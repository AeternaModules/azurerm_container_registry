output "container_registries_id" {
  description = "Map of id values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.id if v.id != null && length(v.id) > 0 }
}
output "container_registries_admin_enabled" {
  description = "Map of admin_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.admin_enabled if v.admin_enabled != null }
}
output "container_registries_admin_password" {
  description = "Map of admin_password values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.admin_password if v.admin_password != null && length(v.admin_password) > 0 }
  sensitive   = true
}
output "container_registries_admin_username" {
  description = "Map of admin_username values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.admin_username if v.admin_username != null && length(v.admin_username) > 0 }
}
output "container_registries_anonymous_pull_enabled" {
  description = "Map of anonymous_pull_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.anonymous_pull_enabled if v.anonymous_pull_enabled != null }
}
output "container_registries_data_endpoint_enabled" {
  description = "Map of data_endpoint_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.data_endpoint_enabled if v.data_endpoint_enabled != null }
}
output "container_registries_data_endpoint_host_names" {
  description = "Map of data_endpoint_host_names values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.data_endpoint_host_names if v.data_endpoint_host_names != null && length(v.data_endpoint_host_names) > 0 }
}
output "container_registries_encryption" {
  description = "Map of encryption values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.encryption if v.encryption != null && length(v.encryption) > 0 }
}
output "container_registries_export_policy_enabled" {
  description = "Map of export_policy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.export_policy_enabled if v.export_policy_enabled != null }
}
output "container_registries_georeplications" {
  description = "Map of georeplications values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.georeplications if v.georeplications != null && length(v.georeplications) > 0 }
}
output "container_registries_identity" {
  description = "Map of identity values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "container_registries_location" {
  description = "Map of location values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.location if v.location != null && length(v.location) > 0 }
}
output "container_registries_login_server" {
  description = "Map of login_server values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.login_server if v.login_server != null && length(v.login_server) > 0 }
}
output "container_registries_name" {
  description = "Map of name values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.name if v.name != null && length(v.name) > 0 }
}
output "container_registries_network_rule_bypass_option" {
  description = "Map of network_rule_bypass_option values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.network_rule_bypass_option if v.network_rule_bypass_option != null && length(v.network_rule_bypass_option) > 0 }
}
output "container_registries_network_rule_set" {
  description = "Map of network_rule_set values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.network_rule_set if v.network_rule_set != null && length(v.network_rule_set) > 0 }
}
output "container_registries_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "container_registries_quarantine_policy_enabled" {
  description = "Map of quarantine_policy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.quarantine_policy_enabled if v.quarantine_policy_enabled != null }
}
output "container_registries_resource_group_name" {
  description = "Map of resource_group_name values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "container_registries_retention_policy_in_days" {
  description = "Map of retention_policy_in_days values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.retention_policy_in_days if v.retention_policy_in_days != null }
}
output "container_registries_sku" {
  description = "Map of sku values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "container_registries_tags" {
  description = "Map of tags values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "container_registries_trust_policy_enabled" {
  description = "Map of trust_policy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.trust_policy_enabled if v.trust_policy_enabled != null }
}
output "container_registries_zone_redundancy_enabled" {
  description = "Map of zone_redundancy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.zone_redundancy_enabled if v.zone_redundancy_enabled != null }
}

