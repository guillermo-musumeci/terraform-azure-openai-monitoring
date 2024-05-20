#########################
## Logging - Resources ##
#########################

# Create an Azure Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "this" {
  name                = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-${var.shortlocation}-log-analytics"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.log_analytics_retention_in_days

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

# Reference Azure Monitor Categories
data "azurerm_monitor_diagnostic_categories" "this" {
  resource_id = azurerm_cognitive_account.this.id
}

# Manages a Diagnostic Setting for an existing OpenAI
resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-${var.shortlocation}-monitor"
  target_resource_id         = azurerm_cognitive_account.this.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  /*enabled_log {
    category_group = "allLogs"
  }*/

  enabled_log {
    category = "RequestResponse"
  }

  metric {
    category = "AllMetrics"
  }
}