variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = "string"
}

variable "resource_group_location" {
  description = "The deployment location of resource group container all the resources"
  default     = "eastus"
}

variable "service_plan_name" {
  description = "The name of the service plan to be deployed."
  type        = "string"
}

variable "app_service_name" {
  description = "The name of the app service to be created"
  type        = map(string)
  default     = {}
}

variable "enable_storage" {
  description = "Determines whether or not a storage is attached to the app service."
  type        = bool
  default     = false
}

variable "vault_uri" {
  description = "Specifies the URI of the Key Vault resource. Providing this will create a new app setting called KEYVAULT_URI containing the uri value."
  type        = string
  default     = ""
}

variable "docker_registry_server_url" {
  description = "The docker registry server URL for app service to be created"
  type        = string
  default     = "index.docker.io"
}

variable "docker_registry_server_username" {
  description = "The docker registry server username for app service to be created"
  type        = string
  default     = ""
}

variable "docker_registry_server_password" {
  description = "The docker registry server password for app service to be created"
  type        = string
  default     = ""
}

variable "app_insights_instrumentation_key" {
  description = "The Instrumentation Key for the Application Insights component used for app service to be created"
  type        = string
  default     = ""
}

variable "site_config_always_on" {
  description = "Should the app be loaded at all times? Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_name" {
  description = "The vnet integration name"
  type        = string
  default     = ""
}

variable "vnet_subnet_id" {
  description = "The vnet integration subnet gateway identifier."
  type        = string
  default     = ""
}

variable "appinsights_name" {
  description = "Name of the App Insights to create"
  type        = "string"
}

variable "appinsights_application_type" {
  description = "Type of the App Insights Application"
  type        = "string"
  default     = "Node.JS"
}

variable "resource_tags" {
  description = "Map of tags to apply to taggable resources in this module.  By default the taggable resources are tagged with the name defined above and this map is merged in"
  type        = "map"
  default     = {}
}

variable "cosmosdb_name" {
  description = "The name that CosmosDB will be created with."
  type        = "string"
}

variable "cosmosdb_kind" {
  description = "Determines the kind of CosmosDB to create. Can either be 'GlobalDocumentDB' or 'MongoDB'."
  type        = "string"
  default     = "GlobalDocumentDB"
}

variable "cosmosdb_automatic_failover" {
  description = "Determines if automatic failover is enabled for the created CosmosDB."
  default     = false
}

variable "consistency_level" {
  description = "The Consistency Level to use for this CosmosDB Account. Can be either 'BoundedStaleness', 'Eventual', 'Session', 'Strong' or 'ConsistentPrefix'."
  type        = "string"
  default     = "Session"
}

variable "primary_replica_location" {
  description = "The name of the Azure region to host replicated data."
  type        = "string"
}

variable "keyvault_name" {
  description = "Name of the keyvault to create"
  type        = "string"
  default     = "spkeyvault"
}

variable "keyvault_sku" {
  description = "SKU of the keyvault to create"
  type        = "string"
  default     = "standard"
}

variable "keyvault_key_permissions" {
  description = "Permissions that the service principal has for accessing keys from KeyVault"
  type        = "list"
  default     = ["create", "delete", "get"]
}

variable "keyvault_secret_permissions" {
  description = "Permissions that the service principal has for accessing secrets from KeyVault"
  type        = "list"
  default     = ["set", "delete", "get", "list"]
}

variable "keyvault_certificate_permissions" {
  description = "Permissions that the service principal has for accessing certificates from KeyVault"
  type        = "list"
  default     = ["create", "delete", "get", "list"]
}

variable "keyvault_resource_tags" {
  description = "Map of tags to apply to taggable resources in this module.  By default the taggable resources are tagged with the name defined above and this map is merged in"
  type        = "map"
  default     = {}
}

variable "container_registry_name" {
  description = "(Required) Specifies the name of the Container Registry. Changing this forces a new resource to be created."
  type        = "string"
}

variable "container_registry_admin_enabled" {
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
  default     = false
}

variable "container_registry_sku" {
  description = "(Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium."
  type        = "string"
  default     = "Basic"
}

variable "container_registry_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = "map"
  default     = {}
}