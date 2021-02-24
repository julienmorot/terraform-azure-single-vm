resource "azurerm_resource_group" "rg-dev" {
  name     = "rg-dev"
  location = var.location[0]
  tags = {
    environment = "Development"
  }
}

