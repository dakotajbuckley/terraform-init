variable "resource_group_name" {
    description = "The resource group name to put the resource in"
    type = string
}

variable "location" {
    description = "The location to build the resources in"
    type = string
}

variable "nic_name" {
    description = "The name of the Network Interface Card to be created"
    type = string
}

variable "public_ip_name" {
    description = "The name of the public IP address to be create"
    type = string
}

variable "admin_username" {
    description = "The username to put on the created vm"
    type = string
}

variable "virtual_machine_name" {
    description = "The name of the virtual machine to be created"
    type = string
}

variable "subnet_id" {
    
}