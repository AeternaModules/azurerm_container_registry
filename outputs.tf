output "container_registries_id" {
  description = "Map of id values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.id }
}
output "container_registries_admin_enabled" {
  description = "Map of admin_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.admin_enabled }
}
output "container_registries_admin_password" {
  description = "Map of admin_password values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.admin_password }
  sensitive   = true
}
output "container_registries_admin_username" {
  description = "Map of admin_username values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.admin_username }
}
output "container_registries_anonymous_pull_enabled" {
  description = "Map of anonymous_pull_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.anonymous_pull_enabled }
}
output "container_registries_data_endpoint_enabled" {
  description = "Map of data_endpoint_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.data_endpoint_enabled }
}
output "container_registries_data_endpoint_host_names" {
  description = "Map of data_endpoint_host_names values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.data_endpoint_host_names }
}
output "container_registries_encryption" {
  description = "Map of encryption values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.encryption }
}
output "container_registries_export_policy_enabled" {
  description = "Map of export_policy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.export_policy_enabled }
}
output "container_registries_georeplications" {
  description = "Map of georeplications values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.georeplications }
}
output "container_registries_identity" {
  description = "Map of identity values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.identity }
}
output "container_registries_location" {
  description = "Map of location values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.location }
}
output "container_registries_login_server" {
  description = "Map of login_server values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.login_server }
}
output "container_registries_name" {
  description = "Map of name values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.name }
}
output "container_registries_network_rule_bypass_option" {
  description = "Map of network_rule_bypass_option values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.network_rule_bypass_option }
}
output "container_registries_network_rule_set" {
  description = "Map of network_rule_set values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.network_rule_set }
}
output "container_registries_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.public_network_access_enabled }
}
output "container_registries_quarantine_policy_enabled" {
  description = "Map of quarantine_policy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.quarantine_policy_enabled }
}
output "container_registries_resource_group_name" {
  description = "Map of resource_group_name values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.resource_group_name }
}
output "container_registries_retention_policy_in_days" {
  description = "Map of retention_policy_in_days values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.retention_policy_in_days }
}
output "container_registries_sku" {
  description = "Map of sku values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.sku }
}
output "container_registries_tags" {
  description = "Map of tags values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.tags }
}
output "container_registries_trust_policy_enabled" {
  description = "Map of trust_policy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.trust_policy_enabled }
}
output "container_registries_zone_redundancy_enabled" {
  description = "Map of zone_redundancy_enabled values across all container_registries, keyed the same as var.container_registries"
  value       = { for k, v in azurerm_container_registry.container_registries : k => v.zone_redundancy_enabled }
}

