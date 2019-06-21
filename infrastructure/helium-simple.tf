

resource "azurerm_resource_group" "helium_resource" {
  name                             = "${var.resource_group_name}"
  location                         = "${var.resource_group_location}"
}

module "service_plan" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/service-plan"
  resource_group_name              = "${azurerm_resource_group.helium_resource.name}"
  service_plan_name                = "${var.service_plan_name}"
}

module "app_insights" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/app-insights"
  service_plan_resource_group_name = "${azurerm_resource_group.helium_resource.name}"
  appinsights_name                 = "${var.appinsights_name}"
  appinsights_application_type     = "${var.appinsights_application_type}"
  resource_tags                    = "${var.resource_tags}"
}

module "app_service" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/app-service"
  service_plan_resource_group_name = "${azurerm_resource_group.helium_resource.name}"
  service_plan_name                = "${module.service_plan.service_plan_name}"
  resource_tags                    = "${var.resource_tags}"
  app_service_name                 = "${var.app_service_name}"
  enable_storage                   = "${var.enable_storage}"
  vault_uri                        = "${module.keyvault.keyvault_uri}"
  docker_registry_server_url       = "${module.container_registry.container_registry_login_server}"
  docker_registry_server_username  = "${var.docker_registry_server_username}"
  docker_registry_server_password  = "${var.docker_registry_server_password}"
  app_insights_instrumentation_key = "${module.app_insights.app_insights_instrumentation_key}"
  site_config_always_on            = "${var.site_config_always_on}"
  vnet_name                        = "${var.vnet_name}"
  vnet_subnet_id                   = "${var.vnet_subnet_id}"
}

module "cosmosdb" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/cosmosdb"
  service_plan_resource_group_name = "${azurerm_resource_group.helium_resource.name}"
  cosmosdb_name                    = "${var.cosmosdb_name}"
  cosmosdb_kind                    = "${var.cosmosdb_kind}"
  cosmosdb_automatic_failover      = "${var.cosmosdb_automatic_failover}"
  consistency_level                = "${var.consistency_level}"
  primary_replica_location         = "${var.primary_replica_location}"
}

module "keyvault" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/keyvault"
  keyvault_name                    = "${var.keyvault_name}"
  keyvault_sku                     = "${var.keyvault_sku}"
  resource_group_name              = "${azurerm_resource_group.helium_resource.name}"
  keyvault_key_permissions         = "${var.keyvault_key_permissions}"
  keyvault_secret_permissions      = "${var.keyvault_secret_permissions}"
  keyvault_certificate_permissions = "${var.keyvault_certificate_permissions}"
  resource_tags                    = "${var.keyvault_resource_tags}"
}

module "container_registry" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/container-registry"
  container_registry_name          = "${var.container_registry_name}"
  resource_group_name              = "${azurerm_resource_group.helium_resource.name}"
  container_registry_sku           = "${var.container_registry_sku}"
  container_registry_admin_enabled = "${var.container_registry_admin_enabled}"
  container_registry_tags          = "${var.container_registry_tags}"
}

