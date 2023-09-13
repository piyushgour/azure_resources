
# Terraform Azurerm Resource Creation

## Create a basic API Management in Azure

This Terraform module deploys a Virtual Network in Azure with a subnet or a set of subnets passed in as input parameters.

The module does not create nor expose a security group. You could use https://github.com/Azure/terraform-azurerm-vnet to assign network security group to the subnets.

### Configurations Azure Credentials

- [Configure Terraform for Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)

We assumed that you have setup service principal's credentials in your environment variables like below:

On Linux 

```shell
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
```

On Windows Powershell:

```shell
$env:ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
$env:ARM_TENANT_ID="<azure_subscription_tenant_id>"
$env:ARM_CLIENT_ID="<service_principal_appid>"
$env:ARM_CLIENT_SECRET="<service_principal_password>"
```

## Prerequisites 
 - provider.tf contains only provider information.
 - backend.tf contains beckend info if we put tfstate into remote location.

 ```hcl
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
        subscription_id = var.connectivity_subscription_id
        features {}
    }

    # Configure backend for tfstate file
    terraform {
        backend "azurerm" {
            resource_group_name  = "StorageAccount-ResourceGroup"
            storage_account_name = "terraform-backend"
            container_name       = "tfstate"
            key                  = "terraform.tfstate"
        }
    }

 
 ```

## Usage
 - in Root folder main.tf file to create new resources.
 - variables.tf file contains variables that referred in main.tf file. 
 - All resource.tf files containing code are located in the 'modules' folder with the respective naming convention. 

 

    ### Network creation for API Management 
    ```hcl
    resource "azurerm_resource_group" "rg" {
        name     = var.rg_name
        location = var.location
    }

    module "network" {
        source = "./modules/virtual_network"
        location = var.location
        resource_group_name = azurerm_resource_group.rg.name
  
    }
    ```
    ### API Management Resource Creation
    ```hcl
    module "api_management" {
        source = "./modules/api_management"
        api_management_name = "My-api"
        apim_rg = azurerm_resource_group.rg.name
        tags = merge(local.tags, {
        department = "IT"
        }) 

    }
    
    ```

    ### Service Plan Resource Creation

    ```hcl
    module "app_service_plan" {
        source = "./modules/app_service_plan"
        rg_name = azurerm_resource_group.rg.name
  
    }

    
    ```

Terraform :

1. This Terraform configuration defines an Azure Virtual Network, Subnet, API Management Service, and two App Service Plans (one for Staging and one for Production).<br>
`Initialize, plan and Apply` : Run the following commands to initialize your Terraform project and apply the configuration:
    ```shell
    terraform init
    terraform plan
    terraform apply
    ```
    Terraform will prompt you to confirm the resource creation. Type yes to proceed.<br>
2. `Review and Verify` : After Terraform completes the resource provisioning, review the Azure Portal or use the Azure CLI to verify that the resources were created as expected.<br>
3. `Clean Up (Optional)` : If needed, you can use terraform destroy to remove the created resources. Be cautious when running this command, as it will delete the resources defined in your Terraform configuration.<br>
    ```
    terraform destroy
    ```


## Providers

| Name                                                          | Version       |
|---------------------------------------------------------------|---------------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.45.0 |

## Authors

Originally created by [Piyush Gour](http://github.com/piyushgour)
