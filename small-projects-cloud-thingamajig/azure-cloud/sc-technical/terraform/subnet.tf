provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Define variable to store subnet names
variable "subnet_names" {
  type = list(string)
  description = "List of subnet names within the virtual network"
}

# Data source to retrieve subnet IDs for each name
data "azurerm_subnet" "all_subnets" {
  for_each = { for subnet in var.subnet_names : subnet => subnet }
  name     = each.value
  virtual_network_name = "12345-app-vnet"
  resource_group_name  = "12345-app-rg"
}

# Output the subnet IDs


output "subnet_names" {
    value = data.azurerm_subnet.all_subnets
    description = "Map of subnet names to their corresponding IDs"
}