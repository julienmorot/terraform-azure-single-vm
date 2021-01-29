resource "azurerm_network_security_group" "linuxserver" {
  name                = "linuxserver"
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
}

resource "azurerm_network_interface_security_group_association" "ssh-pub-azvm01" {
  network_interface_id      = azurerm_network_interface.nic-pub-azvm01.id
  network_security_group_id = azurerm_network_security_group.linuxserver.id
}
