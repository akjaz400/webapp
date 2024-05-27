resource "azurerm_resource_group" "webres" {
  name     = "webres-one"
  location = var.location
}

resource "azurerm_app_service_plan" "webplan" {
  name                = "webplan-one"
  location            = azurerm_resource_group.webres.location
  resource_group_name = azurerm_resource_group.webres.name

  sku {
    tier = "free"
    size = "f1"
  }
}

resource "azurerm_app_service" "websvc" {
  name                = "websvc-app-service"
  location            = azurerm_resource_group.webres.location
  resource_group_name = azurerm_resource_group.webres.name
  app_service_plan_id = azurerm_app_service_plan.webplan.id

}