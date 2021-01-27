resource "azurerm_linux_virtual_machine" "azvm01" {
  name                            = "azvm01"
  resource_group_name             = azurerm_resource_group.rg-dev.name
  location                        = var.location
  size                            = "Standard_B1ls"
  admin_username                  = var.lnxuser
  admin_password                  = var.lnxpwd
  disable_password_authentication = false
  #public_ip_addresses = azurerm_public_ip.ip-pub-azvm01 
  network_interface_ids = [
    azurerm_network_interface.nic-int-azvm01.id,
    azurerm_network_interface.nic-pub-azvm01.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  tags = {
    environment = "Development"
  }
}

resource "azurerm_network_interface" "nic-int-azvm01" {
  name                = "nic-int-azvm01"
  resource_group_name = azurerm_resource_group.rg-dev.name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.net-dev.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "Development"
  }
}

resource "azurerm_network_interface" "nic-pub-azvm01" {
  name                = "nic-pub-azvm01"
  resource_group_name = azurerm_resource_group.rg-dev.name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.net-dev.id
    private_ip_address_allocation = "Dynamic"
public_ip_address_id          = azurerm_public_ip.pip-azvm01.id
  }
  tags = {
    environment = "Development"
  }
}
