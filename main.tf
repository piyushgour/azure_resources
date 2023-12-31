locals {
  tags = {
    environment = "dev"
    source = "terraform"
  }
}



resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "network" {
    source = "./modules/virtual_network"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
  
}


module "api_management" {
    source = "./modules/api_management"
    api_management_name = "My-api"
    apim_rg = azurerm_resource_group.rg.name
    tags = merge(local.tags, {
      department = "IT"
    })
    
    
}



module "app_service_plan" {
  source = "./modules/app_service_plan"
  rg_name = azurerm_resource_group.rg.name
  
}
