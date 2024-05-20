################################
## Azure Provider - Variables ##
################################

# Azure authentication variables

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "azure_client_id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure Client Secret"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

#############################
## Application - Variables ##
#############################

# Company name 
variable "company" {
  type        = string
  description = "This variable defines the company name used to build resources"
}

# Application name 
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

# Environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

# Azure region
variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "west europe"
}

# Azure short region
variable "shortlocation" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "we"
}

####################################
## Cognitive Services - Variables ##
####################################

variable "cognitive_account_sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Cognitive Service Account"
  default     = "S0"
}

variable "cognitive_account_kind_name" {
  type        = string
  description = "Specifies the SKU Name for this Cognitive Service Account"
  default     = "OpenAI"
}

variable "cognitive_deployment" {
  description = "List of Cognitive Deployments"
  type = list(object({
    name       = string
    type       = string
    version    = string
    scale_type = string
  }))
  default = [
    {
      name       = "gpt35"
      type       = "gpt-35-turbo"
      version    = "0301"
      scale_type = "Standard"
    }
  ]
}

#########################
## Logging - Variables ##
#########################

variable "log_analytics_retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730"
  default     = 30
}

variable "log_analytics_sku" {
  type        = string
  description = "Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018"
  default     = "PerGB2018"
}