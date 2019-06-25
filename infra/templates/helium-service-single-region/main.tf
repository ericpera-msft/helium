locals {
  name                = "heliumtest-service-single-region"
  prefix              = "${lower(local.name)}-${lower(terraform.workspace)}"
  db_name             = "${local.prefix}-db"
}

module "az-service-single-region" {
  source                   = "github.com/microsoft/cobalt/infra/templates/az-service-single-region"
  name                     = local.name
  application_type         = "Node.JS"
  resource_group_location  = "eastus"
  acr_build_git_source_url = "https://github.com/Microsoft/helium.git"
  app_service_name         = { helium-backend-api = "heliumtest-service-single-region:0.1" }
}

module "cosmosdb" {
  source                           = "github.com/microsoft/cobalt/infra/modules/providers/azure/cosmosdb"
  service_plan_resource_group_name = module.az-service-single-region.service_plan_resource_group_name
  cosmosdb_name                    = local.db_name
  cosmosdb_kind                    = "GlobalDocumentDB"
  cosmosdb_automatic_failover      = "false"
  consistency_level                = "Session"
  primary_replica_location         = "eastus"
}
