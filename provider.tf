terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.45.0"

    }
  }
}


# Configure the Azure Provider
provider "azurerm" {
  subscription_id = "XXXXXX-XXXX-XXXX-XXXXXX"
  features {}

}


