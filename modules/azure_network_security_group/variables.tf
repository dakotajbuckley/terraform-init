

  variable "network_security_group_name" {
    description = "The name of the network security group to be created"
    type = string
  }

  variable "location" {
    description = "The location of the network security group"
    type = string
  }

  variable "resource_group_name" {
      description = "The name of the resource group that will house the network security group"
      type = string
  }

  variable "security_rules" {
    description = "The rules that will be created in the network security group"
    type = map(object({
        priority = number
        direction = string
        access = string
        protocol = string
        source_port_range = string
        destination_port_ranges = list(string)
        source_address_prefixes = list(string)
        destination_address_prefix = string
        }))
  }

