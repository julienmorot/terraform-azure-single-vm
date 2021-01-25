resource "azurerm_resource_group" "rg-singlevm" {
  name     = "rg-singlevm"
  location = var.location
}

