output "container_registries" {
  description = "All container_registry resources"
  value       = azurerm_container_registry.container_registries
  sensitive   = true
}
output "container_registries_admin_enabled" {
  description = "List of admin_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.admin_enabled]
}
output "container_registries_admin_password" {
  description = "List of admin_password values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.admin_password]
  sensitive   = true
}
output "container_registries_admin_username" {
  description = "List of admin_username values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.admin_username]
}
output "container_registries_anonymous_pull_enabled" {
  description = "List of anonymous_pull_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.anonymous_pull_enabled]
}
output "container_registries_data_endpoint_enabled" {
  description = "List of data_endpoint_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.data_endpoint_enabled]
}
output "container_registries_data_endpoint_host_names" {
  description = "List of data_endpoint_host_names values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.data_endpoint_host_names]
}
output "container_registries_encryption" {
  description = "List of encryption values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.encryption]
}
output "container_registries_export_policy_enabled" {
  description = "List of export_policy_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.export_policy_enabled]
}
output "container_registries_georeplications" {
  description = "List of georeplications values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.georeplications]
}
output "container_registries_identity" {
  description = "List of identity values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.identity]
}
output "container_registries_location" {
  description = "List of location values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.location]
}
output "container_registries_login_server" {
  description = "List of login_server values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.login_server]
}
output "container_registries_name" {
  description = "List of name values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.name]
}
output "container_registries_network_rule_bypass_option" {
  description = "List of network_rule_bypass_option values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.network_rule_bypass_option]
}
output "container_registries_network_rule_set" {
  description = "List of network_rule_set values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.network_rule_set]
}
output "container_registries_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.public_network_access_enabled]
}
output "container_registries_quarantine_policy_enabled" {
  description = "List of quarantine_policy_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.quarantine_policy_enabled]
}
output "container_registries_resource_group_name" {
  description = "List of resource_group_name values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.resource_group_name]
}
output "container_registries_retention_policy_in_days" {
  description = "List of retention_policy_in_days values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.retention_policy_in_days]
}
output "container_registries_sku" {
  description = "List of sku values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.sku]
}
output "container_registries_tags" {
  description = "List of tags values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.tags]
}
output "container_registries_trust_policy_enabled" {
  description = "List of trust_policy_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.trust_policy_enabled]
}
output "container_registries_zone_redundancy_enabled" {
  description = "List of zone_redundancy_enabled values across all container_registries"
  value       = [for k, v in azurerm_container_registry.container_registries : v.zone_redundancy_enabled]
}

