resource "azurerm_resource_group" "dakotabuilds-rg" {
    name = "dakotabuilds-rg"
    location = "westus2"
}

resource "azurerm_storage_account" "dakotabuilds" {
    name = "dakotabuilds"
    resource_group_name = azurerm_resource_group.dakotabuilds-rg.name
    location = azurerm_resource_group.dakotabuilds-rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "dakotabuild-terraform-state" {
    name = "dakotabuilds-terraform-state"
    storage_account_id = azurerm_storage_account.dakotabuilds.id
    container_access_type = "private"
}

resource "azurerm_dns_zone" "dakotabuilds-dns-zone" {
    name = "dakotabuilds.dev"
    resource_group_name = azurerm_resource_group.dakotabuilds-rg.name
}

resource "azurerm_dns_a_record" "test" {
    name = "test"
    zone_name = azurerm_dns_zone.dakotabuilds-dns-zone.name
    resource_group_name = azurerm_dns_zone.dakotabuilds-dns-zone.resource_group_name
    ttl = 300
    records = ["76.149.229.188"]
}

module "azure_virtual_network" {
    source = "../../modules/azure_virtual_network"
    resource_group_name = azurerm_resource_group.dakotabuilds-rg.name
    location = azurerm_resource_group.dakotabuilds-rg.location
    vnet_name = "dakotabuilds-vnet"
    vnet_address_space = ["10.0.0.0/16"]
    subnets = {
      "dakotabuilds-snet-01" = ["10.0.10.0/24"]
      "dakotabuilds-snet-02" = ["10.0.20.0/24"]
      "dakotabuilds-snet-03" = ["10.0.30.0/24"]
    }
}