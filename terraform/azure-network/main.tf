# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 1. Create a Resource Group
resource "azurerm_resource_group" "network_rg" {
  name     = "Cloudfide-Lab-RG"
  location = "West Europe"
}

# 2. Create a Virtual Network
resource "azurerm_virtual_network" "main_vnet" {
  name                = "production-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
}

# 3. Create a Subnet for AKS
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-internal-subnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
