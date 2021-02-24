resource "azurerm_managed_disk" "disk01-azvm01" {
  name                 = "disk01-azvm01"
  location             = azurerm_resource_group.rg-dev.location
  create_option        = "Empty"
  disk_size_gb         = 9
  resource_group_name  = azurerm_resource_group.rg-dev.name
  storage_account_type = "Standard_LRS"
  tags = {
    environment = "Development"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "data" {
  virtual_machine_id = azurerm_linux_virtual_machine.azvm01.id
  managed_disk_id    = azurerm_managed_disk.disk01-azvm01.id
  lun                = 0
  caching            = "None"
}

