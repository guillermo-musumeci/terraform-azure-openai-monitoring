# Sending Azure OpenAI Logs and Events to Azure Log Analytics using Terraform
[![Terraform](https://img.shields.io/badge/terraform-v1.5+-blue.svg)](https://www.terraform.io/downloads.html)

## Overview

How to send Azure OpenAI Logs and Events to Azure Log Analytics using Terraform

## Code creates:

- Resource Group for Network
- Azure OpenAI/Cognitive Service Instance
- Azure OpenAI/Cognitive Service Deployment
- Azure Log Analyzer Workspave

## Azure OpenAI Service Instance Variables

List of variables used in this code to configure the Azure OpenAI Service Instance

Variable | Description | Type
--- | --- | ---
`region` | The region in which this module should be deployed | `string`
`cognitive_account_sku_name` | Specifies the SKU Name for this Cognitive Service Account. Default: S0 | `string`
`cognitive_account_kind_name` | Specifies the type of Cognitive Service Account that should be created. Default: OpenAI | `string`

> Note: `cognitive_account_kind_name` Possible values are Academic, AnomalyDetector, Bing.Autosuggest, Bing.Autosuggest.v7, Bing.CustomSearch, Bing.Search, Bing.Search.v7, Bing.Speech, Bing.SpellCheck, Bing.SpellCheck.v7, CognitiveServices, ComputerVision, ContentModerator, CustomSpeech, CustomVision.Prediction, CustomVision.Training, Emotion, Face, FormRecognizer, ImmersiveReader, LUIS, LUIS.Authoring, MetricsAdvisor, OpenAI, Personalizer, QnAMaker, Recommendations, SpeakerRecognition, Speech, SpeechServices, SpeechTranslation, TextAnalytics, TextTranslation and WebLM.

## Azure OpenAI Deployments Variables

Variable | Description | Type
--- | --- | ---
`cognitive_deployment` | List of Azure OpenAI Cognitive Deployments | `list(object)`
  
- name       = string --> Name of the Deployment
- type       = string --> Type of the Deployment
- version    = string --> Version of the Deployment
- scale_type = string --> Scale Type of the Deployment

Default:

```
default = [
  {
    name       = "gpt35"
    type       = "gpt-35-turbo"
    version    = "0301"
    scale_type = "Standard"
  }
]
```

## Azure Log Analyzer Variables

Variable | Description | Type
--- | --- | ---
`log_analytics_retention_in_days` | The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. Default: 30 | `string`
`log_analytics_sku` | Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018. Default: PerGB2018 | `string`

## How To deploy the code:

- Clone the repo
- Update variables to your environment
- Execute "terraform init"
- Execute "terraform apply"


