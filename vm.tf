resource "azurerm_linux_virtual_machine" "azvm01" {
  name                            = "azvm01"
  resource_group_name             = azurerm_resource_group.rg-dev.name
  location                        = var.location[0]
  size                            = var.sizing["dev"]
  admin_username                  = var.lnxuser
  admin_password                  = var.lnxpwd
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic-azvm01.id,
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

resource "azurerm_network_interface" "nic-azvm01" {
  name                = "nic-azvm01"
  resource_group_name = azurerm_resource_group.rg-dev.name
  location            = var.location[0]

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
