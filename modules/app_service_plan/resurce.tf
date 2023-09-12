resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan
  location            = var.location 
  resource_group_name = var.rg_name
  os_type             = var.os_type
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app_slot" "stage-slot" {
  name           = "Staging"
  app_service_id = azurerm_service_plan.asp.id

  site_config {}
}

resource "azurerm_linux_web_app_slot" "prod-slot" {
  name           = "Production"
  app_service_id = azurerm_service_plan.asp.id

  site_config {

  }
}