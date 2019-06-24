# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myVirtualNetwork"
  location            = "${azurerm_resource_group.rg.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

#Create subnet
resource "azurerm_subnet" "defaultsubnet" {
  name                 = "defaultSubnet"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.default_subnet_prefix}"
}

resource "azurerm_subnet" "sqlsubnet" {
  name                 = "sqlSubnet"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.sql_subnet_prefix}"
}

#Create route table
resource "azurerm_route_table" "routetable" {
  name                          = "defaultRouteTable"
  location                      = "${azurerm_resource_group.rg.location}"
  resource_group_name           = "${azurerm_resource_group.rg.name}"
  disable_bgp_route_propagation = false
}