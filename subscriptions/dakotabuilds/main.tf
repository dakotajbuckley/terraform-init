provider "azurerm" {
    features {
      
    }
}

resource "azurerm_resource_group" "dakotabuilds-rg" {
    name = "dakotabuilds-rg"
    location = "westus2"
}

resource "azurerm_storage_account" "dakotabuilds-sa" {
    name = "dakotabuilds-sa"
    resource_group_name = azurerm_resource_group.dakotabuilds-rg.name
    location = azurerm_resource_group.dakotabuilds-rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}