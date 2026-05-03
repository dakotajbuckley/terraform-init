variable "vnet_name" {
    description = "The name of the vnet that will be created"
    type = string
}

variable "location" {
    description = "The region that the vnet and subnets will be created in"
    type = string
}

variable "resource_group_name" {
    description = "The name of the resource group that will house the vnet"
    type = string
}

variable "vnet_address_space" {
    description = "The ip range for the vnet"
    type = list(string)
}

variable "subnets" {
    description = "The name of the subnets you'd like created"
    type = map(list(string))
}