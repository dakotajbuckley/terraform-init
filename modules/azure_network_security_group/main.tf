resource "azurerm_network_security_group" "this" {
    name = "dakotabuilds-nsg"
    location = var.location
    resource_group_name = var.resource_group_name
  }

  resource "azurerm_network_security_rule" "this" {
      for_each = var.security_rules
      name                        = each.key
      priority                    = each.value.priority
      direction                   = each.value.direction
      access                      = each.value.access
      protocol                    = each.value.protocol
      source_port_range          = each.value.source_port_range
      destination_port_ranges      = each.value.destination_port_ranges
      source_address_prefixes       = each.value.source_address_prefixes
      destination_address_prefix  = each.value.destination_address_prefix
      resource_group_name         = var.resource_group_name
      network_security_group_name = azurerm_network_security_group.this.name
  }

  resource "azurerm_subnet_network_security_group_association" "this" {
    for_each = var.subnet_ids_to_associate
    subnet_id = each.value
    network_security_group_id = azurerm_network_security_group.this.id
  }