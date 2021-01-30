resource "azurerm_network_security_group" "nsg-linuxserver" {
  name                = "nsg-linuxserver"
  location            = azurerm_resource_group.rg-dev.location
  resource_group_name = azurerm_resource_group.rg-dev.name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "ssh"
    priority                   = 100
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "22"
    destination_address_prefix = "*"
  }
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "ping"
    priority                   = 110
    protocol                   = "Icmp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsgassoc-azvm01" {
  network_interface_id      = azurerm_network_interface.nic-azvm01.id
  network_security_group_id = azurerm_network_security_group.nsg-linuxserver.id
}
