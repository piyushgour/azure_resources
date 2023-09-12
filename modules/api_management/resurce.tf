
resource "azurerm_api_management" "apim" {
  name                                = var.api_management_name
  location                            = var.location
  resource_group_name                 = var.apim_rg
  publisher_name                      = var.api_publisher_name
  publisher_email                     = var.api_publisher_email
  sku_name                            = var.sku_name
  virtual_network_type                = var.api_vnet_type
  #zones                               = [ 1, 2, 3]
  virtual_network_configuration {
      subnet_id                       = var.apim_subnet_id
  }
  timeouts {
    create = "2h10m"
    update = "2h"
    delete = "20m"
  }
  tags =    var.Tags
}

 

resource "azurerm_application_insights" "insight" {
  name                = var.insight_name
  location            = var.location
  resource_group_name = var.apim_rg
  application_type    = "web"
}

 

resource "azurerm_api_management_logger" "logger" {
  name                = var.logger_name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = var.apim_rg
  application_insights {
    instrumentation_key = azurerm_application_insights.insight.instrumentation_key
  }
}

