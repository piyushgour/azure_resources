resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "network" {
    source = "./modules/virtual_network"
    name     = "my-resources"
    location = "West Europe"
    resource_group_name = azurerm_resource_group.rg.name
  
}


module "api_management" {
    source = "./modules/api_management"
    resource_group_name = azurerm_resource_group.rg.name
    subnet_id = module.azurerm_subnet.example.subnet_id
}



module "app_service_plan" {
  source = "./modules/app_service_plan"
  name = "appserviceplan"
  reserved = var.reserved
  resource_group_name = azurerm_resource_group.rg.name
}
