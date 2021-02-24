output "azvm01-pip" {
#  value = azurerm_public_ip.pip-azvm01.ip_address
value = azurerm_linux_virtual_machine.azvm01.public_ip_address
}

