resource "azurerm_virtual_network" "test-network" {
  name                = var.vpc_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_virtual_network.test-network.resource_group_name
  virtual_network_name = azurerm_virtual_network.test-network.name
  address_prefixes     = ["10.0.1.0/24"]
}

