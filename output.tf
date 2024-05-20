output "region" {
  value       = azurerm_resource_group.this.location
  description = "The region in which this module should be deployed"
}

output "azurerm_cognitive_account_id" {
  value       = azurerm_cognitive_account.this.id
  description = "The ID of the Cognitive Service Account"
} 

output "azurerm_cognitive_account_endpoint" {
  value       = azurerm_cognitive_account.this.endpoint
  description = "The endpoint used to connect to the Cognitive Service Account"
} 

output "azurerm_cognitive_account_identity" {
  value       = azurerm_cognitive_account.this.identity
  description = "An identity block as defined below"
} 

output "azurerm_cognitive_account_primary_access_key" {
  value       = azurerm_cognitive_account.this.primary_access_key
  description = "A primary access key which can be used to connect to the Cognitive Service Account"
  sensitive   = true
} 

output "azurerm_cognitive_account_secondary_access_key" {
  value       = azurerm_cognitive_account.this.secondary_access_key
  description = "A secondary access key which can be used to connect to the Cognitive Service Account"
  sensitive   = true
}

output "azurerm_cognitive_deployment" {
  value       = azurerm_cognitive_deployment.this.*
  description = "List of Cognitive Service Deployments"
}

output "azurerm_cognitive_deployment_log_category_types" {
  value       = data.azurerm_monitor_diagnostic_categories.this.log_category_types
  description = "List of Cognitive Service Log Category Types"
}

output "azurerm_cognitive_deployment_log_category_groups" {
  value       = data.azurerm_monitor_diagnostic_categories.this.log_category_groups
  description = "List of Cognitive Service Log Category Groups"
}

output "azurerm_cognitive_deployment_log_metrics" {
  value       = data.azurerm_monitor_diagnostic_categories.this.metrics
  description = "List of Cognitive Service Log Metrics"
}
