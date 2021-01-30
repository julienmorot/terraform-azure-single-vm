resource "random_id" "randomId" {
  keepers = {
    resource_group = azurerm_resource_group.rg-dev.name
  }
  byte_length = 8
}

resource "azurerm_storage_account" "sa-bootdiags" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.rg-dev.name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags = {
    environment = "Development"
  }
}

