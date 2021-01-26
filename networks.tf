resource "azurerm_virtual_network" "azvnet" {
  name                = "vNet-${var.location}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-singlevm.location
  resource_group_name = azurerm_resource_group.rg-singlevm.name
}

resource "azurerm_subnet" "net-dev" {
  name                 = "net-dev"
  resource_group_name  = azurerm_resource_group.rg-singlevm.name
  virtual_network_name = azurerm_virtual_network.azvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

