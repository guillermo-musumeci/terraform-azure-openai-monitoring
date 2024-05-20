######################
## Common Resources ##
######################

# Create the Resource Group
resource "azurerm_resource_group" "this" {
  name     = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-${var.shortlocation}-rg"
  location = var.location

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

# Access information about an existing User Assigned Identity
resource "azurerm_user_assigned_identity" "this" {
  name     = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-${var.shortlocation}-identity"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

####################################
## Cognitive Services - Resources ##
####################################

# Create the Azure Cognitive Account
resource "azurerm_cognitive_account" "this" {
  name                = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-${var.shortlocation}-aca"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = var.cognitive_account_kind_name
  sku_name            = var.cognitive_account_sku_name

  custom_subdomain_name = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-${var.shortlocation}"

  identity {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this.id]
  }

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

# Create the Azure Cognitive Deployments
resource "azurerm_cognitive_deployment" "this" {
  for_each = {
    for key, value in var.cognitive_deployment :
    key => value
  }

  name     = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id
  
  model {
    format  = "OpenAI"
    name    = each.value.type
    version = each.value.version
  }

  scale {
    type = each.value.scale_type
  }
}
