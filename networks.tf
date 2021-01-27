resource "azurerm_virtual_network" "azvnet" {
  name                = "vNet-${var.location}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-dev.location
  resource_group_name = azurerm_resource_group.rg-dev.name
}

resource "azurerm_subnet" "net-dev" {
  name                 = "net-dev"
  resource_group_name  = azurerm_resource_group.rg-dev.name
  virtual_network_name = azurerm_virtual_network.azvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip-azvm01" {
  name                = "pip-azvm01"
  resource_group_name = azurerm_resource_group.rg-dev.name
  location            = azurerm_resource_group.rg-dev.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Development"
  }
}

