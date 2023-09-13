terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "terraform-backend"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
