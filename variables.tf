variable "lnxuser" {
  type    = string
  default = "super"
}

variable "lnxpwd" {
  type    = string
  default = "Azerty37!"
}

variable "sizing" {
  type = map(string)

  default = {
    dev  = "Standard_B1ls"
    prod = "Standard_B2s"
  }
}

variable "location" {
  type    = list(string)
  default = ["westeurope", "northeurope"]
}
