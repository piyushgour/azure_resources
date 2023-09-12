resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan
  location            = var.location 
  resource_group_name = var.rg_name
  kind                = var.kind
  reserved            = true
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app_slot" "example-slot" {
  name           = "Staging"
  app_service_id = azurerm_linux_web_app.asp.id

  site_config {}
}

resource "azurerm_linux_web_app_slot" "example-slot" {
  name           = "Production"
  app_service_id = azurerm_linux_web_app.asp.id

  site_config {
    
  }
}