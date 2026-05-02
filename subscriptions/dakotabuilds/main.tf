provider "azurerm" {
    features {
      
    }
}

resource "azurerm_resource_group" "dakotabuilds-rg" {
    name = "rg-01"
    location = "westus2"

}